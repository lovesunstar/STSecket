//
//  SKTableViewController.h
//  STSecret
//
//  Created by SunJiangting on 14-3-28.
//  Copyright (c) 2014年 Attackers. All rights reserved.
//

#import "SKViewController.h"

@interface SKTableViewController : SKViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;

@end
