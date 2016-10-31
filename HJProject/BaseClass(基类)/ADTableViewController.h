//
//  ADTableViewController.h
//  CRM
//
//  Created by User on 16/8/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "ADBaseViewController.h"
#import "KVOArray.h"

@interface ADTableViewController : ADBaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger currentPageNum; // 分页数
@property (nonatomic, strong) NSMutableArray *dataListArr; //数据源(只能add, remove 不能赋值)

// 请求数据
- (void)requestData;

// 初始化 MJRefresh
- (void)setupRefresh;

// 移除所有数据
- (void)removeAllData;

@end
