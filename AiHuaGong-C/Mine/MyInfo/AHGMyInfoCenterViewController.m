
#import "AHGMyInfoCenterViewController.h"
#import "LZCartViewController.h"
#import "AHGChangeAddressViewController.h"
#import "AHGAddressHandleViewController.h"
#import "AHGOrderHomeViewController.h"
@interface AHGMyInfoCenterViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *changeAddressCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *callUsCell;
@property (weak, nonatomic) IBOutlet UILabel *changTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *mailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation AHGMyInfoCenterViewController
-(void)setLineHeight:(NSString*)address{

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:address];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:10];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [address length])];
    self.addressLabel.attributedText = attributedString;
//    [self.view addSubview:label];
    [self.addressLabel sizeToFit];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, VIEW_WIDTH, 100);
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIButton * bu = [[UIButton alloc]initWithFrame:CGRectMake(16,16, VIEW_WIDTH - 32, 40)];
    [bu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bu setTitle:@"退出登录" forState:UIControlStateNormal];
    [bu setBackgroundColor:[UIColor orangeColor]];
    bu.layer.cornerRadius = 5;
    bu.clipsToBounds = YES;
    [bu addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:bu]; 
   self.tableView.tableFooterView = view;
    self.addressLabel.text = @"广东省 广州市 天河区 \n东圃镇东圃樱花路化工城 ";
    [self setLineHeight:self.addressLabel.text];
    NSArray * arr = [self.addressLabel.text componentsSeparatedByString:@"\n"];
    NSLog(@"看看数组：%@  dddd---%@",arr[0],arr[1]);
    
    
}
-(void)logoutAction{
    NSLog(@"退出登录");
    [self.navigationController popToRootViewControllerAnimated:YES];

}
//我的订单
- (IBAction)showMyOrderList:(id)sender {
    
    AHGOrderHomeViewController * order = [[AHGOrderHomeViewController alloc]init];
    [self.navigationController pushViewController:order animated:YES];
}
//购物车
- (IBAction)showMyShoppingCar:(id)sender {
    LZCartViewController * la = [[LZCartViewController alloc]init];
    la.fromType = @"2";
    [self presentViewController:la animated:YES completion:nil];
    
}


#pragma marks - TableViewDelegate / dataSource
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    UIStoryboard *borad = [UIStoryboard storyboardWithName:@"MyInfoSB" bundle:[NSBundle mainBundle]];
    if (cell == _changeAddressCell) {
        NSLog(@"dadad ");
        AHGChangeAddressViewController *change =[borad instantiateViewControllerWithIdentifier:@"AHGChangeAddressViewController"] ;
        [self.navigationController pushViewController:change animated:YES];
    }
    else if (cell == _callUsCell){
        [Utile telActionWithPhoneNumber:@"020-29842873"];
    
    }

}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * vi = [[UIView alloc]init];
    
    vi.frame = CGRectMake(0, 0, VIEW_WIDTH, 30);
    vi.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel * la = [[UILabel alloc]init];
    la.text = @"地址管理";
    la.font = [UIFont systemFontOfSize:13];
    la.textColor = [UIColor scrollViewTexturedBackgroundColor];
    la.frame = CGRectMake(0, 0, 94, 30);
    la.textAlignment = NSTextAlignmentCenter;
    [vi addSubview:la];
    
    UIButton * bu = [[UIButton alloc]init];
    bu.frame = CGRectMake(VIEW_WIDTH - 80, 0, 80, 30);
    [bu setTitle:@"管理" forState:UIControlStateNormal];
    [vi addSubview:bu];
    [bu setTitleColor:[UIColor scrollViewTexturedBackgroundColor] forState:UIControlStateNormal];
    [bu setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    bu.titleLabel.font = [UIFont systemFontOfSize:13];
    [bu addTarget:self action:@selector(handleAddress) forControlEvents:UIControlEventTouchUpInside];
    if (section == 1) {
        
        return vi;
    }
    return nil;
}
-(void)handleAddress{
    NSLog(@"去管理地址");
    AHGAddressHandleViewController * address = [[AHGAddressHandleViewController alloc]init];
    [self.navigationController pushViewController:address animated:YES];
}
@end
