
#import "AHGChangeAddressViewController.h"
#import "LZXPickerView.h"
@interface AHGChangeAddressViewController ()<LZXPickerViewDelegate,UITextFieldDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *namelabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneLabel;
@property (weak, nonatomic) IBOutlet UITextField *ompanyLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailAddressTextView;
@property (nonatomic, strong) LZXPickerView *LZXview;


@end

@implementation AHGChangeAddressViewController
- (IBAction)saveChange:(id)sender {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"地址修改";
    self.detailAddressTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.detailAddressTextView.layer.borderWidth = 1;
//    [self.namelabel becomeFirstResponder];
    _namelabel.delegate = self;
    _phoneLabel.delegate = self;
    _ompanyLabel.delegate = self;
    _detailAddressTextView.delegate = self;

}
- (IBAction)chooseAddressButtonClicked:(id)sender {
    if (!_LZXview) {
        _LZXview = [[LZXPickerView alloc]initWithFrame:self.tableView.frame];
        _LZXview.delegate = self;
        [self.view addSubview:_LZXview];
    }
}
-(void)choosenStringWithTag:(NSInteger)tag address:(NSString *)address{
    if (tag == 0) {
        NSLog(@"取消");
    }
    else{
        NSLog(@"得到的结果：%@",self.LZXview.selectString);
        _addressLabel.text = [NSString stringWithFormat:@"%@",address];
    }
    [_LZXview removeFromSuperview];
    _LZXview = nil;

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _namelabel) {
        [_phoneLabel becomeFirstResponder];
    }
    else if(textField == _phoneLabel){
        [_ompanyLabel becomeFirstResponder];
    }
    else{
        [_ompanyLabel resignFirstResponder];
    
    }
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {//按下return键
        //这里隐藏键盘，不做任何处理
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
