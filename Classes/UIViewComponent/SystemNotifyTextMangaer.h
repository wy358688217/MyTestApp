//
//  SystemNotifyTextMangaer.h
//  MyTestApp
//
//  Created by wy0012 on 15/4/29.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SystemNotifyTextObject;

@interface SystemNotifyTextMangaer : NSObject
{
    NSMutableArray* mTextObjMutArray;
    int mIndex;
}

- (void)pushObjToArray:(SystemNotifyTextObject*) _obj;
@end


@interface SystemNotifyTextObject : NSObject

@property (nonatomic, assign) int mStartTime;
@property (nonatomic, assign) int mEndTime;
@property (nonatomic, assign) int mDisplayTime;
@property (nonatomic, assign) int mStopTime;

@end