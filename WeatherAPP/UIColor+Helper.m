//
//  UIColor+Helper.m
//  WeatherAPP
//
//  Created by Jianyu ZHU on 1/11/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

-(id)initWithRed: (CGFloat)red Green: (CGFloat)green Blue: (CGFloat)blue{
    return [self initWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
