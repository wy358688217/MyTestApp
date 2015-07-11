//
//  DuckWithWing.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlyInterface.h"
#import "SecondViewController.h"

@interface DuckWithWing : NSObject<FlyInterface>
{
    id<SecondViewContrllerDelegete> mCallBackDelegete;
}

@end
