//
//  DuckFlyWithNoWay.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "DuckFlyWithNoWay.h"

@implementation DuckFlyWithNoWay

- (void)fly
{
    NSLog(@" Duck Fly with NoWay");
    
    NSString * str = @"Duck Fly with NoWay";
    
    [mCallBackDelegete passFlyValue:str];
}

- (void)setCallback:(id)_obj
{
    mCallBackDelegete = _obj;
}
@end
