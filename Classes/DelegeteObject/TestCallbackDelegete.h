//
//  TestCallbackDelegete.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestCallbackDelegete : NSObject
{
    id          mCallbackObject;             //回调类
    NSString    *mCallbackFunction;          //回调的函数名
}

- (void)handleEventObject;

- (void)setDelegateObject:(id)cbobject setBackFunctionName:(NSString *)selectorName;

@end
