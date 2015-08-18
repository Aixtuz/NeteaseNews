//
//  KCLTableViewController.m
//  NeteaseNews
//
//  Created by Aixtuz Kang on 15/8/18.
//  Copyright © 2015年 Aixtuz. All rights reserved.
//

#import "KCLTableViewController.h"
#import "KCLNews.h"

@interface KCLTableViewController ()

@end

@implementation KCLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 测试断言
    // [KCLNews newsList:nil];
    // 回调 GET 取得的数据
    [KCLNews newsList:^(NSArray *array) {
        
        // 测试: newsList: 方法的回调数据
        NSLog(@"\nNewsList数据:\n%@", array);
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
