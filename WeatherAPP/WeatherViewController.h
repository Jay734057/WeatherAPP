//
//  WeatherViewController.h
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ChangeCityDelegate.h"

#define WEATHER_URL @"http://api.openweathermap.org/data/2.5/weather"
#define APP_ID @"873632816bf31141ec4b238f847667db"

@interface WeatherViewController : UIViewController <CLLocationManagerDelegate, ChangeCityDelegate>

@end
