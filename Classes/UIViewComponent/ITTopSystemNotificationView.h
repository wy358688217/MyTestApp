//
//  ITTopSystemNotificationView.h
//  UIPracticeDemo
//
//  Created by wy0012 on 15/4/11.
//  Copyright (c) 2015年 Wang YaJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITTopSystemNotificationView : UIView
{
    UILabel * _mpContentLabel;
    NSString * _mpContentText;
    
    CGFloat _mpDurationTime;
    CGFloat _mpViewCenterWidth;
    CGFloat _mpViewCenterHeigh;
    CGSize  _mpAutosize;
    UIColor* _mpUIColor;
}

- (void)show;
- (void)dismiss;

- (void)uiConfigWithContent:(NSString *)content withDelayTime:(CGFloat) _dt withColor:(UIColor*) _color;

- (void)uiConfigWithContent:(NSString *)content;
@end
