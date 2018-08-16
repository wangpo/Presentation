//
//  SGElectricAccountSelectorViewController.h
//  SGCC
//
//  Created by wangpo on 2018/6/14.
//  Copyright © 2018年 SGCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGElectricAccountSelectorViewController : UITableViewController

@property (nonatomic, copy) void(^selectElectricAccountBlock)(NSString * account);

@end
