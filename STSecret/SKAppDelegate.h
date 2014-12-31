//
//  SKAppDelegate.h
//  STSecret
//
//  Created by SunJiangting on 14-3-27.
//  Copyright (c) 2014年 Attackers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


- (UIViewController *) startViewController;
- (UIViewController *) tabBarController;

- (void) replaceRootViewController:(UIViewController *)newViewController
                  animationOptions:(UIViewAnimationOptions) options;

@end
