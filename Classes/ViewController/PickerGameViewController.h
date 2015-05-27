//
//  PickerGameViewController.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/26.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerGameViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray * mArray1;
    NSArray * mArray2;
    NSArray * mArray3;
    NSArray * mArray4;
    NSArray * mArray5;
}
@property (weak, nonatomic) IBOutlet UIPickerView *mPickerGameView;
@property (weak, nonatomic) IBOutlet UILabel *mResultLabel;
- (IBAction)onBack:(id)sender;
- (IBAction)onNext:(id)sender;
- (IBAction)onStart:(id)sender;

@end
