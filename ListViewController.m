//
//  ListViewController.m
//  List
//
//  Created by 贺东方 on 15/8/9.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//
/*
 模仿奇妙清单
 上面是导航栏和用户头像部分
 下面是清单部分
 然后又一个添加的按钮
 */


#define __kWitdh [UIScreen mainScreen].bounds.size.width
#define __kHeight [UIScreen mainScreen].bounds.size.height
#define navigationHeight [UIScreen mainScreen].bounds.size.height * 1/3
#define btnRadius 60


#import "ListViewController.h"
#import "CreateListViewController.h"
#import "TaskView.h"
#import "taskViewCell.h"
@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ListViewController
{
    UIView *clearView;
    UIButton *listBtn;
    UIButton *addBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)configUI
{
    /**
     *  navigationBar,navagationBarbuttons,userImage
     */
    [self configNavigationBar];
    /**
     *  lists
     */
    [self configTableView];
    /**
     *  add button
     */
    [self configAddBtn];
}


- (void)configNavigationBar
{
    
}

- (void)configTableView
{
    CGRect rect = CGRectMake(0, navigationHeight, __kWitdh, __kHeight - navigationHeight);
    UITableView *tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc]init];
}

- (void)configAddBtn
{
    addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect rect ;
    addBtn.tag = 101;
    rect.size = CGSizeMake(40, 40);
    addBtn.selected = NO;
    addBtn.frame = CGRectMake(0, 0, btnRadius, btnRadius);
    addBtn.center = CGPointMake(__kWitdh /2, __kHeight - 40);
    [addBtn setBackgroundImage:[UIImage imageNamed:@"311d33c37b"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}

- (void)addBtnClick:(UIButton *)btn
{
    NSLog(@"%d",addBtn.hidden);
    addBtn.selected = !addBtn.selected;
    NSLog(@"%d",addBtn.hidden);
    if (!clearView) {
        clearView = [[UIView alloc]init];
        clearView.backgroundColor = [UIColor blackColor];
        clearView.alpha = 0.1;
        clearView.frame = self.view.frame;
        [self.view addSubview:clearView];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clearViewClick:)];
        [clearView addGestureRecognizer:tapGes];
        clearView.hidden = YES;
    }
    if (!listBtn) {
        listBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        listBtn.frame = CGRectMake(0, 0, 100, 100);
        listBtn.center = CGPointMake(__kWitdh /2, __kHeight - 100);
        [listBtn setTitle:@"清单" forState:UIControlStateNormal];
        [listBtn addTarget:self action:@selector(listBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:listBtn];
    }
    if (addBtn.selected) {
        clearView.hidden = !clearView.hidden;
        addBtn.selected = !addBtn.selected;
        
    }
    else
    {
        [addBtn setTitle:@"任务" forState:UIControlStateNormal];
        [addBtn addTarget:self action:@selector(taskBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        listBtn.hidden = NO;
        
    }
    



    

}

- (void)clearViewClick:(UITapGestureRecognizer *)ges
{
    clearView.hidden = YES;
    [UIView animateWithDuration:0.1 animations:^{
        listBtn.hidden = YES;
        
    }];
    
}

- (void)setButtonHidden:(BOOL)isHidden
{
    
}

- (void)taskBtnClick:(UIButton *)taskBtn
{
    TaskView *taskView = [[TaskView alloc]init];
    taskView.frame = CGRectMake(200, 200, 300, 300);
    [self.view addSubview:taskView];
}

- (void)listBtnClick:(UIButton *)listBtn
{
    CreateListViewController *clvc = [[CreateListViewController alloc]init];
    [self.navigationController pushViewController:clvc animated:YES];
}



#pragma tableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
