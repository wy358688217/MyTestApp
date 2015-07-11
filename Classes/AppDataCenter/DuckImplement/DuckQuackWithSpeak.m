//
//  DuckQuackWithSpeak.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "DuckQuackWithSpeak.h"

@implementation DuckQuackWithSpeak

- (void)quack
{
    NSLog(@" Duck Quack With Speak");
    
    NSString * str = @"Duck Quack With Speak";
    
    [mCallBackDelegete passValue:str];
}

- (void)setCallback:(id)_obj
{
    mCallBackDelegete = _obj;
}
@end
