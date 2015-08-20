//
//  KCLChannel.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCLChannel : NSObject

// 频道名
@property (nonatomic, copy) NSString *tname;
// 频道 ID
@property (nonatomic, copy) NSString *tid;


// 封装字典转模型的初始化方法
+ (instancetype)channelWithDict:(NSDictionary *)dict;

// 本地 JSON, 无需异步回调, 直接加载
+ (NSArray *)channels;

@end
