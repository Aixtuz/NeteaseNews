//
//  KCLNetworkTools.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/17.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface KCLNetworkTools : AFHTTPSessionManager

// 单例对象的初始化方法
+ (instancetype)shareNetworkTools;

@end
