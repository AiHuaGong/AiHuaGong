//
//  AHGForgetPasswordSecondViewController.m
//  AiHuaGong-C
//
//  Created by ap on 16/6/27.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import "AHGForgetPasswordSecondViewController.h"

@interface AHGForgetPasswordSecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *surePassword;

@end

@implementation AHGForgetPasswordSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    
}
- (IBAction)finishButtonClicked:(id)sender {
    if ([_password.text isEqualToString:@""] || [_surePassword.text isEqualToString:@""]){
        [Utile showPromptAlertWithString:@"请输入您的新密码"];
        return;
    }
    if (![_password.text isEqualToString:self.surePassword.text]) {
        [Utile showPromptAlertWithString:@"您两次输入的密码不一致"];
        return;
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
