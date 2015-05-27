//
//  SecondViewController.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTestViewController.h"

@interface SecondViewController : UIViewController<UIActionSheetDelegate, SecondViewContrllerDelegete>
@property (weak, nonatomic) IBOutlet UILabel *mTextlabel;
@property (copy, nonatomic) NSString * mText;
- (IBAction)onBack:(id)sender;
- (IBAction)onButonOne:(id)sender;
- (IBAction)onButtonTwo:(id)sender;
- (IBAction)onButtonThree:(id)sender;
- (IBAction)onButtonFour:(id)sender;

@end
