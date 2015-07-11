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
#import "TestRecevier.h"
#import "TestInvoker.h"
#import "TestCommands.h"
#import "TestConcreteCommands.h"
#import "DurexKit.h"
#import "ITTestView.h"
#define StarAniCount 29

@interface MyTestViewController ()

@end

@implementation MyTestViewController
{
    //UIImageView * _starAniView;
}

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
//    
//    UIImageView * _imgview = [[UIImageView alloc] init];
//    [self displayStarAnimation:1 withImageView:_imgview];
//    [_imgview setFrame:CGRectMake(100, 100, 30, 50)];
//    UIImageView * _imgview1 = [[UIImageView alloc] init];
//    [self displayStarAnimation:50 withImageView:_imgview1];
//    [_imgview1 setFrame:CGRectMake(150, 100, 30, 50)];
//    UIImageView * _imgview11 = [[UIImageView alloc] init];
//    [self displayStarAnimation:100 withImageView:_imgview11];
//    [_imgview11 setFrame:CGRectMake(200, 100, 30, 50)];

    setSafeKitLogType(SafeKitLogTypeInfo | SafeKitLogTypeWarning | SafeKitLogTypeError);
//
   mInt = 0;
    
    ITTestView * testView = [[[NSBundle mainBundle]loadNibNamed:@"ITTestView" owner:nil options:nil]firstObject];
    [testView setFrame:CGRectMake(0, 20, 320, 30)];
    [self.view addSubview:testView];
}

- (void)displayStarAnimation:(NSInteger)_count withImageView:(UIImageView *)_starAniView
{
    if (_starAniView.isAnimating)
    {
        return;
    }
    
    NSMutableArray * _aniArray = [[NSMutableArray alloc]initWithCapacity:StarAniCount];;
    
    for (int i = 0; i < StarAniCount; i++)
    {
        NSString * _str  = [NSString stringWithFormat:@"star_%d.png",i];
        UIImage * _image = [UIImage imageNamed:_str];
        [_aniArray addObject:_image];
    }
    
    
    [_starAniView setAnimationImages:_aniArray];
    [_starAniView setAnimationDuration:6.3f];
    [_starAniView setAnimationRepeatCount:_count];
    [_starAniView startAnimating];
    
    [self.view addSubview:_starAniView];
    
    CGFloat _dt = _count * 7;
    [self performSelector:@selector(removeStarAnimation:) withObject:_starAniView afterDelay:_dt];

}

- (void)removeStarAnimation:(UIImageView *)_imageView
{
    if (_imageView) {
        [_imageView removeFromSuperview];
        _imageView = nil;
    }
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



- (IBAction)buttonChangeText:(id)sender
{
    
    //常见异常1---不存在方法引用
    [self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];
    return;
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
//    UIImageView * _imgview = [[UIImageView alloc] init];
//    [self displayStarAnimation:1 withImageView:_imgview];
//    [_imgview setFrame:CGRectMake(100, 100, 30, 50)];
//    UIImageView * _imgview1 = [[UIImageView alloc] init];
//    [self displayStarAnimation:50 withImageView:_imgview1];
//    [_imgview1 setFrame:CGRectMake(150, 100, 30, 50)];
//    UIImageView * _imgview11 = [[UIImageView alloc] init];
//    [self displayStarAnimation:100 withImageView:_imgview11];
//    [_imgview11 setFrame:CGRectMake(200, 100, 30, 50)];
//   
    if (_mpITTopSystemNotificationView == nil)
    {
        _mpITTopSystemNotificationView = [[ITTopSystemNotificationView alloc] init];
        
        [_mpITTopSystemNotificationView uiConfigWithContent:@"点击按钮可改变文字" withDelayTime:10000.0f withColor:[UIColor greenColor]];
        
        [self.view addSubview:_mpITTopSystemNotificationView];

        [_mpITTopSystemNotificationView show];
    }
    FFLog(([NSString stringWithFormat:@"%d",1000]));
    EXLog(([NSString stringWithFormat:@"%d",1000]));
}

- (void)Action
{
    [self buttonRemove:self];
}

- (IBAction)onGotoCommand:(id)sender
{
    //TestRecevier * _rece = [[TestRecevier alloc] init];
    
    TestCommands * _comm = [[TestConcreteCommands alloc] VcInit:self];
    
    TestInvoker  * _invo = [[TestInvoker alloc] init];
    
    [_invo setCommands:_comm];
    
    [_invo ExecuteCommand];
}

- (IBAction)onNext:(id)sender
{
    SecondViewController * _vc = [[SecondViewController alloc]init];
    mDelegete = _vc;
    //[_vc passValue:@" "];
    [mDelegete passValue:@"老子曰:日上竿头 真特马好热乎"];
    [self presentViewController:_vc animated:YES completion:nil];
    // [self presentModalViewController:_vc animated:YES];
    //[self.navigationController pushViewController:_vc animated:YES];
}

- (IBAction)onBack:(id)sender
{
    NSMutableArray * _arr = [[NSMutableArray alloc] initWithCapacity:16];
    int _count = [_arr count];
    EXLog(([NSString stringWithFormat:@"_arr长度为:%d",_count ]));
    FFLog(([NSString stringWithFormat:@"_arr长度为:%d",_count ]));
    //[self.navigationController pop
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
