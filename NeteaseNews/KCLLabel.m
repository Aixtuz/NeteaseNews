//
//  KCLLabel.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#define kBIGFONT 18.0
#define kSMALLFONT 14.0

#import "KCLLabel.h"

@implementation KCLLabel

// 自定义 Label 的便利构造器
+ (instancetype)labelWithTName:(NSString *)tname {
    
    // 实例化
    KCLLabel *label = [self new];
    // 标题
    label.text = tname;
    // 对齐
    label.textAlignment = NSTextAlignmentCenter;
    // 颜色
    label.textColor = [UIColor darkGrayColor];
    // 大字体
    label.font = [UIFont systemFontOfSize:kBIGFONT];
    // 大字体自适应尺寸
    [label sizeToFit];
    // 小字体, 保留大字体的尺寸
    label.font = [UIFont systemFontOfSize:kSMALLFONT];
    
    return label;
}

// 重写 Scale 的 Setter 方法
- (void)setScale:(CGFloat)scale {
    
    // 只计算增大部分比例, 确保最小比例为 1
    CGFloat maxScale = kBIGFONT / kSMALLFONT - 1;
    self.transform = CGAffineTransformMakeScale(maxScale * scale + 1, maxScale * scale + 1);
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
}

@end
