//
//  TaskView.h
//  List
//
//  Created by 贺东方 on 15/8/24.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak)UITextField *tfName;

@end