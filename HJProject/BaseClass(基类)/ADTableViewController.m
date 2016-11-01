//
//  ADTableViewController.m
//  CRM
//
//  Created by User on 16/8/10.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "ADTableViewController.h"
#import <MJRefresh.h>
#import <objc/runtime.h>


@interface ADTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) KVOArray *kvoArr;

@end

@implementation ADTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentPageNum = 1; // 默认第一页
//    [NoDataView nodataViewWithTitle:@"暂无数据" superView:self.tableView changeObject:self.kvoArr keyPath:@"array"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 初始化 MJRefresh
- (void)setupRefresh
{
    //非 gif
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(mj_headerRefesh)];
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(mj_footerRefesh)];
    self.tableView.mj_footer = footer;
    self.tableView.mj_footer.hidden = YES;
    //    GifHeaderRefresh *header = [GifHeaderRefresh headerWithRefreshingTarget:self refreshingAction:@selector(mj_headerRefesh)];
    //    [header setGIF];
    //    self.refeshScrollView.mj_header = header;
    //    [self.refeshScrollView.mj_header beginRefreshing];
    //
    //    // MJRefreshAutoNormalFooter 非gif
    //    GifFootRefresh *footer = [GifFootRefresh footerWithRefreshingTarget:self refreshingAction:@selector(mj_footerRefesh)];
    //    [footer setGIF];
    //    self.refeshScrollView.mj_footer = footer;
    //    self.refeshScrollView.mj_footer.hidden = YES;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


#pragma mark - MJRefesh
- (void)mj_headerRefesh
{
    self.currentPageNum = 1;
    [self requestData];
//    NSLog(@"这是下拉加载！");
}

- (void)mj_footerRefesh
{
    self.currentPageNum++;
    [self requestData];
//    NSLog(@"这是上拉");
}

- (void)removeAllData
{
    [self.dataListArr addObject:@""];
    [self.dataListArr removeAllObjects];
}

#pragma mark - setter and getter
- (NSMutableArray *)dataListArr
{
    return [self.kvoArr mutableArrayValueForKey:@"array"];
}

- (KVOArray *)kvoArr
{
    if (!_kvoArr) {
        _kvoArr = [KVOArray new];
    }
    return _kvoArr;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
