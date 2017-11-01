//
//  ChangeCityDelegate.h
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ChangeCityDelegate <NSObject>

-(void)customizedWithCityName: (NSString *) city;

@end
