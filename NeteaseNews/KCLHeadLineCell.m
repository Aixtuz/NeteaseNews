

//
//  KCLHeadLineCell.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/17.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import <UIImageView+AFNetworking.h>
#import "KCLHeadLineCell.h"
#import "KCLHeadLine.h"

@interface KCLHeadLineCell ()

// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleView;
// 图片
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
// 分页
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation KCLHeadLineCell

// 重写数据接口的 setter 方法
- (void)setHeadLine:(KCLHeadLine *)headLine {
    
    // 先赋予属性, 保持 getter 取值一致
    _headLine = headLine;
    
    // 模型解析赋值
    self.titleView.text = headLine.title;
    [self.imgView setImageWithURL:[NSURL URLWithString:headLine.imgsrc]];
    
    // 取出 Cell 序号, 即为当前页序号
    self.pageControl.currentPage = self.tag;
}

@end
