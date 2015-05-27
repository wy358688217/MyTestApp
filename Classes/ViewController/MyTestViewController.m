//
//  MyTestViewController.m
//  MyTestApp
//
//  Created by wy0012 on 15/4/11.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "MyTestViewController.h"
#import "AppDelegate.h"
#import "ITTopSystemNotificationView.h"
#import "TestDelegeteViewController.h"
#import "SecondViewController.h"
@interface MyTestViewController ()

@end

@implementation MyTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _mpITTopSystemNotificationView = [[ITTopSystemNotificationView alloc] init];
    
    [_mpITTopSystemNotificationView uiConfigWithContent:@"点击按钮可改变文字" withDelayTime:10000.0f withColor:[UIColor greenColor]];
    
    [self.view addSubview:_mpITTopSystemNotificationView];
    
    //获取导航栏高fdu

    
//    UIImage* image = [UIImage imageNamed:@"background0.png"];
//    UIImageView* imageView = [[[UIImageView alloc]initWithImage:image]init];
//    imageView.frame = self.view.bounds;
//    [imageView setNeedsLayout];
//    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    [self.view addSubview:imageView];
//
//    
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
//    [[UIApplication sharedApplication].keyWindow addSubview:imageView];
//    
//    [self.navigationController setNavigationBarHidden:YES animated:UIStatusBarAnimationFade];
//    [self.navigationController setToolbarHidden:YES animated:YES];
    //self.tabBarController.tabBar.hidden = YES;
  [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    
   mInt = 0;
}
static BOOL isHide = YES;
- (BOOL)prefersStatusBarHidden
{
    return isHide; // 返回NO表示要显示，返回YES将hiden
}

-(void) buttonChangeTextButton
{
    [_mpITTopSystemNotificationView uiConfigWithContent:@"变变变变变换换换" withDelayTime:10000.0f withColor:[UIColor yellowColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonChangeText:(id)sender
{
    mInt +=10;
    NSString * str0 = @"换换换";
    NSString * str =[NSString stringWithFormat:@"%d",mInt];
    NSString * str1 = [str0 stringByAppendingString:str];
    [_mpITTopSystemNotificationView uiConfigWithContent:str1];

}

- (IBAction)buttonRemove:(id)sender
{
    if (_mpITTopSystemNotificationView)
    {
        [_mpITTopSystemNotificationView dismiss];
        _mpITTopSystemNotificationView = nil;
    }
}

- (IBAction)buttonCreate:(id)sender
{
   
    if (_mpITTopSystemNotificationView == nil)
    {
        _mpITTopSystemNotificationView = [[ITTopSystemNotificationView alloc] init];
        
        [_mpITTopSystemNotificationView uiConfigWithContent:@"点击按钮可改变文字" withDelayTime:10000.0f withColor:[UIColor greenColor]];
        
        [self.view addSubview:_mpITTopSystemNotificationView];

        [_mpITTopSystemNotificationView show];
    }
}

- (IBAction)onNext:(id)sender
{
    SecondViewController * _vc = [[SecondViewController alloc]init];
    self.mDelegete = _vc;
    //[_vc passValue:@" "];
    [self.mDelegete passValue:@"老子曰:日上竿头 真特马好热乎"];
    [self presentViewController:_vc animated:YES completion:nil];
    // [self presentModalViewController:_vc animated:YES];
    //[self.navigationController pushViewController:_vc animated:YES];
}

- (IBAction)onBack:(id)sender
{
    //[self.navigationController pop
}
@end
