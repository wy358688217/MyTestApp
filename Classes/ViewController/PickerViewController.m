//
//  PickerViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "PickerViewController.h"
#import "PickerGameViewController.h"
@interface PickerViewController ()

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *boundle = [NSBundle mainBundle];
    NSURL *plistURL = [boundle URLForResource:@"statedictionary" withExtension:@"plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    mNSDictiobary = dictionary;
    
    NSArray *components = [mNSDictiobary allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    mAreaNameArray = sorted;
    NSString *selectedState = [mAreaNameArray objectAtIndex:0];
    NSArray *array = [mNSDictiobary objectForKey:selectedState];
    mZipCodeArray = array;
}


#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kAreaComponent) {
        return [mAreaNameArray count];
    }
    
    return [mZipCodeArray count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kAreaComponent) {
        return [mAreaNameArray objectAtIndex:row];
    }
    return [mZipCodeArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(component == kAreaComponent)
    {
        NSString *selectedState = [mAreaNameArray objectAtIndex:row];
        NSArray *array = [mNSDictiobary objectForKey:selectedState];
        mZipCodeArray = array;
        [_mPickerView selectRow:0 inComponent:kZipComponent animated:YES];
        [_mPickerView reloadComponent:kZipComponent];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if(component == kZipComponent)
        return 90;
    return 200;
}

- (IBAction)onClick:(id)sender
{
    NSInteger stateRow = [_mPickerView selectedRowInComponent:kAreaComponent];
    NSInteger zipRow = [_mPickerView selectedRowInComponent:kZipComponent];
    
    NSString *state = [mAreaNameArray objectAtIndex:stateRow];
    NSString *zip = [mZipCodeArray objectAtIndex:zipRow];
    
    NSString *title = [[NSString alloc] initWithFormat:@"You select zip code %@.", zip];
    
    NSString *message = [[NSString alloc] initWithFormat:@"%@ is in %@", zip, state];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)onBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onNext:(id)sender
{
    PickerGameViewController * _vc = [[PickerGameViewController alloc]init];
   //  [self presentModalViewController:_vc animated:YES];
    [self presentViewController:_vc
                       animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
