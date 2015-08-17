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
    
    // 测试: headLines: 方法的回调数据
    [KCLHeadLine headLines:^(NSArray *array) {
        NSLog(@"%@", array);
    }];
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
