
#import "AHGTimeSalesViewController.h"
#import "AHGtimesCell.h"
@interface AHGTimeSalesViewController ()<AHGtimesCellDelegate>
@property(nonatomic, strong)NSMutableArray *dataAarray;
@end

@implementation AHGTimeSalesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"限时抢购";
     self.tableView.tableFooterView = [UIView new];
    TimeSales * time = [[TimeSales alloc]init];
    MBProgressHUD * hud = [Utile showHudInView:self.tableView];
    [time excuteWhithSuccess:^(NSURLSessionDataTask *response, id responseDate) {
        hud.hidden = YES;
        NSArray * arr = responseDate;
        if (arr.count > 0) {
            self.dataAarray = [NSMutableArray arrayWithArray:responseDate];
            NSLog(@"得到的结果是：%@",self.dataAarray);
            [self.tableView reloadData];
        }
        else{
            [Utile showWZHUDWithView:self.tableView andString:@"没有数据~~"];
            
        }
        
    } failure:^(NSURLSessionDataTask *response, NSError *error) {
        [Utile showPromptAlertWithString:error.description];
        hud.hidden = YES;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - AHGtimesCellDelegate
-(void)buyButtonClickedWithProductId:(NSInteger)productId{
    NSLog(@"点击了了购买按钮");

}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  self.dataAarray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *infoIdentifier = @"AHGtimesCell";
    
    AHGtimesCell * cell = [tableView dequeueReusableCellWithIdentifier:infoIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AHGtimesCell" owner:self options:nil] firstObject];
        cell.delegate = self;
        
    }

    
    return cell;
}


@end
