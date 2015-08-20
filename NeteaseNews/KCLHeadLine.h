//
//  KCLHeadLine.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/17.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <Foundation/Foundation.h>

// HeadLine 的数据模型
@interface KCLHeadLine : NSObject

// 标题
@property (nonatomic, copy) NSString *title;
// 图片地址
@property (nonatomic, copy) NSString *imgsrc;


// 封装字典转模型 的 初始化方法
+ (instancetype)headLineWithDict:(NSDictionary *)dict;

// 异步请求, 回调数据(调用转模型方法)
+ (void)headLines:(void (^)(NSArray *))completion;

@end
