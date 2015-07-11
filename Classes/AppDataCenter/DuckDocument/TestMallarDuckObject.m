//
//  TestMallarDuckObject.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "TestMallarDuckObject.h"
#import "DuckWithWing.h"
#import "DuckQuackWithSpeak.h"

@implementation TestMallarDuckObject

- (id)init
{
    self = [super init];
    
    if (self)
    {
        m_FlyInter = [[DuckWithWing alloc] init];
        m_QuackInter = [[DuckQuackWithSpeak alloc] init];
    }
    
    return self;
}

- (void)display
{
    NSLog(@" Display Mallar");
}

- (void)setCallback:(id)_obj
{
    [m_FlyInter setCallback:_obj];
    [m_QuackInter setCallback:_obj];
}

@end
