//
//  KCLNewsController.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/18.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCLNewsController : UITableViewController

// 传递 tid 拼接的 GET 请求地址
@property (nonatomic, copy) NSString *urlStr;

@end
