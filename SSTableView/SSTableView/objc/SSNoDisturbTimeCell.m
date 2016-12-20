//
//  SSNoDisturbTimeCell.m
//  SSTableView
//
//  Created by allthings_LuYD on 2016/12/20.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "SSNoDisturbTimeCell.h"
#import "SSCommonTableData.h"
#import "UIView+SS.h"

@interface SSNoDisturbTimeCell()

@property (nonatomic,strong) SSCommonTableRow *data;

@end
@implementation SSNoDisturbTimeCell

- (void)layoutSubviews{
    [super layoutSubviews];
    self.detailTextLabel.centerX = self.width * .5f;
}

- (void)refreshData:(SSCommonTableRow *)rowData tableView:(UITableView *)tableView{
    self.textLabel.text = rowData.title;
    self.detailTextLabel.text = rowData.detailTitle;
    self.data = rowData;
}


@end
