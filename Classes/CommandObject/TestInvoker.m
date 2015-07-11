//
//  TestInvoker.m
//  MyTestApp
//
//  Created by wy0012 on 15/6/2.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "TestInvoker.h"
#import "TestCommands.h"

@implementation TestInvoker

- (void)setCommands:(TestCommands *)_command
{
    mTestCommands = _command;
}

- (void)ExecuteCommand
{
    [mTestCommands Execute];
}

@end
