//
//  DuckQuackWithSing.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "DuckQuackWithSing.h"

@implementation DuckQuackWithSing

- (void)quack
{
    NSLog(@" Duck Quack With Sing");
    
    NSString * str = @"Duck Quack With Sing";
    
    [mCallBackDelegete passValue:str];
}

- (void)setCallback:(id)_obj
{
    mCallBackDelegete = _obj;
}
@end
