
#import "AHGChangePasswordViewController.h"

@interface AHGChangePasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property(nonatomic, weak)IBOutlet UITextField * fuckXcode;

@property (weak, nonatomic) IBOutlet UITextField *surePasswordTextField;
@end

@implementation AHGChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.tableFooterView = [UIView new];
}
- (IBAction)savePasswordChangeAction:(id)sender {
    if ([_passwordTextField.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"请输入您的原始密码"];
        return;
    }
    if ([_fuckXcode.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"请输入您的新密码"];
        return;
    }
    if ([_surePasswordTextField.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"请再次输入您的新密码"];
        return;
    }
    if (![_surePasswordTextField.text isEqualToString:_fuckXcode.text]) {
        [Utile showPromptAlertWithString:@"您两次输入的新密码不一致"];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
