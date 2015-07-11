//
//  RunsLogUtils.m
//  MyTestApp
//
//  Created by wy0012 on 15/6/29.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import "RunsLogUtils.h"

#define  SINGLELOGMAXSIZE 1024 * 1024 * 2

@implementation RunsLogUtils

static bool _isNeedCheckLogFileSize = NO;
static RunsLogUtils * mRunsLogUtils = nil;
+ (RunsLogUtils * )getInstacne
{
    @synchronized(self)
    {
        if (mRunsLogUtils == nil)
        {
            mRunsLogUtils = [[RunsLogUtils alloc] init];
        }
    }
    
    return mRunsLogUtils;
}

+ (void)redirectionStdErrToFile
{
#if TARGET_OS_IPHONE
    
    //真机需要使用日志文件
    NSString * _docPath         = NSTemporaryDirectory();
    NSString * _logPath         = [_docPath stringByAppendingPathComponent:@"runs.log"];
    NSString * _alterPath       = [_docPath stringByAppendingPathComponent:@"runs_alter.log"];
    NSFileManager * _fileMagaer = [NSFileManager defaultManager];
    
    NSError * _error = nil;
    if ([_fileMagaer fileExistsAtPath:_logPath])
    {
        BOOL _isNeedAlternateLogFile = NO;
        NSDictionary * _logFileAttributes = [_fileMagaer attributesOfItemAtPath:_logPath error:&_error];
        
        if (_logFileAttributes != nil)
        {
            NSNumber * _logFileSize = [_logFileAttributes objectForKey:NSFileSize];
            _isNeedAlternateLogFile = [_logFileSize unsignedLongLongValue] > SINGLELOGMAXSIZE ? YES : NO;
        }
        
        if (_isNeedAlternateLogFile)
        {
            [_fileMagaer removeItemAtPath:_logPath error:&_error];
            [_fileMagaer moveItemAtPath:_logPath toPath:_alterPath error:&_error];
        }
    }
    
    freopen([_logPath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([_logPath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    
    _isNeedCheckLogFileSize = YES;
#else
  //非真机上不用日志文件
#endif
    
}

+ (void)checkLogFileSize
{
# if TARGET_OS_IPHONE
    if (_isNeedCheckLogFileSize)
    {
        [RunsLogUtils redirectionStdErrToFile];
    }
#else
    //非真机无需检查
#endif
    
}

@end
