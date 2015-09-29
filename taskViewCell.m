//
//  taskViewCell.m
//  List
//
//  Created by 贺东方 on 15/8/30.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//

#import "taskViewCell.h"

static const float margin = 10;


@implementation taskViewCell

- (instancetype)initWithTaskViewCellType:(TaskViewCellType)taskViewType
{
    self = [super init];
    if (self) {
        switch (taskViewType) {
            case 0:
                [self configTaskViewCellTypeDefault];
                break;
                
            case 1:
                [self configTaskViewCellTypeTextField];
                break;
            
        }
        
    }
    return self;
}

- (void)configTaskViewCellTypeDefault
{
    
}

- (void)configTaskViewCellTypeTextField
{
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = CGRectMake(margin, 5, self.bounds.size.width - 2 *margin, self.bounds.size.height - 2 * 5);
    textField.placeholder = @"11111";
    [self addSubview:textField];
}
@end
