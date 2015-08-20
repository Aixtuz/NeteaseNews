//
//  KCLNews.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/18.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLNews.h"
#import "KCLNetworkTools.h"

@implementation KCLNews

// 封装字典转模型的构造方法
+ (instancetype)newsWithDict:(NSDictionary *)dict {
    
    // 实例化模型对象
    KCLNews *news = [KCLNews new];
    
    // KVC
    [news setValuesForKeysWithDictionary:dict];
    
    return news;
}

// no property for a given key 时, setValue:forKey: 调用:
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

// 异步请求, 返回数据, 转为模型数组
+ (void)newsListWithUrl:(NSString *)urlStr completion:(void (^)(NSArray *))completion {
    
    // 断言: 判断条件, 不成立则抛出异常
    NSAssert(completion != nil, @"异常描述: newsList 回调 conpletion 不能为空!");
    
    // responseSerializer: JSON 解析类型
    [KCLNetworkTools shareNetworkTools].responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    
    // 单例 + GET 请求
    [[KCLNetworkTools shareNetworkTools] GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *dict) {
        
        // 获取数组 headline_ad, key枚举器获取首元素
        NSString *firstKey = dict.keyEnumerator.nextObject;
        // 首元素地址标识数组
        NSArray *array = dict[firstKey];
        
        // 字典转模型, 存入数组
        NSMutableArray *mArray = [NSMutableArray array];
        // 遍历, (封装字典转模型)初始化, 数组存储
        for (NSDictionary *dict in array) {
            
            // 模型存入数组
            KCLNews *news = [KCLNews newsWithDict:dict];
            [mArray addObject:news];
        }
        
        // 回调函数, 在 Controller 中测试回调数据
        if (completion) {
            completion(mArray.copy);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
