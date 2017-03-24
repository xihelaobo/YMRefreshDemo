//
//  ViewController.m
//  YMRefreshDemo
//
//  Created by zpf on 2017/3/24.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#define iPhoneWidth [UIScreen mainScreen].bounds.size.width
#define iPhoneHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "YMRefresh.h"
#import "MJRefresh.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) YMRefresh *ymRefresh;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"YMRefresh";
    
    __weak ViewController *weakSelf = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, iPhoneWidth, iPhoneHeight - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    
//YMRefresh调用(使用方法)
    _ymRefresh = [[YMRefresh alloc] init];
    
//    正常情况下的调用例子
    //eg:1
//    [_ymRefresh normalModelRefresh:_tableView refreshType:RefreshTypeDropDown firstRefresh:NO timeLabHidden:NO stateLabHidden:YES dropDownBlock:^{
//        NSLog(@"只支持下拉");
//        if ([weakSelf.tableView.mj_header isRefreshing]) {
//            [weakSelf.tableView.mj_header endRefreshing];
//        }
//    } upDropBlock:nil];
//    
//    //eg:2
//    [_ymRefresh normalModelRefresh:_tableView refreshType:RefreshTypeUpDrop firstRefresh:NO timeLabHidden:NO stateLabHidden:NO dropDownBlock:nil upDropBlock:^{
//        NSLog(@"只支持上拉");
//        if ([weakSelf.tableView.mj_footer isRefreshing]) {
//            [weakSelf.tableView.mj_footer endRefreshing];
//        }
//    }];
//    
//    //eg:3
//    [_ymRefresh normalModelRefresh:_tableView refreshType:RefreshTypeDouble firstRefresh:NO timeLabHidden:NO stateLabHidden:YES dropDownBlock:^{
//        NSLog(@"下拉");
//        if ([weakSelf.tableView.mj_header isRefreshing]) {
//            [weakSelf.tableView.mj_header endRefreshing];
//        }
//    } upDropBlock:^{
//        NSLog(@"上拉");
//        if ([weakSelf.tableView.mj_footer isRefreshing]) {
//            [weakSelf.tableView.mj_footer endRefreshing];
//            weakSelf.tableView.mj_footer = nil;
//        }else{
//            
//        }
//        
//    }];
    
    
//    gif情况下的调用
    //eg.1
//    [_ymRefresh gifModelRefresh:_tableView refreshType:RefreshTypeDropDown firstRefresh:NO timeLabHidden:YES stateLabHidden:NO dropDownBlock:^{
//        NSLog(@"gif下拉");
//        if ([weakSelf.tableView.mj_header isRefreshing]) {
//            [weakSelf.tableView.mj_header endRefreshing];
//        }
//    } upDropBlock:nil];
//    
//    //eg.2
//    [_ymRefresh gifModelRefresh:_tableView refreshType:RefreshTypeUpDrop firstRefresh:NO timeLabHidden:NO stateLabHidden:NO dropDownBlock:nil upDropBlock:^{
//        NSLog(@"gif上拉");
//        if ([weakSelf.tableView.mj_footer isRefreshing]) {
//            [weakSelf.tableView.mj_footer endRefreshing];
//        }
//    }];
    
    //eg.3
    [_ymRefresh gifModelRefresh:_tableView refreshType:RefreshTypeDouble firstRefresh:NO timeLabHidden:YES stateLabHidden:NO dropDownBlock:^{
        if ([weakSelf.tableView.mj_header isRefreshing]) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
    } upDropBlock:^{
        if ([weakSelf.tableView.mj_footer isRefreshing]) {
            [weakSelf.tableView.mj_footer endRefreshing];
        }
    }];
    
}

#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *string = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    return cell;
}


#pragma UITableViewDelegate




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
