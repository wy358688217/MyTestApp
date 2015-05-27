//
//  PickerViewController.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kAreaComponent 0
#define kZipComponent 1

@interface PickerViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

{
    NSArray * mNSArray;
    
    NSDictionary * mNSDictiobary;
    NSArray * mAreaNameArray;
    NSArray * mZipCodeArray;
}
@property (weak, nonatomic) IBOutlet UIPickerView *mPickerView;
- (IBAction)onClick:(id)sender;
- (IBAction)onBack:(id)sender;
- (IBAction)onNext:(id)sender;
@end
