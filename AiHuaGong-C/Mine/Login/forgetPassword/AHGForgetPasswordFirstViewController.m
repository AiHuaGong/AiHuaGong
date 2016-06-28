
#import "AHGForgetPasswordFirstViewController.h"
#import "CountDownButton.h"
#import "AHGForgetPasswordSecondViewController.h"
@interface AHGForgetPasswordFirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextfield;
@property (weak, nonatomic) IBOutlet CountDownButton *codeButton;

@end

@implementation AHGForgetPasswordFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.codeButton.startCountDownColor = [UIColor lightGrayColor];
    self.codeButton.stopCountDownColor = [UIColor orangeColor];
    
}
- (IBAction)getCodeAction:(id)sender {
    [_codeButton startCountDown];
    
}
- (IBAction)nextStep:(id)sender {
    if ([self.phoneTextField.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"请输入您的手机号码"];
        return;
    }
    if ([self.codeTextfield.text isEqualToString:@""]) {
        [Utile showPromptAlertWithString:@"验证码不能为空"];
        return;
    }
    [self performSegueWithIdentifier:@"forgetPassword" sender:nil];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqualToString: @"showProductDetail"] ) {
//         AHGForgetPasswordSecondViewController * second = segue.destinationViewController;
    
    
    }
    
}

@end
