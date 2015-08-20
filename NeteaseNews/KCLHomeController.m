//
//  KCLHomeController.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLHomeController.h"
#import "KCLChannel.h"
#import "KCLLabel.h"

@interface KCLHomeController () <UICollectionViewDataSource, UICollectionViewDelegate>

// 频道区域
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
// 新闻区域
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
// 布局属性
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

// 数据模型数组
@property (nonatomic, strong) NSArray *channels;

@end

@implementation KCLHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载频道列表
    [self loadChannels];
    
    // 设置布局
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

// 重写数据模型数组的 getter 方法
- (NSArray *)channels {
    
    if (_channels == nil) {
        _channels = [KCLChannel channels];
    }
    return _channels;
}

// 加载频道列表
- (void)loadChannels {
    
    // 高度, 间隔, 初始 x 坐标
    CGFloat height = self.scrollView.bounds.size.height;
    CGFloat marginX = 5;
    CGFloat x = marginX;
    
    // 遍历数据模型
    for (KCLChannel *channel in self.channels) {
        
        // 实例化自定义 Label
        KCLLabel *label = [KCLLabel labelWithTName:channel.tname];
        
        // 归属
        [self.scrollView addSubview:label];
        
        // Frame
        CGFloat width = label.bounds.size.width;
        label.frame = CGRectMake(x, 0, width, height);
        x += width + marginX;
        
        // 位置: 导航控制器的子控制器中有 ScrollView, 则自动产生 64 间距, 实现穿透效果
        // 禁用此自动间距
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    // 设置滚动范围 (x: 累加到最后一个label)
    self.scrollView.contentSize = CGSizeMake(x, 0);
    // 滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
}


@end

