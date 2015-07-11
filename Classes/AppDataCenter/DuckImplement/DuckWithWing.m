//
//  DuckWithWing.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "DuckWithWing.h"

@implementation DuckWithWing

- (void)fly
{
    NSLog(@" Duck Fly with Wing");
    
    NSString * str = @"Duck Fly with Wing";
    
    [mCallBackDelegete passFlyValue:str];
}

- (void)setCallback:(id)_obj
{
    mCallBackDelegete = _obj;
}
@end
