// $_FILEHEADER_BEGIN ***************************
// 版权声明:北京畅聊天下科技有限公司版权所有
// Copyright © 2012 - Changliao Technology Co.Ltd. All Rights Reserved
// 文件名称: UncaughtExceptionHandler.m
// 创建日期: 15-07-09
// 创 建 人: 王亚军
// 文件说明: 抓取Signal特殊异常崩溃
// $_FILEHEADER_END *****************************

#import "UncaughtExceptionHandler.h"

#include <libkern/OSAtomic.h>
#include <execinfo.h>

NSString * const UncaughtExceptionHandlerSignalExceptionName = @"UncaughtExceptionHandlerSignalExceptionName";

NSString * const UncaughtExceptionHandlerSignalKey = @"UncaughtExceptionHandlerSignalKey";

NSString * const UncaughtExceptionHandlerAddressesKey = @"UncaughtExceptionHandlerAddressesKey";

volatile int64_t UncaughtExceptionCount = 0;

const int64_t UncaughtExceptionMaximum = 10;

const NSInteger UncaughtExceptionHandlerSkipAddressCount = 4;

const NSInteger UncaughtExceptionHandlerReportAddressCount = 5;


@implementation UncaughtExceptionHandler

+ (NSArray *)backtrace
{
    void* callstack[128];
    
    int frames = backtrace(callstack, 128);
    
    char **strs = backtrace_symbols(callstack, frames);
    
    int i;
    
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    
    for (
         
         i = UncaughtExceptionHandlerSkipAddressCount;
         
         i < UncaughtExceptionHandlerSkipAddressCount +
         
         UncaughtExceptionHandlerReportAddressCount;
         
         i++)
        
    {
        
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
        
    }
    
    free(strs);
    
    return backtrace;
    
}

- (void)alertView:(UIAlertView *)anAlertView clickedButtonAtIndex:(NSInteger)anIndex
{
    if (anIndex == 0)
    {
        dismissed = YES;
    }
    else if (anIndex==1)
    {
        NSLog(@"ssssssss");
    }
}

- (void)validateAndSaveCriticalApplicationData
{
    //保存异常
}

- (void)handleException:(NSException *)exception
{
    [self validateAndSaveCriticalApplicationData];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"抱歉，程序出现了异常", nil)
      message:[NSString stringWithFormat:NSLocalizedString(
                                                           @"如果点击继续，程序有可能会出现其他的问题，建议您还是点击退出按钮并重新打开\n\n"
                                                           @"异常原因如下:\n%@\n%@", nil),
               [exception reason],
               [[exception userInfo] objectForKey:UncaughtExceptionHandlerAddressesKey]]
      delegate:self
      cancelButtonTitle:NSLocalizedString(@"退出", nil)
      otherButtonTitles:NSLocalizedString(@"继续", nil), nil]
     ;
    [alert show];
    
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    
    CFArrayRef allModes = CFRunLoopCopyAllModes(runLoop);
    
    while (!dismissed)
    {
      for (NSString *mode in (NSArray *) CFBridgingRelease(allModes))
      {
         CFRunLoopRunInMode((CFStringRef)mode, 0.001, false);
      }
    }
    
    CFRelease(allModes);
    
    NSSetUncaughtExceptionHandler(NULL);
    
    signal(SIGABRT, SIG_DFL);
    
    signal(SIGILL, SIG_DFL);
    
    signal(SIGSEGV, SIG_DFL);
    
    signal(SIGFPE, SIG_DFL);
    
    signal(SIGBUS, SIG_DFL);
    
    signal(SIGPIPE, SIG_DFL);
    
    if ([[exception name] isEqual:UncaughtExceptionHandlerSignalExceptionName])
    {
        kill(getpid(), [[[exception userInfo] objectForKey:UncaughtExceptionHandlerSignalKey] intValue]);
    }
    else
    {
        [exception raise];
    }
    
}
@end
NSString* getAppInfo()
{
    
    NSString * appInfo = [NSString stringWithFormat:@"App : %@ %@(%@)\nDevice : %@\nOS Version : %@ %@\nUDID : %@\n",
                          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"],
                          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],
                          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"],
                          [UIDevice currentDevice].model, [UIDevice currentDevice].systemName,
                          [UIDevice currentDevice].systemVersion,
                          [UIDevice currentDevice].identifierForVendor];
    NSLog(@"Crash!!!! %@", appInfo);
    return appInfo;
}
void MySignalHandler(int signal)
{
    int64_t exceptionCount = OSAtomicIncrement64(&UncaughtExceptionCount);
    if (exceptionCount >= UncaughtExceptionMaximum)
    {
        return;
    }
    
    NSMutableDictionary * userInfo = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithInt:signal] forKey:UncaughtExceptionHandlerSignalKey];
    
    NSArray * callStack = [UncaughtExceptionHandler backtrace];
    NSLog(@"callStack:%@",callStack);
    
    [userInfo setObject:callStack
     
                 forKey:UncaughtExceptionHandlerAddressesKey];
    
    [[[UncaughtExceptionHandler alloc] init]
     
     performSelectorOnMainThread:@selector(handleException:)
     
     withObject:
     
     [NSException exceptionWithName:UncaughtExceptionHandlerSignalExceptionName
      
      reason:
      
      [NSString stringWithFormat:NSLocalizedString(@"Signal %d was raised.\n" @"%@", nil), signal, getAppInfo()]
      
      userInfo:
      
      [NSDictionary
       
       dictionaryWithObject:[NSNumber numberWithInt:signal]
       
       forKey:UncaughtExceptionHandlerSignalKey]]
     
     waitUntilDone:YES];
}
void InstallUncaughtExceptionHandler()
{
    signal(SIGABRT, MySignalHandler);
    
    signal(SIGILL, MySignalHandler);
    
    signal(SIGSEGV, MySignalHandler);
    
    signal(SIGFPE, MySignalHandler);
    
    signal(SIGBUS, MySignalHandler);
    
    signal(SIGPIPE, MySignalHandler);
}

void HandleException(NSException *exception)
{
    int64_t exceptionCount = OSAtomicIncrement64(&UncaughtExceptionCount);
    if (exceptionCount > UncaughtExceptionMaximum)
    {
        return;
    }
    
    NSArray *callStack = [UncaughtExceptionHandler backtrace];
    NSLog(@"callStack:%@",callStack);
    
    NSMutableDictionary *userInfo =
    [NSMutableDictionary dictionaryWithDictionary:[exception userInfo]];
    [userInfo
     setObject:callStack
     forKey:UncaughtExceptionHandlerAddressesKey];
    
    [[[UncaughtExceptionHandler alloc] init]
     performSelectorOnMainThread:@selector(handleException:)
     withObject:
     [NSException
      exceptionWithName:[exception name]
      reason:[exception reason]
      userInfo:userInfo]
     waitUntilDone:YES];
}
