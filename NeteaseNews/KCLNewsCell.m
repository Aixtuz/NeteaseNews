//
//  KCLNewsCell.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/18.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLNewsCell.h"
#import "KCLNews.h"
#import "UIImageView+AFNetworking.h"

// 自定义 Cell
@interface KCLNewsCell ()

// 图片
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleView;
// 摘要
@property (weak, nonatomic) IBOutlet UILabel *digestView;
// 回复
@property (weak, nonatomic) IBOutlet UILabel *replyCountView;

// 附加图片数组(控件): 用于 newsExtra
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *iconViews;

@end


@implementation KCLNewsCell

// 返回 Cell 的高度
+ (CGFloat)rowHeight:(KCLNews *)news {
    
    // 根据 Cell 类型, 返回高度
    if (news.imgExtra) {
        
        return 135;
        
    } else if (news.imgType) {
        
        return 180;
    }
    return 90;
}

// 返回 Cell 的重用标识: 缓冲池出列前判断 Cell, 此时未实例化对象, 需要类方法
+ (NSString *)reuseID:(KCLNews *)news {
    
    // 判别自定义 Cell
    if (news.imgExtra) {
        
        // 存在 imgExtra 返回 newsExtra
        return @"newsExtra";
        
    } else if (news.imgType) {
        
        // 存在 imgType 返回 newsBig
        return @"newsBig";
    }
    // 无则返回 news
    return @"news";
}

// 重写 setter 方法
- (void)setNews:(KCLNews *)news {
    
    // 先赋予属性, 保持 getter 取值一致
    _news = news;
    
    // 解析赋值
    // UIImageView+AFNetworking.h 下载图片方法
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    self.titleView.text = news.title;
    self.digestView.text = news.digest;
    self.replyCountView.text = [NSString stringWithFormat:@"%d人跟帖", news.replyCount.intValue];
    
    // 判断 newsExtra, 设置 imgExtra
    if (news.imgExtra) {
        
        // 遍历 数据 & 控件
        for (int i = 0; i < news.imgExtra.count; i++) {
            
            // 数据(字典): [@"imgsrc": @"url"]
            NSDictionary *dict = news.imgExtra[i];
            
            // 图片地址
            NSString *imgStr = dict[@"imgsrc"];
            
            // 控件(数组): UIImageView
            UIImageView *imgView = self.iconViews[i];
            
            // 设置图片
            [imgView setImageWithURL:[NSURL URLWithString:imgStr]];
        }
    }
}

@end

