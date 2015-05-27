//
//  TestCallbackDelegete.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "TestCallbackDelegete.h"
#import "TestDelegeteViewController.h"

@implementation TestCallbackDelegete

- (void)handleEventObject
{
    NSLog(@"执行本类的操作");
    
    //执行回调操作
    SEL func_selector = NSSelectorFromString(mCallbackFunction);
    if ([mCallbackObject respondsToSelector:func_selector])
    {
        NSLog(@"回调成功...");

        [mCallbackObject performSelector:func_selector];
    }
    else
    {
        NSLog(@"回调失败...");
    }
}

- (void)setDelegateObject:(id)cbobject setBackFunctionName:(NSString *)selectorName
{
    mCallbackObject     = cbobject;
    mCallbackFunction   = selectorName;
}

@end
