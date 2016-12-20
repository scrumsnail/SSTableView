//
//  SSTextSettingCell.h
//  SSTableView
//
//  Created by allthings_LuYD on 2016/12/20.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCommonTableViewCell.h"
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)

@interface SSTextSettingCell : UITableViewCell<SSCommonTableViewCell>

//textField的placeholder为SSCommonTableRow.title
//textField的text为SSCommonTableRow.extraData

@property (nonatomic ,strong) UITextField *textField;

@end
