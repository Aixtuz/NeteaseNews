//
//  KCLHomeCell.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLHomeCell.h"
#import "KCLTableViewController.h"

@interface KCLHomeCell ()

// awakeFromNib 中 tvc 执行数据源方法 前 被释放, 无显示数据, 故属性强指针引用
@property (nonatomic, strong) KCLTableViewController *tvc;

@end

@implementation KCLHomeCell

// has been loaded from an IB archive, or nib file.
- (void)awakeFromNib {
    
    // 加载 Storyboard, 自动布局之后, 才能设置子控件尺寸
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    // 加载初始化控制器
    self.tvc = [sb instantiateInitialViewController];
    
    // collectionViewCell 添加 tabelView.view
    [self addSubview:self.tvc.view];
}

// 自动布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 尺寸: 子控件加载完毕, 设置尺寸才生效: tvc.view = HomeCell
    self.tvc.view.frame = self.bounds;
}

@end

