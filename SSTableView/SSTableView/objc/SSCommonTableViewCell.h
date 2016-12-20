//
//  SSCommonTableViewCell.h
//  SSTableView
//
//  Created by allthings_LuYD on 2016/12/20.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SSCommonTableRow;

@protocol SSCommonTableViewCell <NSObject>

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@optional
- (void)refreshData:(SSCommonTableRow *)rowData tableView:(UITableView *)tableView;

@end
