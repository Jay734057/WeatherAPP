//
//  SwitchCityViewController.h
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeCityDelegate.h"

@interface SwitchCityViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,weak) id<ChangeCityDelegate> delegate;

@end
