
#import "AHGPayStyleViewController.h"

@interface AHGPayStyleViewController ()
@property (weak, nonatomic) IBOutlet UIButton *zhifubao;
@property (weak, nonatomic) IBOutlet UIButton *weixin;
@property (weak, nonatomic) IBOutlet UIButton *wangyin;


@property(nonatomic) NSInteger payType;
@property(strong , nonatomic) UIButton *driverButton;
@end

@implementation AHGPayStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _payType = 1;
    [self setPayStateWithButton:self.zhifubao];
    [self setPayStateWithButton:self.weixin];
    [self setPayStateWithButton:self.wangyin];
    self.weixin.selected = YES;
    self.driverButton = self.weixin;
}
-(void)setPayStateWithButton:(UIButton*)bu{
    [bu setImage:[UIImage imageNamed:@"cart_selected_btn"] forState:UIControlStateSelected];
    [bu setImage:[UIImage imageNamed:@"cart_unSelect_btn"] forState:UIControlStateNormal];

}
- (IBAction)chooseDifferentPayWay:(UIButton*)sender {
    
    if(sender != self.driverButton) {
        self.driverButton.selected = NO;
        self.driverButton = sender;
        self.payType = sender.tag;
    }
    NSLog(@"现在的选择是--%ld",(long)self.payType);
    self.driverButton.selected=YES;
    
}


@end
