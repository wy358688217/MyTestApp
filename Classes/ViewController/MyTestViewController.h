//
//  MyTestViewController.h
//  MyTestApp
//
//  Created by wy0012 on 15/4/11.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTopSystemNotificationView.h"

@protocol SecondViewContrllerDelegete <NSObject>

-(void)passValue:(NSString *)value;

-(void)passFlyValue:(NSString *)value;

@end

@interface MyTestViewController : UIViewController
{
    id <SecondViewContrllerDelegete> mDelegete;
    
    ITTopSystemNotificationView* _mpITTopSystemNotificationView;
    int mInt;
}

@property (weak, nonatomic) IBOutlet UIButton *changeButton;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

- (void)Action;
- (IBAction)buttonChangeText:(id)sender;

- (IBAction)buttonRemove:(id)sender;

- (IBAction)buttonCreate:(id)sender;

- (IBAction)onGotoCommand:(id)sender;

- (IBAction)onNext:(id)sender;
- (IBAction)onBack:(id)sender;
@end
