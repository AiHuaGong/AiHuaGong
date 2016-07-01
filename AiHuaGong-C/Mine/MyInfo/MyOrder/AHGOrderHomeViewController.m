
#import "AHGOrderHomeViewController.h"
#import "SlideHeadView.h"
#import "AHGOrderAllViewController.h"
#import "AHGOrderFinishViewController.h"
#import "AHGOrderStatusViewController.h"

@interface AHGOrderHomeViewController ()

@end

@implementation AHGOrderHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    SlideHeadView *slideVC = [[SlideHeadView alloc]init];
    [self.view addSubview:slideVC];
    AHGOrderAllViewController * all = [[AHGOrderAllViewController alloc]init];
    AHGOrderStatusViewController * pay = [[AHGOrderStatusViewController alloc]initWithOrderStatus:AHGOrderStatusWaittingPay];
    AHGOrderStatusViewController * receive = [[AHGOrderStatusViewController alloc]initWithOrderStatus:AHGOrderStatusWaittingReceive];
    AHGOrderStatusViewController * refund = [[AHGOrderStatusViewController alloc]initWithOrderStatus:AHGOrderStatusRefunds];
    AHGOrderFinishViewController * finish = [[AHGOrderFinishViewController alloc]init];
    
    [slideVC addChildViewController:all title:@"全部"];
    [slideVC addChildViewController:pay title:@"待付款"];
    [slideVC addChildViewController:receive title:@"待收货"];
    [slideVC addChildViewController:refund title:@"退款"];
    [slideVC addChildViewController:finish title:@"已完成"];
    
    [slideVC setSlideHeadView];
    
}


@end
