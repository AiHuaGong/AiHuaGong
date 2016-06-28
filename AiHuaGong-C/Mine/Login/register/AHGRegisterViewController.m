
#import "AHGRegisterViewController.h"
#import "CountDownButton.h"

@interface AHGRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet CountDownButton *getButton;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end

@implementation AHGRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.getButton.startCountDownColor = [UIColor lightGrayColor];
    self.getButton.stopCountDownColor = [UIColor orangeColor];
    
    
}
- (IBAction)getCodeAction:(id)sender {
    [self.getButton startCountDown];
    
}


- (IBAction)finishRegisterButtonClicked:(id)sender {
    if ([self.nameTextField.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"请输入您的昵称"];
        return;
    }
    if ([self.phoneTextField.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"请输入您的手机号码"];
        return;
    }
    if ([self.codeTextField.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"验证码不能为空"];
        return;
    }
    
}

@end
