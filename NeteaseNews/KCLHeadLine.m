//
//  KCLHeadLine.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/17.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <objc/runtime.h>

#import "KCLHeadLine.h"
#import "KCLNetworkTools.h"

@implementation KCLHeadLine

+ (instancetype)headLineWithDict:(NSDictionary *)dict {
    
    // 创建模型对象
    KCLHeadLine *headLine = [self new];
    
    // 字典属性多于模型属性, 故无法使用 KVC
    // [headLine setValuesForKeysWithDictionary:dict];
    
    // 遍历属性数组, 取出属性名
    for (NSString *name in [self getProperties]) {
        [headLine setValue:dict[name] forKey:name];
    }
    return headLine;
}

// 异步请求, 获取数据, 转为模型数组
// 回调函数 (void (^)(NSArray *))completion { } 传递给 Controller
+ (void)headLines:(void (^)(NSArray *))completion {
    
    /*
     App Transport Security has blocked a cleartext HTTP resource load since it is insecure.
     - 配置 Plist: NSAppTransportSecurity -> YES/True
     */
    // GET 请求
    [[KCLNetworkTools shareNetworkTools] GET:@"ad/headline/0-4.html" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *dict) {
        /*
         object         {1}
         headline_ad     [4]
         0               {title, tag, subtitle, imgsrc, url}
         1               {5}
         2               {5}
         3               {5}
         */
        
        // 获取数组 headline_ad, key枚举器获取首元素
        NSString *firstKey = dict.keyEnumerator.nextObject;
        // 首元素地址标识数组
        NSArray *array = dict[firstKey];
        
        // 字典转模型
        NSMutableArray *mArray = [NSMutableArray array];
        // 遍历, (封装字典转模型)初始化, 数组存储
        for (NSDictionary *dict in array) {
            
            // 封装字典转模型的模型初始化方法
            KCLHeadLine *headLine = [self headLineWithDict:dict];
            // 模型存入数组
            [mArray addObject:headLine];
        }
        // 执行回调函数
        if (completion) {
            completion(mArray.copy);
        }
        // 回调后在 Controller 中测试数据

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

// 获取当前类的所有属性, 运行时: #import <objc/runtime.h>
+ (NSArray *)getProperties {
    
    unsigned int count;
    // 获取当前类所有属性, 返回属性数组(首地址, 首元素指针)
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    // 存储 OC 字符串数组
    NSMutableArray *mArray = [NSMutableArray array];
    // 遍历转数组元素
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        
        // 取出属性名, 返回C语言字符串(const char *)
        const char *cName = property_getName(property);
        // 转为 OC 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        // 存入数组
        [mArray addObject:name];
    }
    return mArray;
}

@end

