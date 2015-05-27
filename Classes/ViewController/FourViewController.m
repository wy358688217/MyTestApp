//
//  FourViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDate * _dateNow = [NSDate date];
    
    [_mDatePicker setDate:_dateNow animated:YES];
}

- (void)viewDidUnload
{
    self.mDatePicker = nil;
}


- (IBAction)onClick:(id)sender
{
//    NSDate *selected = [_mDatePicker date];
//    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selectd is: %@", selected];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected"
//                                                    message:message
//                                                   delegate:self
//                                          cancelButtonTitle:@"Yes, I do"
//                                          otherButtonTitles:nil];
//    [alert show];
    
    NSDate *selected = [_mDatePicker date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: selected];
    NSDate *localeDate = [selected  dateByAddingTimeInterval: interval];
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selectd is: %@", localeDate];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"Yes, I do"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
