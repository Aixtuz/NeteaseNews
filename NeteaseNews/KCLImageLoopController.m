//
//  KCLImageLoopController.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/18.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLImageLoopController.h"
#import "KCLHeadLine.h"
#import "KCLHeadLineCell.h"

@interface KCLImageLoopController ()

// 模型数组
@property (nonatomic, strong) NSArray *headLines;
// 布局属性
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
// 当前图片索引
@property (nonatomic, assign) NSInteger imgIndex;

@end

@implementation KCLImageLoopController

static NSString * const reuseIdentifier = @"headline";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 回调 GET 取得的数据
    [KCLHeadLine headLines:^(NSArray *array) {
        
        // 测试: headLines: 方法的回调数据
        NSLog(@"\nImageLoop数据:\n%@", array);
        
        // 属性存储数据(Setter)
        self.headLines = array;
        //!!! 异步请求, 获取数据, 此前已执行数据源方法(无数据)
    }];
    
    // 设置 Cell 样式
    // 尺寸
    self.flowLayout.itemSize = self.collectionView.bounds.size;
    // 横间距
    self.flowLayout.minimumInteritemSpacing = 0;
    // 纵间距
    self.flowLayout.minimumLineSpacing = 0;
    // H: 横向浮动, V: 纵向浮动
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 分页
    self.collectionView.pagingEnabled = YES;
    // 滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

// 设置布局
- (void)viewDidLayoutSubviews {
    
    // 自动布局完成后, 设置 Cell 尺寸
    self.flowLayout.itemSize = self.collectionView.bounds.size;
}

// 重写 setter 方法
- (void)setHeadLines:(NSArray *)headLines {
    
    // 先赋予属性, 保持 getter 取值一致
    _headLines = headLines;
    
    // 异步请求, 获取数据, 属性存储后, 刷新数据
    [self.collectionView reloadData];
    
    // indexPath.item: 0 - 1, 加载第二个 Cell, 显示第一张 img
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
}

#pragma mark - <UICollectionViewDataSource>

// 返回 Cell 数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.headLines.count;
}

// 返回 Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 实例化 自定义 Cell
    KCLHeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    /*
     0. 初始 item = 1
     
     1. currentItem = 1, nextItem = 2, imgIndex = 0:
     currentData : item(1) - 1 + imgIndex(0) => (0 + count(4)) % count(4) = 0
     nextData    : item(2) - 1 + imgIndex(0) => (1 + count(4)) % count(4) = 1
     
     2. currentItem = 2, nextItem = 3, imgIndex = 1:
     currentData : item(2) - 1 + imgIndex(1) => (2 + count(4)) % count(4) = 2
     nextData    : item(3) - 1 + imgIndex(1) => (3 + count(4)) % count(4) = 3
     
     // 循环, 无限滚动
     3. currentItem = 3, nextItem = 0, imgIndex = 2:
     currentData : item(3) - 1 + imgIndex(2) => (4 + count(4)) % count(4) = 0
     nextData    : item(0) - 1 + imgIndex(2) => (1 + count(4)) % count(4) = 1
     */
    // Cell: N 显示 Data: N - 1
    NSInteger index = (indexPath.item - 1 + self.imgIndex + self.headLines.count) % self.headLines.count;
    
    // 保存 Cell 序号
    // cell.tag = indexPath.item;
    cell.tag = index;
    
    // 传递 Cell 模型数据
    // cell.headLine = self.headLines[indexPath.item];
    cell.headLine = self.headLines[index];
    
    return cell;
}

// CollectionView 监听滚动减速
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    /*
     滑动完毕, 回归复用 Cell: 0 - 1,
     左: 0 - 0, offset: 0 * width;
     右: 0 - 2, offset: 2 * width;
     // -1, 得 -/+1, 左-右+;
     */
    int offset = scrollView.contentOffset.x / scrollView.bounds.size.width - 1;
    
    // 计算 imgIndex, 根据滚动方法 +/-1, 取余循环
    self.imgIndex = (self.imgIndex + offset + self.headLines.count) % self.headLines.count;
    
    // 滑动完毕, 立刻 回到 第二个 Cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
}



@end
