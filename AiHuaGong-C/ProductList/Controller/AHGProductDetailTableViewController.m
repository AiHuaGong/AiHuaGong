
#import "AHGProductDetailTableViewController.h"
#import "AHGFillOrderViewController.h"

@interface AHGProductDetailTableViewController (){
    NSInteger ViewY;
    UIButton* takeCardButton;
    UITextField * countField;
}
@property (weak, nonatomic) IBOutlet UIView *headerview;
@property (weak, nonatomic) IBOutlet UIImageView *PicImageView;
@property (weak, nonatomic) IBOutlet UILabel *ProductDesLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIView *countView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *CASLabel;
@property (weak, nonatomic) IBOutlet UILabel *ContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *puriteLabel;
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;
@property (weak, nonatomic) IBOutlet UILabel *PaddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *SaddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *startCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *storeCountLabel;
@property(nonatomic, strong)UIView *FooterView;
@property (nonatomic) CGFloat height;//headerView 高
@property(nonatomic) NSInteger productCount;//采购数
@end
@implementation AHGProductDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.productCount = 1;
    [self setFooterAction];
    [self creatFooterView];
    [self setCountViewAction];
    
    
}
-(void)setCountViewAction{
    UIButton * off = [[UIButton alloc]init];
    [off setImage:[UIImage imageNamed:@"cart_cutBtn_nomal"] forState:UIControlStateNormal];
    off.frame = CGRectMake(5, 0, 30, 30);
    [self.countView addSubview:off];
    off.tag = 1;
    [off addTarget:self action:@selector(countAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * add = [[UIButton alloc]init];
    [add setImage:[UIImage imageNamed:@"cart_addBtn_nomal"] forState:UIControlStateNormal];
    add.frame = CGRectMake(55, 0, 30, 30);
    [self.countView addSubview:add];
    add.tag = 2;
    [add addTarget:self action:@selector(countAction:) forControlEvents:UIControlEventTouchUpInside];
    //数量
    countField= [[UITextField alloc]initWithFrame:CGRectMake(35, 0, 20, 30)];
    countField.text = [NSString stringWithFormat:@"%ld",(long)_productCount];
    countField.font = [UIFont systemFontOfSize:15];
    countField.borderStyle = UITextBorderStyleNone;
    [self.countView addSubview:countField];
    countField.textAlignment = NSTextAlignmentCenter;
    
}
-(void)countAction:(UIButton*)bu{
    if (bu.tag == 1) {
        //减
        if (self.productCount > 1) {
            self.productCount--;
            countField.text = [NSString stringWithFormat:@"%ld",(long)_productCount];
        }
        
    }
    else{
        //add
        self.productCount++;
        countField.text = [NSString stringWithFormat:@"%ld",(long)_productCount];
    }


}

//立即购买
-(void)buyNowAction{
    UIStoryboard *borad = [UIStoryboard storyboardWithName:@"ProDetail" bundle:[NSBundle mainBundle]];
    AHGFillOrderViewController *fill =[borad instantiateViewControllerWithIdentifier:@"AHGFillOrderViewController"] ;
    [self.navigationController pushViewController:fill animated:YES] ;

}
//加入购物车
-(void)interShopingCard{

}
//店铺主页
-(void)showHomePageAction{

}
-(void)telAction{

}
-(void)creatFooterView{
//    CGFloat margent = 8;
    CGFloat width = VIEW_WIDTH / 3;
    CGFloat height = 50;
    _FooterView = [[UIView alloc]initWithFrame:CGRectMake(0, self.tableView.frame.size.height - height, self.tableView.frame.size.width, height)];
    ViewY = (NSInteger)_FooterView.frame.origin.y;
    //立即购买
    UIButton * buyButton = [[UIButton alloc]initWithFrame:CGRectMake(width * 2 , 0, width, height)];
    [buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    buyButton.backgroundColor = [UIColor redColor];
    buyButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [buyButton addTarget:self action:@selector(buyNowAction) forControlEvents:UIControlEventTouchUpInside];
    [_FooterView addSubview:buyButton];
    
    //加入购物车
    UIButton * carButton = [[UIButton alloc]initWithFrame:CGRectMake(width , 0, width, height)];
    [carButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [carButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    carButton.backgroundColor = [UIColor orangeColor];
    carButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [carButton addTarget:self action:@selector(interShopingCard) forControlEvents:UIControlEventTouchUpInside];
    [_FooterView addSubview:carButton];
    
    
    
    //店铺主页
    UIButton * shopButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,width/2,height)];
    [shopButton setBackgroundImage:[UIImage imageNamed:@"tab_burning_press"] forState:UIControlStateNormal];
    
    [shopButton addTarget:self action:@selector(showHomePageAction) forControlEvents:UIControlEventTouchUpInside];
    [_FooterView addSubview:shopButton];
   
    
    //客服电话
    UIButton * telButton = [[UIButton alloc]initWithFrame:CGRectMake(width/2,0,width/2,height)];
    [telButton setBackgroundImage:[UIImage imageNamed:@"tab_cool_nor"] forState:UIControlStateNormal];
    [telButton addTarget:self action:@selector(telAction) forControlEvents:UIControlEventTouchUpInside];
    [_FooterView addSubview:telButton];
    [self.tableView addSubview:_FooterView];
    _FooterView.backgroundColor = [UIColor whiteColor];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _FooterView.frame = CGRectMake(_FooterView.frame.origin.x, ViewY+self.tableView.contentOffset.y , _FooterView.frame.size.width, _FooterView.frame.size.height);
}

-(void)setFooterAction{
    CGFloat margent = 10;
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel * line = [[UILabel alloc]init];
    line.frame = CGRectMake(margent, margent, 3, 10);
    line.backgroundColor = [UIColor orangeColor];
    [view addSubview:line];
    
    UILabel * descLabel = [[UILabel alloc]init];
    descLabel.text = @"产品详情";
    descLabel.frame = CGRectMake(CGRectGetMaxX(line.frame) + 5, margent, 150, 15);
    [view addSubview:descLabel];
    
    UILabel * lineLabel = [[UILabel alloc]init];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    lineLabel.frame = CGRectMake(margent, CGRectGetMaxY(descLabel.frame)+ margent, self.tableView.frame.size.width - margent * 2, 1);
    [view addSubview:lineLabel];
    
    UILabel * lastLabel = [[UILabel alloc]init];
    lastLabel.text = @"往往有的时候都是UINavigationController自带过来的，如果使用UISearchDisplayController，searchBar就会自动覆盖，这个情况我试了很多次，包括新创建了一个navigationBar盖在上面，但效果依然不好，对于这种情况，基于我目前的技术，只能舍弃UISearchDisplayController，单纯的用UISearchBar了，虽然效果差了一些，但需要实现的功能照样可以，比如实时搜索，除了重新赋值给array外，额外的操作就是需要reloadData了";
    lastLabel.numberOfLines = 0;
    lastLabel.textColor = [UIColor lightGrayColor];
    lastLabel.font = [UIFont systemFontOfSize:15];
    CGSize size = [Utile getSizeWithString:lastLabel.text font:15 width:CGRectGetWidth(lineLabel.frame)];
    [view addSubview:lastLabel];
    lastLabel.frame = CGRectMake(margent, CGRectGetMaxY(lineLabel.frame) + margent, CGRectGetWidth(lineLabel.frame), size.height + margent);
    view.frame = CGRectMake(0, 0, self.tableView.frame.size.width, CGRectGetMaxY(lastLabel.frame) + 64);

    self.tableView.tableFooterView = view;
}

@end
