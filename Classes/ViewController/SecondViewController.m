//
//  SecondViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/5/25.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_mTextlabel setText:[NSString stringWithFormat:@"%@",_mText ]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -代理方法
-(void) passValue:(NSString *)value
{
    _mText = value;
    //[_mTextlabel setText:[NSString stringWithFormat:@"%@",value ]];
    NSLog(@"values:::%@",value);
}
#pragma mark -代理方法end
- (IBAction)onBack:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    NSInteger _index = buttonIndex;
    
    //if(buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *msg = nil;
        
        switch (_index) {
            case 0:
                msg = @"You can breathe easy, everything went OK.";
                break;
            case 1:
                msg = @"What do you want?, everything went OK.";
                break;
            case 2:
                msg = @"Why are you do that?, everything went OK.";
                break;
                
            default:
                msg = @"another, everything went OK.";
                break;
        }
        
   
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Something was done"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Phew!"
                              otherButtonTitles:nil];
        
        [alert show];
    }
}

- (IBAction)onButonOne:(id)sender
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc]
                                   initWithTitle:@"Are you sure?"
                                   delegate:self
                                   cancelButtonTitle:@"No Way!"
                                   destructiveButtonTitle:@"Yes, I'm Sure!"
                                   otherButtonTitles:@"What do you want?",@"Why are you do that?",nil];
    [actionSheet showInView:self.view];
}

- (IBAction)onButtonTwo:(id)sender
{
    
}

- (IBAction)onButtonThree:(id)sender
{
    
}

- (IBAction)onButtonFour:(id)sender
{
    
}
@end
