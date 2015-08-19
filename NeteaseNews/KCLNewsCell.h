//
//  KCLNewsCell.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/18.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KCLNews;

// 自定义 Cell
@interface KCLNewsCell : UITableViewCell

// 数据模型
@property (nonatomic, strong) KCLNews *news;


// 返回 Cell 的重用标识: 缓冲池出列前判断 Cell, 此时未实例化对象, 需要类方法
+ (NSString *)reuseID:(KCLNews *)news;

// 返回 Cell 的高度
+ (CGFloat)rowHeight:(KCLNews *)news;

@end
