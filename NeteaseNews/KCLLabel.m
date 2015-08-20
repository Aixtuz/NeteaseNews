//
//  KCLLabel.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#define kBIGFONT 18
#define kSMALLFONT 14

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
    label.textColor = [UIColor lightGrayColor];
    // 大字体
    label.font = [UIFont systemFontOfSize:kBIGFONT];
    // 大字体自适应尺寸
    [label sizeToFit];
    // 小字体, 保留大字体的尺寸
    label.font = [UIFont systemFontOfSize:kSMALLFONT];
    
    return label;
}

@end
