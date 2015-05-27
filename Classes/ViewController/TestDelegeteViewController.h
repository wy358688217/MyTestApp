//
//  TestDelegeteViewController.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestDelegeteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *mTestDelegeteLabel;
@property (nonatomic, assign) int mIndex;
- (IBAction)onGototable:(id)sender;

- (IBAction)onCallbackClick:(id)sender;
@end
