//
//  SKRoundButton.m
//  STSecret
//
//  Created by SunJiangting on 14-3-27.
//  Copyright (c) 2014年 Attackers. All rights reserved.
//

#import "SKRoundButton.h"

@implementation SKRoundButton


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        
        __weak SKRoundButton *weakSelf = self;
        self.hitTestBlock = ^(CGPoint point, UIEvent *event, BOOL *returnSuper) {
            CGPoint center = CGPointMake(CGRectGetWidth(weakSelf.bounds) / 2, CGRectGetHeight(weakSelf.bounds) / 2);
            if (STDistanceBetweenPoints(point, center) <= weakSelf.size.width / 2) {
                *returnSuper = YES;
            }
            return (UIView *)nil;
        };
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    if (frame.size.width != frame.size.height) {
        frame.size.width = frame.size.height;
    }
    [super setFrame:frame];
    self.layer.cornerRadius = CGRectGetWidth(frame) / 2;
}

@end
