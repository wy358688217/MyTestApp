//
//  PickerGameViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/26.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "PickerGameViewController.h"

@interface PickerGameViewController ()

@end

@implementation PickerGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _mResultLabel.text = @"Good Luck To You!";
    
    UIImage *seven  = [UIImage imageNamed:@"seven.png"];
    UIImage *bar    = [UIImage imageNamed:@"bar.png"];
    UIImage *crown  = [UIImage imageNamed:@"crown.png"];
    UIImage *cherry = [UIImage imageNamed:@"cherry.png"];
    UIImage *lemon  = [UIImage imageNamed:@"lemon.png"];
    UIImage *apple  = [UIImage imageNamed:@"apple.png"];
    
    for (int i = 1; i <= 5; i++) {
        UIImageView *sevenView  = [[UIImageView alloc] initWithImage:seven];
        UIImageView *barView    = [[UIImageView alloc] initWithImage:bar];
        UIImageView *crownView  = [[UIImageView alloc] initWithImage:crown];
        UIImageView *cherryView = [[UIImageView alloc] initWithImage:cherry];
        UIImageView *lemonView  = [[UIImageView alloc] initWithImage:lemon];
        UIImageView *appleView  = [[UIImageView alloc] initWithImage:apple];
        
        NSArray *imageViewArray = [[NSArray alloc] initWithObjects:sevenView, barView, crownView, cherryView, lemonView, appleView, nil];
        
        NSString *fieldName = [[NSString alloc] initWithFormat:@"mArray%d", i];
        [self setValue:imageViewArray forKey:fieldName];
    }
    
    srandom(time(NULL));
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [mArray1 count];
}

#pragma mark Picker Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    NSString *arrayName = [[NSString alloc] initWithFormat:@"mArray%d", component + 1];
    NSArray *array = [self valueForKey:arrayName];
    return [array objectAtIndex:row];
}


- (IBAction)onBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onStart:(id)sender
{
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    for (int i = 0; i < 5; i++) {
        int newValue = random() % [mArray1 count];
        
        if(newValue == lastVal)
            numInRow++;
        else
            numInRow = 1;
        
        lastVal = newValue;
        [_mPickerGameView selectRow:newValue inComponent:i animated:YES];
        [_mPickerGameView reloadComponent:i];
        if (numInRow >= 3) {
            win = YES;
        }
    }
    
    if (win)
        _mResultLabel.text = @"WIN";
    else
        _mResultLabel.text = @"LOSE";
}

- (IBAction)onNext:(id)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
