//
//  ThreeViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "ThreeViewController.h"
#import "PickerViewController.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *array = [[NSArray alloc] initWithObjects:@"Luke", @"Leia",
                      @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando", nil];
    mNSArray = array;
    
//    _mSinglePicker.delegate = self;
//    _mSinglePicker.dataSource = self;
//    _mSinglePicker.frame = CGRectMake(0, 400, 320, 216);
}

- (void)viewDidAppear:(BOOL)animated
{
//    NSArray *array = [[NSArray alloc] initWithObjects:@"Luke", @"Leia",
//                      @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando", nil];
//    _mNSArrayPickerData = array;
}

- (void)viewWillAppear:(BOOL)animated
{
//    NSArray *array = [[NSArray alloc] initWithObjects:@"Luke", @"Leia",
//                      @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando", nil];
//    _mNSArrayPickerData = array;
}

//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//    NSInteger row = [selectPicker selectedRowInComponent:0];
//    self.textField.text = [pickerArray objectAtIndex:row];
//}

- (void)viewDidUnload
{
   // [self setSinglePicker:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [mNSArray count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [mNSArray objectAtIndex:row];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onClick:(id)sender
{
   
    NSInteger row = [_mSinglePicker selectedRowInComponent:0];
    NSString *selected = [mNSArray objectAtIndex:row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!", selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:@"Thank you for choosing."
                                                   delegate:nil
                                          cancelButtonTitle:@"You're Welcome"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)onNext:(id)sender {
    PickerViewController * _picker =  [[PickerViewController alloc]init];
    [self presentModalViewController:_picker animated:YES];
}
@end
