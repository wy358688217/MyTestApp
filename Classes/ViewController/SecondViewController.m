//
//  SecondViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "SecondViewController.h"
#import "TestDuckMainObject.h"
#import "TestDuckModelObject.h"
#import "TestMallarDuckObject.h"
#import "DuckFlyWithNoWay.h"
#import "DuckQuackWithSing.h"
#import "DuckFlyWithRocketPower.h"
#include "DuckQuackWithSpeak.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_mTextlabel setText:[NSString stringWithFormat:@"%@",_mText ]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -代理方法
-(void) passValue:(NSString *)value
{
    _mText = value;
    [_mTextlabel setText:[NSString stringWithFormat:@"%@",_mText ]];
    NSLog(@"values:::%@",value);
}

-(void)passFlyValue:(NSString *)value
{
    [_mFlyTextTable setText:value];
    NSLog(@"values:::%@",value);
}
#pragma mark -代理方法end

- (IBAction)onBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    NSInteger _index = buttonIndex;

    NSString *msg = nil;
    
    switch (_index)
    {
        case 0:
            msg = @"You can breathe easy, everything went OK.";
            break;
        case 1:
            msg = @"What do you want?, everything went OK.";
            break;
        case 2:
            msg = @"Why are you do that?, everything went OK.";
            break;
            
        default:
            msg = @"another, everything went OK.";
            break;
    }
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Something was done"
                          message:msg
                          delegate:self
                          cancelButtonTitle:@"Phew!"
                          otherButtonTitles:nil];
    
    [alert show];
}

- (IBAction)onButonOne:(id)sender
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc]
                                   initWithTitle:@"Are you sure?"
                                   delegate:self
                                   cancelButtonTitle:@"No Way!"
                                   destructiveButtonTitle:@"Yes, I'm Sure!"
                                   otherButtonTitles:@"What do you want?",@"Why are you do that?",nil];
    [actionSheet showInView:self.view];
}

- (IBAction)onButtonTwo:(id)sender
{
    mDuckMainObject = [[TestDuckModelObject alloc] init];
    [mDuckMainObject display];
    [mDuckMainObject setCallback:self];
    [mDuckMainObject performFly];
    [mDuckMainObject performQuack];
}

- (IBAction)onButtonThree:(id)sender
{
    mDuckMainObject = [[TestMallarDuckObject alloc]init];
    [mDuckMainObject display];
    [mDuckMainObject setCallback:self];
    [mDuckMainObject performFly];
    [mDuckMainObject performQuack];
}

- (IBAction)onButtonFour:(id)sender
{
    mDuckMainObject = [[TestMallarDuckObject alloc]init];
    [mDuckMainObject display];
    [mDuckMainObject setFlyInter:[[DuckFlyWithNoWay alloc] init]];
    [mDuckMainObject setCallback:self];
    [mDuckMainObject performFly];
}

- (IBAction)onButtonFive:(id)sender
{
    mDuckMainObject = [[TestMallarDuckObject alloc]init];
    [mDuckMainObject display];
    [mDuckMainObject setQuackInter:[[DuckQuackWithSing alloc]init]];
    [mDuckMainObject setCallback:self];
    [mDuckMainObject performQuack];
}

- (IBAction)onButtonSix:(id)sender
{
    mDuckMainObject = [[TestDuckModelObject alloc] init];
    [mDuckMainObject display];
    [mDuckMainObject setFlyInter:[[DuckFlyWithRocketPower alloc] init]];
    [mDuckMainObject setQuackInter:[[DuckQuackWithSpeak alloc] init]];
    [mDuckMainObject setCallback:self];
    [mDuckMainObject performFly];
    [mDuckMainObject performQuack];
}
@end
