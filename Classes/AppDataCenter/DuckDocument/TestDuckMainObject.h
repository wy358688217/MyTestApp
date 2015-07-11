//
//  TestDuckMainObject.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisplayInterface.h"
@protocol FlyInterface;
@protocol QuackInterface;
//@protocol DisplayInterface;

@interface TestDuckMainObject : NSObject<DisplayInterface>
{
    id<FlyInterface>    m_FlyInter;
    id<QuackInterface>  m_QuackInter;
}

- (void)performFly;
- (void)performQuack;

- (void)setFlyInter:(id<FlyInterface>) _flyInter;
- (void)setQuackInter:(id<QuackInterface>) _quackInter;

- (void)swim;

@end
