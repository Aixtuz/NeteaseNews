//
//  KCLNews.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/18.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <Foundation/Foundation.h>

// TableViewCell 的数据模型
@interface KCLNews : NSObject

// 标题
@property (nonatomic, copy) NSString *title;
// 图片
@property (nonatomic, copy) NSString *imgsrc;
// 摘要
@property (nonatomic, copy) NSString *digest;
// 回复
@property (nonatomic, copy) NSNumber *replyCount;

// 封装字典转模型的构造方法
+ (instancetype)newsWithDict:(NSDictionary *)dict;

// 异步请求, 返回数据, 转为模型数组
+ (void)newsList:(void (^)(NSArray *))completion;

@end
