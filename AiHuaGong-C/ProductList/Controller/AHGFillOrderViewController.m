
#import "AHGFillOrderViewController.h"

@interface AHGFillOrderViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *namePhone;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIView *basePhotoView;
@property (weak, nonatomic) IBOutlet UILabel *totalCount;
@property (weak, nonatomic) IBOutlet UILabel *payStyle;
@property (weak, nonatomic) IBOutlet UILabel *billInfo;
@property (weak, nonatomic) IBOutlet UILabel *playHolder;
@property (weak, nonatomic) IBOutlet UITextView *otherTextView;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property(nonatomic, strong) NSMutableArray * picAarray;
@end

@implementation AHGFillOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写订单";
    self.otherTextView.delegate = self;
    _picAarray = [NSMutableArray arrayWithCapacity:5];
    
    
}

- (IBAction)payAction:(UIButton *)sender {
    //按不同的方式去支付
    
}

-(void)textViewDidChange:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        self.playHolder.hidden = NO;
    }
    else{
        self.playHolder.hidden = YES;
    }
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        [self.otherTextView resignFirstResponder];
        //        [self handup];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    if (textView == self.otherTextView) {
        if (textView.text.length >= 45) {
            self.otherTextView.text = [textView.text substringToIndex:44];
        }
    }
    return YES;
}



@end
