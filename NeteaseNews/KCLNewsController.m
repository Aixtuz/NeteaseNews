//
//  KCLTableViewController.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/18.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLNewsController.h"
#import "KCLNews.h"
#import "KCLNewsCell.h"

@interface KCLNewsController ()

// TableViewCell 的 数据模型数组
@property (nonatomic, strong) NSArray *newsList;

@end

@implementation KCLNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 测试断言
    // [KCLNews newsList:nil];
    
}

// 重写 Setter 方法
- (void)setUrlStr:(NSString *)urlStr {
    
    // 传递数据, 不做他用, 不必赋予属性保存
    // _urlStr = urlStr;
    
    // 回调 GET 取得的数据
    [KCLNews newsListWithUrl:urlStr completion:^(NSArray *array) {
        
        // 测试: newsList: 方法的回调数据
        NSLog(@"\nNewsList数据:\n%@", array);
        
        // 取得数据后, 赋值
        self.newsList = array;
        // 重写 setter 方法
    }];
}

// 传入 urlStr 设置 newsList 方法
- (void)setNewsList:(NSArray *)newsList {
    
    // 先赋予属性, 保持 getter 取值一致
    _newsList = newsList;
    
    // 刷新数据
    [self.tableView reloadData];
}

#pragma mark - Table view data source

// 返回 row 数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}

// 返回 Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取出模型
    KCLNews *news = self.newsList[indexPath.row];
    
    // 创建
    KCLNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[KCLNewsCell reuseID:news]];
    
    // 设置
    cell.news = self.newsList[indexPath.row];
    
    // 返回
    return cell;
}

#pragma mark - Table view delegate

// SB 设置行高无效, 代理方法返回行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取出模型
    KCLNews *news = self.newsList[indexPath.row];
    return [KCLNewsCell rowHeight:news];
}

@end

