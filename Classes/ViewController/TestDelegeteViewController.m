//
//  TestDelegeteViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "TestDelegeteViewController.h"
#import "TestCallbackDelegete.h"
#import "TableViewController.h"

@interface TestDelegeteViewController ()
{
}

@end

@implementation TestDelegeteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)handleBackFunction
{
    NSLog(@"执行完TestCallbackDelegete函数之后的具体的操作。。。。");
    
    ++_mIndex;
    
    [_mTestDelegeteLabel setText:[NSString stringWithFormat:@"Index == %d ",_mIndex]];
}


- (IBAction)onGototable:(id)sender
{
    TableViewController * _vc = [[TableViewController alloc]init];
    [self presentViewController:_vc animated:YES completion:nil];
}

- (IBAction)onCallbackClick:(id)sender
{
    NSLog(@"onCallbackClick:");
    
    TestCallbackDelegete * _callbackDelegete = [[TestCallbackDelegete alloc]init];
    
    [_callbackDelegete setDelegateObject:self setBackFunctionName:@"handleBackFunction"];
    
    [_callbackDelegete handleEventObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
