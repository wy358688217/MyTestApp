// $_FILEHEADER_BEGIN ***************************
// 版权声明:北京畅聊天下科技有限公司版权所有
// Copyright © 2012 - Changliao Technology Co.Ltd. All Rights Reserved
// 文件名称: UncaughtExceptionHandler.h
// 创建日期: 15-07-09
// 创 建 人: 王亚军
// 文件说明: 抓取Signal特殊异常崩溃
// $_FILEHEADER_END *****************************

#import <Foundation/Foundation.h>

@interface UncaughtExceptionHandler : NSObject
{
    BOOL dismissed;
}
//+ (NSArray *)backtrace;
@end
NSString* getAppInfo();
void HandleException(NSException *exception);
void MySignalHandler(int signal);
void InstallUncaughtExceptionHandler(void);


