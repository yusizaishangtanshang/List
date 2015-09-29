//
//  taskViewCell.h
//  List
//
//  Created by 贺东方 on 15/8/30.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TaskViewCellType) {
    taskViewCellTypeDefault = 0,
    taskViewCellTypeTextField = 1,
};


@interface taskViewCell : UITableViewCell
@property (nonatomic,readonly)TaskViewCellType taskViewType;
@property (nonatomic,weak)UITextField *tfName;

- (instancetype)initWithTaskViewCellType:(TaskViewCellType)taskViewType;
@end
