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
/**
 - (void)handleEventObject;
 - (void)handleEventObjectWithVlaue:(NSString*)_value;
 
 - (void)setDelegateObject:(id)cbobject setBackFunctionName:(NSString *)selectorName;

 */
- (void)handleEventObject
{
    NSLog(@"执行本类的操作");
    
    //执行回调操作
    SEL func_selector = NSSelectorFromString(mCallbackFunction);
    if ([mCallbackObject respondsToSelector:func_selector])
    {
        NSLog(@"回调成功...");

        //[mCallbackObject performSelector:func_selector];
        objc_msgSend(mCallbackObject,func_selector);
        //[mCallbackObject performSelector:func_selector withObject:nil];;
        //    if ([mMedalViewCallbackObject respondsToSelector:mCallbackFunction])
//        {
//            objc_msgSend(mMedalViewCallbackObject, mCallbackFunction);
//            ITLog(([NSString stringWithFormat:@"回调成功._mMedalViewCallbackObject..%p.._mCallbackFunction..%p",mMedalViewCallbackObject,mCallbackFunction]));
//        }
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

- (void)handleEventObjectWithVlaue:(NSString*)_value
{
    //执行回调操作
    SEL func_selector = NSSelectorFromString(mCallbackFunction);
    if ([mCallbackObject respondsToSelector:func_selector])
    {
        NSLog(@"回调成功...");
        
        //[mCallbackObject performSelector:func_selector];
        //[mCallbackObject performSelector:func_selector withObject:_value];
        objc_msgSend(mCallbackObject,func_selector,_value);
    }
    else
    {
        NSLog(@"回调失败...");
    }
}
@end
