//
//  UIViewController+Segue.m
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "UIViewController+Segue.h"

@implementation UIViewController (Segue)

-(void)presentFromRight:(UIViewController *)viewControllerToPresent {
    CATransition *transition = [[CATransition alloc]init];
    transition.duration = 0.25;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    [self presentViewController:viewControllerToPresent animated:false completion:nil];
}

-(void)dismissFromLeft {
    CATransition *transition = [[CATransition alloc]init];
    transition.duration = 0.25;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    [self dismissViewControllerAnimated:false completion:nil];
}

@end
