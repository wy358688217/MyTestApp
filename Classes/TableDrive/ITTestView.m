//
//  ITTestView.m
//  fTalk
//
//  Created by Zzz on 15/4/24.
//
//

#import "ITTestView.h"

#define kBossCurrentTime 610
#define kBossTotalTime 600
#define kBossid 10000000
@implementation ITTestView
{
    int current;
    int bossID;
}
- (void)awakeFromNib
{
    current = kBossCurrentTime;
}

- (IBAction)btn1:(id)sender
{
    
    //常见异常1---不存在方法引用
    [self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];

}

- (IBAction)btn2:(id)sender 
{
    //常见异常2---键值对引用nil
    [[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];
    return;
}

- (IBAction)btn3:(id)sender 
{
    //常见异常3---数组越界
    [[NSArray array] objectAtIndex:1];
    return;
}

- (IBAction)btn4:(id)sender 
{
    //常见异常4---memory warning 级别3以上
    [self performSelector:@selector(killMemory) withObject:nil];
    return;
}

- (IBAction)btn5:(id)sender 
{
    
    return;
}

- (IBAction)btn6:(id)sender 
{
    current = kBossCurrentTime;
}

- (void) killMemory
{
    //内存级别3
    for (int i = 0; i < 300; i ++)
    {
        UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        tmpLabel.layer.masksToBounds = YES;
        tmpLabel.layer.cornerRadius = 10;
        tmpLabel.backgroundColor = [UIColor redColor];
        [self addSubview:tmpLabel];
    }
}

@end
