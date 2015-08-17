//
//  KCLHeadLine.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/17.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLHeadLine.h"
#import <objc/runtime.h>

@implementation KCLHeadLine

+(instancetype)headLineWithDict:(NSDictionary *)dict {
    
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
