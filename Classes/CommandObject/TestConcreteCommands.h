//
//  TestConcreteCommands.h
//  MyTestApp
//
//  Created by wy0012 on 15/6/2.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestCommands.h"

@class TestRecevier;

@interface TestConcreteCommands : TestCommands

- (TestCommands*)MyInit:(TestRecevier*)_rece;
- (TestCommands*)VcInit:(MyTestViewController *)_vc;
@end
