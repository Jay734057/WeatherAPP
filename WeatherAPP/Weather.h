//
//  Weather.h
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property int temperature;
@property int condition;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *weatherIconName;


-(NSString *)updateWeatherIconWithCondition:(int) condition;
@end
