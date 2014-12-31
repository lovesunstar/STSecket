//
//  SKTestViewController.m
//  STSecret
//
//  Created by SunJiangting on 14-3-27.
//  Copyright (c) 2014年 Attackers. All rights reserved.
//

#import "SKTestViewController.h"
#import "SKRoundButton.h"

@interface SKTestViewController ()

@property (nonatomic, strong) UILabel   *statusLabel;

@end

@implementation SKTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"测试组件";
    // Do any additional setup after loading the view.
    [self.view addTouchTarget:self action:@selector(tappedBackground:)];
    
    self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, self.view.width - 20, 20)];
    self.statusLabel.textColor = [UIColor redColor];
    [self.view addSubview:self.statusLabel];
    
    SKRoundButton *roundButton = [[SKRoundButton alloc] initWithFrame:CGRectMake((self.view.width - 100) / 2, 60, 100, 100)];
    roundButton.backgroundColor = [UIColor blueColor];
    [roundButton addTarget:self action:@selector(roundButtonActionFired:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:roundButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)roundButtonActionFired:(id)sender {
    self.statusLabel.text = @"You Touched the RoundButton";
}

- (void)tappedBackground:(UITapGestureRecognizer *)tapGesture {
    self.statusLabel.text = @"You Tapped the Background";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
