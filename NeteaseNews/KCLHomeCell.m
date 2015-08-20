//
//  KCLHomeCell.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLHomeCell.h"
#import "KCLNewsController.h"

@interface KCLHomeCell ()

// awakeFromNib 中 nc 执行数据源方法 前 被释放, 无显示数据, 故属性强指针引用
@property (nonatomic, strong) KCLNewsController *nc;

@end

@implementation KCLHomeCell

// 重写 urlStr 的 Setter 方法
- (void)setUrlStr:(NSString *)urlStr {
    
    // 中途传递, 不必赋予属性保存
    // _urlStr = urlStr;

    // HomeCell 传递 urlStr 给 NewsController
    self.nc.urlStr = urlStr;
}

// has been loaded from an IB archive, or nib file.
- (void)awakeFromNib {
    
    // 加载 Storyboard, 自动布局之后, 才能设置子控件尺寸
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    // 加载初始化控制器
    self.nc = [sb instantiateInitialViewController];
    
    // collectionViewCell 添加 tabelView.view
    [self addSubview:self.nc.view];
}

// 自动布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 尺寸: 子控件加载完毕, 设置尺寸才生效: nc.view = HomeCell
    self.nc.view.frame = self.bounds;
}

@end

