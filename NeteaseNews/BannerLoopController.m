//
//  BannerLoopController.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/17.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "BannerLoopController.h"
#import "KCLHeadLine.h"
#import "KCLHeadLineCell.h"

@interface BannerLoopController ()

// 模型数组
@property (nonatomic, strong) NSArray *headLines;

@end

@implementation BannerLoopController

static NSString * const reuseIdentifier = @"headline";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 回调 GET 取得的数据
    [KCLHeadLine headLines:^(NSArray *array) {
        
        // 测试: headLines: 方法的回调数据
        NSLog(@"%@", array);
        
        // 属性存储数据(Setter)
        self.headLines = array;
        //!!! 异步请求, 获取数据, 此前已执行数据源方法(无数据)
    }];
}

// 重写 setter 方法
- (void)setHeadLines:(NSArray *)headLines {
    
    // 先赋予属性, 保持 getter 取值一致
    _headLines = headLines;
    
    // 异步请求, 获取数据, 属性存储后, 刷新数据
    [self.collectionView reloadData];
    
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    // items count
    return self.headLines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 实例化 自定义 Cell
    KCLHeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 保存 Cell 序号
    cell.tag = indexPath.item;
    // 传递 Cell 模型数据
    cell.headLine = self.headLines[indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

@end
