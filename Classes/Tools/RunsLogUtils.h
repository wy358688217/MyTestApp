//
//  RunsLogUtils.h
//  MyTestApp
//
//  Created by wy0012 on 15/6/29.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunsLogUtils : NSObject

+ (RunsLogUtils *)getInstacne;

/**
    重定向日志到文件
 */
+ (void)redirectionStdErrToFile;

/**
    检查日志是否超过规定200K 大小
 */
+ (void)checkLogFileSize;

@end
#if defined(DEBUG)
#define FUNCINF [NSString stringWithFormat:@"%@ M:%s Line:%d.", NSStringFromClass([self class]), __func__, __LINE__]
#define EXLog(STRLOG) NSLog(@"%@Line:%d - %@ >> %@ ", self, __LINE__, NSStringFromSelector(_cmd), STRLOG)
#define FFLog(STRLOG) NSLog(@"%@|%@",FUNCINF, STRLOG)
#define EXLogSP(format, ...) NSLog(@"%@: %@ %@", self, NSStringFromSelector(_cmd), ([NSString stringWithFormat:format, ## __VA_ARGS__]))

#else
#if TARGET_IPHONE_SIMULATOR
// 模拟器中仍然显示日志
#define EXLog(STRLOG)
#define EXLogSP(format, ...)
#else
// release版本目前也增加日志吧,正式发部时再决定是否去掉
#define EXLog(STRLOG)
#define EXLogSP(format, ...)
#endif
#endif