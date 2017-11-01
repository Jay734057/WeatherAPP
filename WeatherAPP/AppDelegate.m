//
//  AppDelegate.m
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "AppDelegate.h"
#import "WeatherViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [_window makeKeyAndVisible];
    _window.rootViewController = [[WeatherViewController alloc]init];

    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    return YES;
}



@end
