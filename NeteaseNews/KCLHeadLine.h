//
//  KCLHeadLine.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/17.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCLHeadLine : NSObject

// 标题
@property (nonatomic, copy) NSString *title;
// 图片地址
@property (nonatomic, copy) NSString *imgSrc;

// 封装字典转模型 的 初始化方法
+ (instancetype)headLineWithDict:(NSDictionary *)dict;

@end
