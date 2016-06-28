//
//  AHGLoginViewController.m
//  AiHuaGong-C
//
//  Created by ap on 16/6/27.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import "AHGLoginViewController.h"

@interface AHGLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;

@end

@implementation AHGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
-(void)dismissAction{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)loginButtonClicked:(id)sender {
    if ([self.usernameLabel.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"请输入您的手机号码"];
        return;
    }
    if ([self.passwordLabel.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"请输入您的密码"];
        return;
    }
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 8;
}
@end
