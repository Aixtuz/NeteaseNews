//
//  KCLLabel.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCLLabel : UILabel

// 缩放系数
@property (nonatomic, assign) CGFloat scale;

// 自定义 Label 的便利构造器
+ (instancetype)labelWithTName:(NSString *)tname;

@end
