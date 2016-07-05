
#import "AHGFillOrderViewController.h"

@interface AHGFillOrderViewController ()<UITextViewDelegate,UIScrollViewDelegate>
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

/**
 *  des 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写订单";
    self.otherTextView.delegate = self;
    _picAarray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSString *string = [NSString stringWithFormat:@"%d",i];
        [_picAarray addObject:string];
    }
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self showPicAction];

}
-(void)showPicAction{
    UIScrollView * sc = [[UIScrollView alloc]initWithFrame:_basePhotoView.bounds];
    sc.delegate = self;
    sc.directionalLockEnabled = YES;
    [_basePhotoView addSubview:sc];
    sc.backgroundColor = [UIColor whiteColor];
    CGFloat margent = 8 ;
    CGFloat viewHeight = CGRectGetHeight(_basePhotoView.frame) - margent* 2;
    
    for (int i = 0; i< _picAarray.count; i++) {
        UIImageView * im = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"interesting_person"]];
        im.frame = CGRectMake(margent +i * (margent + viewHeight) , margent, viewHeight, viewHeight);
        [sc addSubview:im];
    }
    sc.contentSize = CGSizeMake(margent +_picAarray.count * (margent + viewHeight), viewHeight + margent * 2);
    
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
