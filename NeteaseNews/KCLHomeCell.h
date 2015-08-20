//
//  KCLHomeCell.h
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/19.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCLHomeCell : UICollectionViewCell

// 传递 tid 拼接的 GET 请求地址
@property (nonatomic, copy) NSString *urlStr;

@end
