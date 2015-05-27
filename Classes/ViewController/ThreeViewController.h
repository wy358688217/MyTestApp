//
//  ThreeViewController.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray * mNSArray;
}
@property (weak, nonatomic) IBOutlet UIPickerView *mSinglePicker;
@property (weak, nonatomic) NSArray * mNSArrayPickerData;

- (IBAction)onClick:(id)sender;
- (IBAction)onNext:(id)sender;

@end
