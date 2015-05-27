//
//  SystemNotifyTextMangaer.m
//  MyTestApp
//
//  Created by wy0012 on 15/4/29.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "SystemNotifyTextMangaer.h"

@implementation SystemNotifyTextMangaer

-(id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    mTextObjMutArray = [NSMutableArray arrayWithCapacity:8];
    mIndex = 0;
    
    return  self;
}


- (void)pushObjToArray:(SystemNotifyTextObject*) _obj
{
    [mTextObjMutArray addObject:_obj];
    int iStartTime = _obj.mStartTime;
    int iStopTime  = _obj.mEndTime;
    int iDurationTime = iStopTime - iStartTime;
    [self performSelector:@selector(destoryObj) withObject:nil afterDelay:iDurationTime];
}

- (void)destoryObj
{
        for (int i = 0; i < [mTextObjMutArray count]; i++)
        {
            SystemNotifyTextObject* _obj = [mTextObjMutArray objectAtIndex:i];
            
            if ( _obj != nil )
            {

                int iStopTime  = _obj.mStopTime;

                UInt64 msecond2 = [[NSDate date] timeIntervalSince1970]*1000;
                
                if (iStopTime <= msecond2)
                {
                    _obj = nil;
                }
            }
        }
}

@end

@implementation SystemNotifyTextObject



@end