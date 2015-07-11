//
//  AppDelegate.m
//  MyTestApp
//
//  Created by wy0012 on 15/4/11.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTestViewController.h"
#import "TestDelegeteViewController.h"
#import "RunsLogUtils.h"
#import "ITTestView.h"

#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

#import "UncaughtExceptionHandler.h"
#import "DurexKit.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //setSafeKitLogType(SafeKitLogTypeInfo | SafeKitLogTypeWarning | SafeKitLogTypeError);
    //抓取crash
    NSSetUncaughtExceptionHandler(&HandleException);
    InstallUncaughtExceptionHandler();
    
    //[Fabric with:@[CrashlyticsKit]];
    
    //[Crashlytics startWithAPIKey:@"9c1aa744bc1376fa16dd30cf11958d43fc5e5fff"];// aa2ed6fd539ce2168b06ff019af481c9f78f14a98f68ba36e376232e7d608741  aa2ed6fd539ce2168b06ff019af481c9f78f14a98f68ba36e376232e7d608741
//    [[Crashlytics sharedInstance] setUserName:@"wy0012"];
//    [[Crashlytics sharedInstance] setUserEmail:@"2037921944@qq.com"];
//    [[Crashlytics sharedInstance] setUserIdentifier:@"Mr.Wang"];
    //[[Crashlytics sharedInstance] crash];
    
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    
//    ITTestView * testView = [[[NSBundle mainBundle]loadNibNamed:@"ITTestView" owner:nil options:nil]firstObject];
//    [testView setFrame:CGRectMake(0, 20, 320, 30)];
//    [self.rootController.view addSubview:testView];
    return YES;
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    // 切后台时检查日志文件大小
    [RunsLogUtils checkLogFileSize];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
