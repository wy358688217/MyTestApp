//
//  DuckQuackWithSpeak.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuackInterface.h"
#import "SecondViewController.h"

@interface DuckQuackWithSpeak : NSObject<QuackInterface>
{
    id<SecondViewContrllerDelegete> mCallBackDelegete;
}

@end
