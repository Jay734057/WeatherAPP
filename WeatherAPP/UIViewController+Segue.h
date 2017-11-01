//
//  UIViewController+Segue.h
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Segue)

-(void)presentFromRight: (nullable UIViewController *)viewControllerToPresent;
-(void)dismissFromLeft;

@end
