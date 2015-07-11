//
//  TestCommands.h
//  MyTestApp
//
//  Created by wy0012 on 15/6/2.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestRecevier;
@class MyTestViewController;

@interface TestCommands : NSObject
{
    TestRecevier * mTestRecevier;
    MyTestViewController * mViewC;
}

- (TestCommands*)MyInit:(TestRecevier *)_rece;

- (TestCommands*)VcInit:(MyTestViewController *)_vc;

- (void)Execute;

@end
