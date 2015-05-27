//
//  ITTopSystemNotificationView.m
//  UIPracticeDemo
//
//  Created by wy0012 on 15/4/11.
//  Copyright (c) 2015年 Wang YaJun. All rights reserved.
//

#import "ITTopSystemNotificationView.h"

@implementation ITTopSystemNotificationView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _mpContentLabel = [[UILabel alloc]initWithFrame:self.frame];
        _mpContentLabel.textAlignment = UITextWritingDirectionLeftToRight;
        _mpContentLabel.textColor = [UIColor whiteColor];
        //获取屏幕尺寸
        CGRect _rectSelf= [[UIScreen mainScreen] bounds];
        CGSize _size = _rectSelf.size;
        CGFloat _width = _size.width;
        
        self.frame = CGRectMake(0, -20, _width*2, 20);
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

        [self updateLabelPosition];
        
        [self show];
        //self.alpha = 0.5f;
    }
    return self;
}

- (void)show
{
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"status width - %f", rectStatus.size.width); // 宽度
    NSLog(@"status height - %f", rectStatus.size.height);   // 高度
    self.hidden = NO;
    [UIView animateWithDuration:0.1f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.2f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.frame =CGRectMake(0, -20, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

//设置显示文本
- (void)uiConfigWithContent:(NSString *)content withDelayTime:(CGFloat) _dt withColor:(UIColor*) _color
{
    _mpContentText = content;
    _mpDurationTime = _dt;
    _mpUIColor = _color;
    _mpContentLabel.text = _mpContentText;

    [self addSubview:_mpContentLabel];
    [self startAnimation];
}

- (void)uiConfigWithContent:(NSString *)content
{
    if (_mpDurationTime > 0.0f && _mpUIColor != NULL)
    {
        [self uiConfigWithContent:content withDelayTime:_mpDurationTime withColor:_mpUIColor];
        return;
    }
    else if (_mpDurationTime > 0.0f && _mpUIColor == NULL)
    {
        [self uiConfigWithContent:content withDelayTime:_mpDurationTime withColor:[UIColor greenColor]];
        return;
    }
    else if (_mpDurationTime < 0.0f && _mpUIColor != NULL)
    {
        [self uiConfigWithContent:content withDelayTime:10.0f withColor:_mpUIColor];
        return;
    }
    
    [self uiConfigWithContent:content withDelayTime:10.f withColor:[UIColor greenColor]];

}

//更新文本位置
- (void)updateLabelPosition
{
    
    if (_mpContentLabel.superview)
    {
        //获取父节点大小
        NSLog(@"获取父节点大小");
        CGRect  _superviewFrame = [_mpContentLabel.superview frame];
        CGSize  _viewSize = _superviewFrame.size;
        _mpViewCenterWidth = _viewSize.width;
        _mpViewCenterHeigh = _viewSize.height;
        
        //根据文本设置自适应label长度
        NSLog(@"设置文本自适应");
        UIFont * tfont = [UIFont systemFontOfSize:14];
        _mpContentLabel.font = tfont;
        CGSize size =CGSizeMake(_mpViewCenterWidth/2,_mpViewCenterHeigh);
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
        _mpAutosize =[_mpContentText boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
        _mpContentLabel.frame =CGRectMake(_mpViewCenterWidth/2,_mpViewCenterHeigh/2, _mpAutosize.width, _mpAutosize.height);

    }
   
}

-(void)startAnimation
{
    self.backgroundColor = _mpUIColor;//[UIColor _mpUIColor];
    [self updateLabelPosition];

    //动作
    NSLog(@"动作执行");
    _mpContentLabel.center = CGPointMake(_mpViewCenterWidth/2+_mpAutosize.width/2,_mpViewCenterHeigh/2);
    [UIView beginAnimations:nil context:NULL];
    [UIView  setAnimationDuration:3.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationRepeatCount:_mpDurationTime];
    _mpContentLabel.center = CGPointMake(-_mpAutosize.width/2,_mpViewCenterHeigh/2);
    [UIView commitAnimations];
}

- (void)dealloc
{
    [_mpContentLabel.layer removeAllAnimations];
    
}

@end
