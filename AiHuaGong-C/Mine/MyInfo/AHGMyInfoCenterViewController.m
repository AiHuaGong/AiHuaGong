
#import "AHGMyInfoCenterViewController.h"

@interface AHGMyInfoCenterViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *changeAddressCell;

@end

@implementation AHGMyInfoCenterViewController

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
}
-(void)logoutAction{
    NSLog(@"退出登录");
    [self.navigationController popToRootViewControllerAnimated:YES];

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == _changeAddressCell) {
        NSLog(@"dadad ");
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
}
@end
