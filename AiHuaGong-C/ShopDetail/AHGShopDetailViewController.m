
#import "AHGShopDetailViewController.h"
#import "AHGHomeHeaderView.h"
#import "AHGProductView.h"
@interface AHGShopDetailViewController ()

@end

@implementation AHGShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"旺铺详情";
    NSMutableArray * arr= [NSMutableArray array];
    AHGHomeHeaderView * header = [[AHGHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 150) Array:arr showBelow:NO];
    self.tableView.tableHeaderView = header;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self creatFooterViewAction];
    
}
-(void)cilckedShowProduct:(UIButton*)bu{
    NSLog(@"点击了第---%ld",(long)bu.tag);

}
-(void)creatFooterViewAction{
    UIView * footerview = [[UIView alloc]init];
    footerview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    footerview.frame = CGRectMake(0, 0, VIEW_WIDTH, 100);
    self.tableView.tableFooterView = footerview;
    //推荐产品页面
    UIView * shopVIew = [[UIView alloc]init];
    shopVIew.backgroundColor = [UIColor whiteColor];
    [footerview addSubview:shopVIew];
    shopVIew.frame = CGRectMake(0, MARGENT_DIS, VIEW_WIDTH, 50);
    UIImageView * iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"荐"]];
    //    iconView.adjustsImageWhenAncestorFocused = YES;
    iconView.frame = CGRectMake(MARGENT_DIS, 15, 21, 21);
    [shopVIew addSubview:iconView];
    UILabel * desLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame), 0, 120, CGRectGetHeight(shopVIew.frame))];
    desLabel.textAlignment = NSTextAlignmentCenter;
    desLabel.text = @"推荐产品";
    [shopVIew addSubview:desLabel];

//    UIView * proView = [[UIView alloc]init];
//    [footerview addSubview:proView];
    for (int i = 0; i<6; i++) {
        AHGProductView * view = [[AHGProductView alloc]initWithImage:[UIImage imageNamed:@"default"] money:@"$5000" name:@"爱化工专用产品"];
        CGFloat w = view.frame.size.width;
        CGFloat h = view.frame.size.height;
        view.tag = i;
        if (i< 3) {
            view.frame = CGRectMake(8*(i) + i*w, MARGENT_DIS*2 + 50, w, h);
        }
        else{
            view.frame = CGRectMake(8*(i -3) + (i - 3)*w, MARGENT_DIS*3 + 50 + h, w, h);
            
        }
        UIButton * bu = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, h)];
        [bu addTarget:self action:@selector(cilckedShowProduct:) forControlEvents:UIControlEventTouchUpInside];
        bu.tag = i;
        [view addSubview:bu];
        [footerview addSubview:view];
        if (i == 5) {
            UILabel * desc = [[UILabel alloc]init];
            desc.textColor = [UIColor orangeColor];
            desc.font = [UIFont systemFontOfSize:13];
            desc.frame = CGRectMake(0, MARGENT_DIS*5 + 50 + 2*h, VIEW_WIDTH, 15);
            desc.text = @"AHUGONG   申请化工行业贸易商 开启自己的手机店铺";
            [footerview addSubview:desc];
            desc.textAlignment = NSTextAlignmentCenter;
            
            UILabel * otherLabel = [[UILabel alloc]init];
            otherLabel.textColor = [UIColor lightGrayColor];
            otherLabel.font = [UIFont systemFontOfSize:13];
            otherLabel.text = @"SITEMAP COPYRIGHT@爱化工ahuagong.com 粤ICP备16036291号";
            otherLabel.textAlignment = NSTextAlignmentCenter;
            otherLabel.frame = CGRectMake(0, CGRectGetMaxY(desc.frame)+ MARGENT_DIS, VIEW_WIDTH, 15);
            [footerview addSubview:otherLabel];
            footerview.frame = CGRectMake(0, 0, VIEW_WIDTH, CGRectGetMaxY(otherLabel.frame)+ MARGENT_DIS);
            
        }
    }
    

}

@end
