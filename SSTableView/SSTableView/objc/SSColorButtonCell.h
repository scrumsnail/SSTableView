//
//  SSColorButtonCell.h
//  SSTableView
//
//  Created by allthings_LuYD on 2016/12/29.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCommonTableViewCell.h"
typedef NS_ENUM(NSInteger, ColorButtonCellStyle){
    ColorButtonCellStyleRed,
    ColorButtonCellStyleBlue,
};

@class SSColorButton;
@interface SSColorButtonCell : UITableViewCell<SSCommonTableViewCell>

@property (nonatomic,strong) SSColorButton *button;

@end

@interface SSColorButton : UIButton

@property (nonatomic,assign) ColorButtonCellStyle style;

@end
