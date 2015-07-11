//
//  TestInvoker.h
//  MyTestApp
//
//  Created by wy0012 on 15/6/2.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestCommands;

@interface TestInvoker : NSObject
{
    TestCommands * mTestCommands;
}

- (void)setCommands:(TestCommands *)_command;

- (void)ExecuteCommand;
@end
