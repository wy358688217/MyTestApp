//
//  main.m
//  MyTestApp
//
//  Created by wy0012 on 15/4/11.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RunsLogUtils.h"
int main(int argc, char * argv[]) {
    @autoreleasepool
    {
        //[RunsLogUtils redirectionStdErrToFile];
        
        NSLog(@"+++++++++++++++++App Start+++++++++++++++");
        
        int _rt = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        NSLog(@"+++++++++++++++++App End+++++++++++++++++");
        
        return _rt;
        
    }
}
