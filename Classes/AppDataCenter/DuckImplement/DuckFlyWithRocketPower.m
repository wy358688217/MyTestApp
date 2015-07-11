//
//  DuckFlyWithRocketPower.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "DuckFlyWithRocketPower.h"

@implementation DuckFlyWithRocketPower

- (void)fly
{
    NSLog(@" Duck Fly With Rocket Power");
    
    NSString * str = @"Duck Fly With Rocket Power";
    
    [mCallBackDelegete passFlyValue:str];
}

- (void)setCallback:(id)_obj
{
    mCallBackDelegete = _obj;
}

@end
