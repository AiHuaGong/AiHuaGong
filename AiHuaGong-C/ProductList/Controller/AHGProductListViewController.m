
#import "AHGProductListViewController.h"
#import "AHGTabBarViewController.h"
@interface AHGProductListViewController ()

@end

@implementation AHGProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品分类";
    self.view.backgroundColor = [UIColor whiteColor];
    [self getdataAction];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[AHGTabBarViewController sharedInstance]changeFromType:@"1"];
    
}

-(void)getdataAction{
    ShopListApi * list = [[ShopListApi alloc]init];
    MBProgressHUD * hud = [Utile showHudInView:self.view];
    [list excuteWhithSuccess:^(NSURLSessionDataTask *response, id responseDate) {
        hud.hidden = YES;
        NSArray * arr = responseDate;
        NSLog(@"得到的数组个数：%lu",(unsigned long)arr.count);
        
        
    } failure:^(NSURLSessionDataTask *response, NSError *error) {
        [Utile showPromptAlertWithString:error.description];
        hud.hidden = YES;
    }];

}

@end
