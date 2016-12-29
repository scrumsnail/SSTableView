//
//  ViewController.m
//  SSTableView
//
//  Created by allthings_LuYD on 2016/12/20.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "ViewController.h"
#import "SSCommonTableData.h"
#import "SSCommonTableDelegate.h"
#import "SSColorButtonCell.h"
typedef enum{
    Male,
    Female,
    Other
}sex;

@interface ViewController (){
    BOOL enableNoDisturbing;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) SSCommonTableDelegate *delegator;

@property (nonatomic,copy)   NSArray *data;

@property (nonatomic,assign) sex selectedGender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SSTableViewExample";
    enableNoDisturbing = NO;
    [self buildData];
     __weak typeof(self) wself = self;
    self.delegator = [[SSCommonTableDelegate alloc] initWithTableData:^NSArray *{
        return wself.data;
    }];
    self.tableView.delegate   = self.delegator;
    self.tableView.dataSource = self.delegator;
    self.tableView.tableFooterView = [UIView new];
}

- (void)buildData{
    NSArray *data = @[
                      @{
                          HeaderTitle:@"",
                          RowContent :@[
                                  @{
                                      ExtraInfo     : @"iOS",
                                      CellClass     : @"SSSettingPortraitCell",
                                      RowHeight     : @(100),
                                      CellAction    : @"onActionTouchPortrait:",
                                      ShowAccessory : @(YES)
                                      },
                                  ],
                          FooterTitle:@""
                          },
                      @{
                          HeaderTitle:@"",
                          RowContent :@[
                                  @{
                                      Title      :@"我的学生",
                                      DetailTitle :@"添加学生",
                                      LeftImage : @"student",
                                      CellAction : @"onActionTouchStudent:",
                                      },
                                  ],
                          FooterTitle:@"扫一扫添加"
                          },

                      @{
                          HeaderTitle:@"",
                          RowContent :@[
                                  @{
                                      Title      :@"我的钱包",
                                      DetailTitle:@"",
                                      CellAction :@"onActionNoDisturbingSetting:",
                                      ShowAccessory : @(YES),
                                      LeftImage : @"wallet2"
                                      },
                                  @{
                                      Title        : @"免打扰",
                                      CellClass    : @"SSSettingSwitcherCell",
                                      CellAction   : @"onActionNoDisturbingSettingValueChange:",
                                      ExtraInfo    : @(enableNoDisturbing),
                                      ForbidSelect : @(YES),
                                      LeftImage   : @"device2"
                                      },
                                  @{
                                      Title       : @"从",
                                      DetailTitle : @"10:30",
                                      CellClass   : @"SSNoDisturbTimeCell",
                                      Disable     : @(!enableNoDisturbing),
                                      },
                                  @{
                                      Title      :@"至",
                                      DetailTitle:@"11:30",
                                      CellClass  :@"SSNoDisturbTimeCell",
                                      Disable    :@(!enableNoDisturbing),
                                      },

                                  ],
                          FooterTitle:@""
                          },
                      @{
                          HeaderTitle:@"",
                          RowContent :@[
                                  @{
                                      ExtraInfo     : @"昵称",
                                      ExtraInfo     : @"iOS",
                                      CellClass     : @"SSTextSettingCell",
                                      RowHeight     : @(50),
                                      },
                                  ],
                          FooterTitle:@"好的昵称可以让你的朋友更容易记住你"
                          },
                      @{
                          HeaderTitle:@"",
                          RowContent :@[
                                  @{
                                      Title         : @"男",
                                      CellClass     : @"SSSettingCheckCell",
                                      RowHeight     : @(50),
                                      CellAction    : @"onTouchMaleCell:",
                                      ExtraInfo     : @(self.selectedGender == Male),
                                      ForbidSelect  : @(YES),
                                      },
                                  @{
                                      Title         : @"女",
                                      CellClass     : @"SSSettingCheckCell",
                                      RowHeight     : @(50),
                                      CellAction    : @"onTouchFemaleCell:",
                                      ExtraInfo     : @(self.selectedGender == Female),
                                      ForbidSelect  : @(YES),
                                      },
                                  @{
                                      Title         : @"其他",
                                      CellClass     : @"SSSettingCheckCell",
                                      CellAction    : @"onTouchUnkownGenderCell:",
                                      RowHeight     : @(50),
                                      ExtraInfo     : @(self.selectedGender == Other),
                                      ForbidSelect  : @(YES),
                                      },
                                  ],
                          },
                      @{
                          RowContent :@[
                                  @{
                                      Title        : @"退出登录",
                                      CellClass    : @"SSColorButtonCell",
                                      CellAction   : @"logout:",
                                      ForbidSelect : @(YES),
                                      ExtraInfo    : @(ColorButtonCellStyleRed)
                                      },
                                  ],
                          }

                      ];
    self.data = [SSCommonTableSection sectionsWithData:data];
}

#pragma mark - Action
- (void)onActionTouchPortrait:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)onActionTouchStudent:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)onActionNoDisturbingSetting:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)onActionNoDisturbingSettingValueChange:(id)sender {
    NSLog(@"%s",__func__);
    UISwitch *switcher = sender;
    enableNoDisturbing = switcher.on;
    [self refreshData];
}

- (void)onTouchMaleCell:(id)sender{
    NSLog(@"%s",__func__);
    self.selectedGender = Male;
    [self refreshData];
}

- (void)onTouchFemaleCell:(id)sender{
    NSLog(@"%s",__func__);
    self.selectedGender = Female;
    [self refreshData];
}

- (void)onTouchUnkownGenderCell:(id)sender{
    NSLog(@"%s",__func__);
    self.selectedGender = Other;
    [self refreshData];
}

- (void)logout:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)refreshData{
    [self buildData];
    [self.tableView reloadData];
}
@end
