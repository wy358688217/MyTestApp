//
//  TestDuckMainObject.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "TestDuckMainObject.h"
#import "DisplayInterface.h"
#import "FlyInterface.h"
#import "QuackInterface.h"

@implementation TestDuckMainObject

- (void)display
{
    NSLog(@" Display TestDuckMainObject");
}

- (void)setCallback:(id)_obj
{
    [m_FlyInter setCallback:_obj];
    [m_QuackInter setCallback:_obj];
}

- (void)performFly
{
    [m_FlyInter fly];
}

- (void)performQuack
{
    [m_QuackInter quack];
}

- (void)setFlyInter:(id<FlyInterface>) _flyInter
{
    m_FlyInter = _flyInter;
}

- (void)setQuackInter:(id<QuackInterface>) _quackInter
{
    m_QuackInter = _quackInter;
}

- (void)swim
{
    NSLog(@" I am Swimming");
}

@end
