//
//  KCLNetworkTools.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/17.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLNetworkTools.h"

@implementation KCLNetworkTools

// 单例对象的初始化方法
+ (instancetype)shareNetworkTools {
    
    // 静态变量
    static id instance = nil;
    
    // Dispatch Once: GCD 一次性代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 上下载参数配置对象
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        // BaseUrl
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        
        // 单例网络工具
        instance = [[self alloc] initWithBaseURL:baseURL sessionConfiguration:config];
        
    });
    return instance;
}

@end
