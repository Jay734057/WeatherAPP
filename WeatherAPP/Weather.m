//
//  Weather.m
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "Weather.h"

@implementation Weather

-(NSString *)updateWeatherIconWithCondition:(int)condition {
    switch (condition) {
        case 0 ... 300 :
            return @"tstorm1";
        case 301 ... 500 :
            return @"light_rain";
        case 501 ... 600 :
            return @"shower3";
        case 601 ... 700 :
            return @"snow4";
        case 701 ... 771 :
            return @"fog";
        case 772 ... 799 :
            return @"tstorm3";
        case 800 :
            return @"sunny";
        case 801 ... 804 :
            return @"cloudy2";
        case 900 ... 902 :
        case 905 ... 1000 :
            return @"tstorm3";
        case 903 :
            return @"snow5";
        case 904 :
            return @"sunny";
        default :
            return @"dunno";
    }
}



@end
