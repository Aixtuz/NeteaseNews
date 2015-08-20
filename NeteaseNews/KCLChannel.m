
//
//  KCLChannel.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLChannel.h"

@implementation KCLChannel

// 封装字典转模型的初始化方法
+ (instancetype)channelWithDict:(NSDictionary *)dict {
    
    // 实例化
    KCLChannel *channel = [KCLChannel new];
    // KVC
    [channel setValuesForKeysWithDictionary:dict];
    // 返回
    return channel;
}

// no property for a given key 时, setValue:forKey: 调用:
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

// 本地 JSON, 无需异步回调, 直接加载
+ (NSArray *)channels {
    
    // 获取 JSON 文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"channel_list" ofType:@"json"];
    
    // 加载数据
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    // JSON 反序列化
    NSDictionary *dictData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // 获取数据
    NSArray *array = dictData[@"tList"];
    
    // 存储模型数据
    NSMutableArray *mArray = [NSMutableArray array];
    
    // 遍历字典转模型
    for (NSDictionary *dict in array) {
        
        // 封装字典转模型的初始化
        KCLChannel *channel = [KCLChannel channelWithDict:dict];
        // 汇总存储
        [mArray addObject:channel];
    }
    // 按 tid 排序数据
    return [mArray sortedArrayUsingComparator:^NSComparisonResult(KCLChannel *obj1, KCLChannel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
}

@end
