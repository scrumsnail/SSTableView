//
//  SSSettingSwitcherCell.m
//  SSTableView
//
//  Created by allthings_LuYD on 2016/12/20.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "SSSettingSwitcherCell.h"
#import "SSCommonTableData.h"
#import "UIView+SS.h"

@interface SSSettingSwitcherCell ()

@property(nonatomic,strong) UISwitch *switcher;

@end

@implementation SSSettingSwitcherCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _switcher = [[UISwitch alloc] initWithFrame:CGRectZero];
        [self addSubview:_switcher];
    }
    return self;
}


- (void)refreshData:(SSCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.textLabel.text       = rowData.title;
    self.detailTextLabel.text = rowData.detailTitle;
    NSString *actionName      = rowData.cellActionName;
    [self.switcher setOn:[rowData.extraInfo boolValue] animated:NO];
    [self.switcher removeTarget:self.viewController action:NULL forControlEvents:UIControlEventValueChanged];
    if (actionName.length) {
        SEL sel = NSSelectorFromString(actionName);
        [self.switcher addTarget:tableView.viewController action:sel forControlEvents:UIControlEventValueChanged];
    }
}



#define SwitcherRight 15
- (void)layoutSubviews{
    [super layoutSubviews];
    self.switcher.right   = self.width - SwitcherRight;
    self.switcher.centerY = self.height * .5f;
}


@end
