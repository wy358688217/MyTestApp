//
//  TestDuckModelObject.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "TestDuckModelObject.h"
#import "DuckFlyWithNoWay.h"
#import "DuckQuackWithSing.h"


@implementation TestDuckModelObject

- (id)init
{
    self = [super init];
    
    if (self)
    {
        m_FlyInter = [[DuckFlyWithNoWay alloc] init];
        m_QuackInter = [[DuckQuackWithSing alloc] init];
    }
    
    return self;
}

- (void)display
{
    NSLog(@" Display Model");
}

- (void)setCallback:(id)_obj
{
    [m_FlyInter setCallback:_obj];
    [m_QuackInter setCallback:_obj];
}

@end
