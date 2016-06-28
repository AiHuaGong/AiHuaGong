//
//  BaseTableViewController.m
//  AiHuaGong-C
//
//  Created by ap on 16/6/27.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 16;

}
@end
