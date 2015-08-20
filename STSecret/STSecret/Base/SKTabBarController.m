//
//  SKTabBarController.m
//  STSecret
//
//  Created by SunJiangting on 14-3-27.
//  Copyright (c) 2014年 Attackers. All rights reserved.
//

#import "SKTabBarController.h"

#import "SKWebViewController.h"
#import "SKTableViewController.h"
#import "SKTestViewController.h"

#define kExploreTabItemFrame CGRectMake(2, 22, 119, 49)
#define kPublishTabItemFrame CGRectMake(125.5, 1.0, 69, 69)
#define kProfileTabItemFrame CGRectMake(199, 22, 119, 49)

@interface SKTabBarController ()

@property(nonatomic, strong) NSMutableArray *tabbarButtons;

@end

const NSInteger SKTabBarButtonTagOffset = 100;
@implementation SKTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarHeight = 70;
        self.actualTabBarHeight = 50;

        SKTableViewController *viewController0 = [[SKTableViewController alloc] init];
        STNavigationController *navigationController0 = [[STNavigationController alloc] initWithRootViewController:viewController0];

        SKTestViewController *viewController1 = [[SKTestViewController alloc] init];
        STNavigationController *navigationController1 = [[STNavigationController alloc] initWithRootViewController:viewController1];

        self.viewControllers = @[navigationController0, navigationController1];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.customizable = YES;
    self.tabBar.separatorView.hidden = YES;
    self.tabBar.barTintColor = [UIColor clearColor];
    self.tabBar.backgroundColor = [UIColor clearColor];
    self.tabBar.translucent = NO;
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bkg"];

    CGPoint publishCenterPoint = CGPointMake(CGRectGetMidX(kPublishTabItemFrame), CGRectGetMidY(kPublishTabItemFrame));
    self.tabBar.hitTestBlock = ^(CGPoint point, UIEvent *event, BOOL *returnSuper) {
        /// 按钮的点击区域距离圆心的距离
        CGFloat distance = STDistanceBetweenPoints(point, publishCenterPoint);
        /// 如果不在圆形内，则不响应点击事件，让下一层去响应
        if (distance < CGRectGetHeight(kPublishTabItemFrame) / 2) {
            *returnSuper = YES;
        }
        if (point.y >= 20) {
            *returnSuper = YES;
        }
        return (UIView *)nil;
    };

    self.tabbarButtons = [[NSMutableArray alloc] initWithCapacity:2];
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];

    button0.frame = kExploreTabItemFrame;
    button0.tag = SKTabBarButtonTagOffset + 0;
    [button0 setImage:[UIImage imageNamed:@"explore_btn_normal"] forState:UIControlStateNormal];
    [button0 setImage:[UIImage imageNamed:@"explore_btn_normal"] forState:UIControlStateHighlighted];
    [button0 setImage:[UIImage imageNamed:@"explore_btn_highlighted"] forState:UIControlStateSelected];
    [button0 setImage:[UIImage imageNamed:@"explore_btn_highlighted"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [button0 addTarget:self action:@selector(onSelectTabIndexChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:button0];
    [self.tabbarButtons addObject:button0];

    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.tag = SKTabBarButtonTagOffset + 2;
    button1.frame = kPublishTabItemFrame;
    [button1 setImage:[UIImage imageNamed:@"publish_btn_normal"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"publish_btn_highlighted"] forState:UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(onSelectTabIndexChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:button1];
    [self.tabbarButtons addObject:button1];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = kProfileTabItemFrame;
    button2.tag = SKTabBarButtonTagOffset + 1;
    [button2 setImage:[UIImage imageNamed:@"profile_btn_normal"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"profile_btn_normal"] forState:UIControlStateHighlighted];
    [button2 setImage:[UIImage imageNamed:@"profile_btn_highlighted"] forState:UIControlStateSelected];
    [button2 setImage:[UIImage imageNamed:@"profile_btn_highlighted"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [button2 addTarget:self action:@selector(onSelectTabIndexChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:button2];
    [self.tabbarButtons addObject:button2];

    self.selectedIndex = 0;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    for (int i = 0; i < self.tabbarButtons.count; i++) {
        UIButton *selectedButton = [self.tabbarButtons objectAtIndex:i];
        NSInteger tag = selectedButton.tag - SKTabBarButtonTagOffset;
        if (tag == selectedIndex) {
            selectedButton.selected = YES;
        } else {
            selectedButton.selected = NO;
        }
    }
    [super setSelectedIndex:selectedIndex];
}

- (void)onSelectTabIndexChanged:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSInteger toId = button.tag - SKTabBarButtonTagOffset;
    if (toId == 2) {
        [self publishMineSecret];
    } else {
        self.selectedIndex = toId;
    }
}

- (void)publishMineSecret {
    SKWebViewController *viewController = SKWebViewController.new;
    STNavigationController *navigationController = [[STNavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navigationController
                       animated:YES
                     completion:^{

                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
