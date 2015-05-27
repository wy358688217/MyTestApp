//
//  TableViewController.h
//  MyTestApp
//
//  Created by wy0012 on 15/5/26.
//  Copyright (c) 2015年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray * mTableCellData;
}
- (IBAction)onBack:(id)sender;

@end
