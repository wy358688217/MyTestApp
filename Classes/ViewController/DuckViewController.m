//
//  DuckViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/27.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "DuckViewController.h"
#import "TestDuckMainObject.h"
#import "TestDuckModelObject.h"
#import "TestMallarDuckObject.h"
#import "DuckFlyWithNoWay.h"
#import "DuckQuackWithSing.h"

@interface DuckViewController ()

@end

@implementation DuckViewController

- (id)init
{
    self = [super init];
    
    if (self)
    {
        //mDuckMainObject = [[TestDuckMainObject alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mDuckMainObject = [[TestDuckModelObject alloc] init];
    [mDuckMainObject performFly];
    [mDuckMainObject performQuack];
    
    mDuckMainObject = [[TestMallarDuckObject alloc]init];
    [mDuckMainObject performFly];
    [mDuckMainObject performQuack];
    
    [mDuckMainObject setFlyInter:[[DuckFlyWithNoWay alloc] init]];
    [mDuckMainObject performFly];
    
    [mDuckMainObject setQuackInter:[[DuckQuackWithSing alloc]init]];
    [mDuckMainObject performQuack];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    EXLog(@"");
    
}

@end
