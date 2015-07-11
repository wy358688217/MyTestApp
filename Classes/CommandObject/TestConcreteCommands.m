//
//  TestConcreteCommands.m
//  MyTestApp
//
//  Created by wy0012 on 15/6/2.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "TestConcreteCommands.h"
#import "TestRecevier.h"
#import "MyTestViewController.h"

@implementation TestConcreteCommands

- (TestCommands*)MyInit:(TestRecevier*)_rece
{
    mTestRecevier = _rece;
    
    return self;
}

- (TestCommands*)VcInit:(MyTestViewController *)_vc
{
    mViewC = _vc;
    
    return self;
}

- (void)Execute
{
    if (mTestRecevier)
    {
        [mTestRecevier Action];
    }
    
    if (mViewC)
    {
        [mViewC Action];
    }
}
@end
