//
//  SKViewController.m
//  STSecret
//
//  Created by SunJiangting on 14-3-27.
//  Copyright (c) 2014年 Attackers. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()

@end

@implementation SKViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSArray * URLArray = @[@"http://wap.huanqiu.com/viewTouTiao.html?newId=613303&f=jrtt", @"http://wap.huanqiu.com/viewTouTiao.html?newId=613527&f=jrtt", @"http://web.toutiao.com/group/3177811148/"];
        self.currentURL = URLArray[2];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib. 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
