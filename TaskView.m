//
//  TaskView.m
//  List
//
//  Created by 贺东方 on 15/8/24.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//

#import "TaskView.h"
#import "taskViewCell.h"
@implementation TaskView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITextField *tf = [[UITextField alloc]init];
        self.tfName = tf;
        
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width - 40, 200) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self addSubview:tableView];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"taskCellId";
    taskViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[taskViewCell alloc]initWithTaskViewCellType:taskViewCellTypeTextField];
            cell.tfName.text = @"";
            cell.tfName.placeholder = @"";
        }
        else
        {
            cell = [[taskViewCell alloc]initWithTaskViewCellType:taskViewCellTypeDefault];
        }
    }
    return cell;
}
    
@end

