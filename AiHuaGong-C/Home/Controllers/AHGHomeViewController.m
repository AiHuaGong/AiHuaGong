
#import "AHGHomeViewController.h"
#import "AHGHomeHeaderView.h"
#import "Utile.h"
#import "AHGHomeApi.h"
#import "AHGInfoViewController.h"
#import "AHGProductDetailTableViewController.h"
#import "AHGTimeSalesViewController.h"
#import "AHGTabBarViewController.h"
#import "AHGLoginViewController.h"
#import "AHGMyInfoCenterViewController.h"
#import "AHGShopDetailViewController.h"
@interface AHGHomeViewController ()<AHGHomeHeaderViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>{
    AHGHomeHeaderView * header;
}
@property(nonatomic, strong)UISearchDisplayController * searchDisController;
@property(nonatomic, strong)UISearchBar *searchBar;
@property(nonatomic, strong)NSMutableArray * disArray;
@property(nonatomic, strong)NSMutableArray * BannerArray;//轮播图
@property(nonatomic, strong)NSMutableArray * ReStoreArray;//推荐商家数组
@end

@implementation AHGHomeViewController

-(void)getDataAction{
     MBProgressHUD * hud = [Utile showHudInView:self.view];
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        // 轮播图接口
        BannerApi * api = [[BannerApi alloc]init];
        [api excuteWhithSuccess:^(NSURLSessionDataTask *response, id responseDate) {
            NSLog(@"得到结果%@",responseDate);
            for (id key in responseDate) {
                BanModel* card = [BanModel initWithJSON:key] ;
                [_BannerArray addObject:card];
            }
            dispatch_group_leave(group);
        } failure:^(NSURLSessionDataTask *response, NSError *error) {
            [Utile showPromptAlertWithString:error.description];
             dispatch_group_leave(group);
        }];
        
    });
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        //推荐商家接口
        RecondShop * shop = [[RecondShop alloc]init];
        [shop excuteWhithSuccess:^(NSURLSessionDataTask *response, id responseDate) {
            NSLog(@"得到结果%@",responseDate);
            for (id key in responseDate) {
                ReShopModel* model = [ReShopModel initWithJSON:key] ;
                [_ReStoreArray addObject:model];
            }
             dispatch_group_leave(group);
        } failure:^(NSURLSessionDataTask *response, NSError *error) {
            [Utile showPromptAlertWithString:error.description];
             dispatch_group_leave(group);
        }];
    });
    
    // 等待组中的任务执行完毕,回到主线程执行block回调
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        hud.hidden = YES;
        NSLog(@"数组一————%@ 数组二 ——————%@",_BannerArray,_ReStoreArray);
//        UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"个人中心"] style:UIBarButtonItemStylePlain target:self action:@selector(showMyInfo)];
//        self.navigationItem.leftBarButtonItem = left;
//        UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"拨号"] style:UIBarButtonItemStylePlain target:self action:@selector(telAction)];
//        self.navigationItem.rightBarButtonItem = right;
        if (_ReStoreArray.count > 0) {
           [self setFooterView];
        }
        CGRect ViewSize = [[UIScreen mainScreen]bounds];
        if (_BannerArray.count > 0) {
            header = [[AHGHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, ViewSize.size.width, 300) Array:_BannerArray showBelow:YES];
            header.delegate = self;
            //        [self searchAction];
            self.tableView.tableHeaderView = header;
        }
        
    });

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.BannerArray = [NSMutableArray array];
    self.ReStoreArray = [NSMutableArray array];
    [self getDataAction];
    self.title = @"爱化工平台";
    self.disArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
#warning 有接口的时候去掉，用回gcd那边的定义
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"个人中心"] style:UIBarButtonItemStylePlain target:self action:@selector(showMyInfo)];
    self.navigationItem.leftBarButtonItem = left;
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"拨号"] style:UIBarButtonItemStylePlain target:self action:@selector(telAction)];
    self.navigationItem.rightBarButtonItem = right;
    
 }
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[AHGTabBarViewController sharedInstance]changeFromType:@"0"];
//    [[AHGTabBarViewController sharedInstance]addCenterButtonWithImage];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [[AHGTabBarViewController sharedInstance]hideButtonAction:YES];
}

-(void)searchAction{
    self.definesPresentationContext = YES;
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.placeholder = @"请输入商品名称";
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.delegate = self;
    [self.searchBar sizeToFit];
    [self.searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    self.searchDisController = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    self.searchDisController.searchResultsDelegate = self;
    self.searchDisController.searchResultsDataSource = self;
    self.searchDisController.delegate = self;
    [_searchBar setBackgroundImage:[UIImage new]];
    _searchBar.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 44);
    [header addSubview:self.searchBar];
//    self.tableView.tableHeaderView = self.searchBar;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual: self.searchDisController.searchResultsTableView]) {
        return self.disArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if ([tableView isEqual: self.searchDisController.searchResultsTableView]) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.disArray[indexPath.row]];
    }
    else{
    
    }
    return cell;
    
}

#pragma marks -AHGHomeHeaderViewDelegate
-(void)showShopButtonClicked:(UIButton*)bu{
    NSLog(@"点击了第%ld个商家按钮",(long)bu.tag);

}
-(void)TextButtonClicked:(UIButton*)bu{

    NSLog(@"点击了第%ld个文本标签按钮",(long)bu.tag);
}
-(void)BannerPicClicked:(NSInteger)BannerId{
    NSLog(@"点击的轮播图id---%ld",(long)BannerId);
    UIStoryboard *borad = [UIStoryboard storyboardWithName:@"ProDetail" bundle:[NSBundle mainBundle]];
    AHGProductDetailTableViewController * detail =[borad instantiateViewControllerWithIdentifier:@"AHGProductDetailTableViewController"] ;
    detail.prouctId = BannerId;
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
    
}
-(void)setFooterView{
    UIView * footer = [[UIView alloc]init];
    footer.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    self.tableView.tableFooterView = footer;
    //商家视图
    UIView * baseView = [[UIView alloc]init];
//    baseView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 200);
    [footer addSubview:baseView];
    baseView.backgroundColor = [UIColor whiteColor];
    CGFloat width = (self.tableView.frame.size.width - 16 )/ 3;

    for (int i = 0; i < _ReStoreArray.count; i++) {
        ReShopModel * model = _ReStoreArray[i];
        UIButton * bu = [[UIButton alloc]init];
        [baseView addSubview:bu];
        bu.tag = i;
        [bu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        bu.layer.borderWidth = 0.5;
        bu.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [bu setTitle:model.store_name forState:UIControlStateNormal];
//        NSString * url = [NSString stringWithFormat:@"%@%@",BASE_HEADER,model.store_logo];®
        [bu sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BASE_HEADER,model.store_logo]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"interesting_person"]];
        [bu addTarget:self action:@selector(showShopButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        //        [bu setBackgroundImage:[UIImage imageNamed:@"interesting_person"] forState:UIControlStateNormal];
        UILabel * la = [[UILabel alloc]init];
        la.text = model.store_name;
        [baseView addSubview:la];
        la.frame = CGRectMake(8 + i*width, 10+8+ width/2, width, 10);
        la.font = [UIFont systemFontOfSize:11];
        la.textColor = [UIColor lightGrayColor];
        la.textAlignment = NSTextAlignmentCenter;
        if (i < 3) {
            bu.frame = CGRectMake(8 + i*width, 10, width, width / 2);
            la.frame = CGRectMake(8 + i*width, 10+8+ width/2, width, 10);
        }
        else{
            CGFloat w = 10*2 + 8 + 10 + width/2;
            bu.frame = CGRectMake(8 + (i-3)*width, w, width, width/2);
            la.frame = CGRectMake(8 + (i-3)*width, w + 8 +width/2, width, 10);
            if (i == 4) {
            baseView.frame =CGRectMake(0, 0, self.tableView.frame.size.width, CGRectGetMaxY(la.frame) + 10);
            }
        }
    }
    //文本视图
    UIView * textView = [[UIView alloc]init];
    textView.backgroundColor = [UIColor whiteColor];
    textView.frame = CGRectMake(0, CGRectGetMaxY(baseView.frame) + 8, self.tableView.frame.size.width, 150);
    [footer addSubview:textView];
    UILabel * label = [[UILabel alloc]init];
    label.text = @"文本标签";
    label.textColor = [UIColor redColor];
    label.frame = CGRectMake(CGRectGetWidth(textView.frame)/2 - 50, 10, 100, 20);
    [textView addSubview:label];
//    UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame) + 8, textView.frame.size.width, 0.5)];
//    line.backgroundColor = [UIColor lightGrayColor];
//    [textView addSubview:line];
    
    CGFloat wid = textView.frame.size.width / 4;
    for (int i = 0; i < 8; i++) {
        UIButton * textBu = [[UIButton alloc]init];
        [textBu setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [textView addSubview: textBu];
        [textBu setTitle:@"文本标签" forState:UIControlStateNormal];
        textBu.titleLabel.font = [UIFont systemFontOfSize:14];
        textBu.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textBu.layer.borderWidth = 0.3;
        textBu.tag = i;
        [textBu addTarget:self action:@selector(TextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        if (i < 4) {
            textBu.frame = CGRectMake(i*wid, CGRectGetMaxY(label.frame) + 8, wid, wid /2);
        }
        else{
            textBu.frame = CGRectMake((i - 4)*wid, CGRectGetMaxY(label.frame) + 8 + wid /2, wid, wid /2);
            if (i == 7) {
                textView.frame = CGRectMake(0, CGRectGetMaxY(baseView.frame) + 8, self.tableView.frame.size.width, CGRectGetMaxY(textBu.frame));
            }
        }
        
    }
  // 两个广告的图片
    UIImageView * traImage = [[UIImageView alloc]init];
    traImage.image = [UIImage imageNamed:@"transport"];
    traImage.frame = CGRectMake(0, CGRectGetMaxY(textView.frame) + 8, VIEW_WIDTH,traImage.image.size.height);
    [footer addSubview:traImage];
    traImage.backgroundColor = [UIColor whiteColor];
    traImage.contentMode = UIViewContentModeScaleAspectFit;
    UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(traImage.frame), VIEW_WIDTH, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [footer addSubview:line];
    
    UIImageView * showImage = [[UIImageView alloc]init];
    showImage.image = [UIImage imageNamed:@"金融"];
    showImage.frame = CGRectMake(0, CGRectGetMaxY(traImage.frame) + 8, VIEW_WIDTH,showImage.image.size.height);
    [footer addSubview:showImage];
    showImage.contentMode = UIViewContentModeScaleAspectFit;
    showImage.backgroundColor = [UIColor whiteColor];
    //底部按钮
    
    CGFloat midWidth = self.tableView.frame.size.width / 2;
    CGFloat buttonY = CGRectGetMaxY(showImage.frame) + 10;
    
    UIButton * telButton = [[UIButton alloc]initWithFrame:CGRectMake(midWidth - 40, buttonY, 80,25)];
    [telButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [telButton setTitle:@"客服热线" forState:UIControlStateNormal];
    telButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [telButton addTarget:self action:@selector(telAction) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:telButton];
    
    UIButton * loginButton  = [[UIButton alloc]init];
    loginButton.frame = CGRectMake(CGRectGetMinX(telButton.frame) - 80, buttonY, 80, 25);
    [loginButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [loginButton setTitle:@"登录/注册" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [loginButton addTarget:self action:@selector(showMyInfo) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:loginButton];
    
    UIButton * topButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(telButton.frame), buttonY, 80, 25)];
    [topButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [topButton setTitle:@"回到顶部" forState:UIControlStateNormal];
    topButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [topButton addTarget:self action:@selector(srocllToTop) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:topButton];
    
    UILabel * desLabel = [[UILabel alloc]init];
    desLabel.text = @"COPYRIGHT 爱化工平台版权所有";
    desLabel.font = [UIFont systemFontOfSize:13];
    desLabel.frame = CGRectMake(midWidth - 120, CGRectGetMaxY(topButton.frame) + 8, 240, 15);
    desLabel.textAlignment = NSTextAlignmentCenter;
    [footer addSubview:desLabel];
    desLabel.textColor = [UIColor lightGrayColor];
    footer.frame = CGRectMake(0, 0, self.tableView.frame.size.width, CGRectGetMaxY(desLabel.frame) + 24);
    
    self.tableView.tableFooterView = footer;
}


#pragma mark -AHGHomeHeaderViewDelegate
-(void)clickedButtonWithTag:(NSInteger)buttonTag{
    switch (buttonTag) {
        case 0:
        {
            AHGTimeSalesViewController * time = [[AHGTimeSalesViewController alloc]init];
            time.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:time animated:YES];
            NSLog(@"抢购");
        }
            break;
        case 1:
            NSLog(@"商品");
            break;
        case 2:{
            NSLog(@"指数");
            AHGInfoViewController * info = [[AHGInfoViewController alloc]init];
            info.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:info animated:YES];
        }
            break;
        case 3:
            NSLog(@"客服");
            break;
        default:
            break;
    }

}
-(void)productButtonClicked{
    NSLog(@"我要供货按钮");

}

-(void)showMyInfo{
    NSLog(@"我的信息");
    //没登录的时候显示登陆页面
    //    UIStoryboard *borad = [UIStoryboard storyboardWithName:@"LoginSB" bundle:[NSBundle mainBundle]];
    //    UINavigationController *loginController =[borad instantiateViewControllerWithIdentifier:@"LoginSB"] ;
    //    [self.navigationController presentViewController:loginController animated:YES completion:nil] ;
    
    UIStoryboard *borad = [UIStoryboard storyboardWithName:@"MyInfoSB" bundle:[NSBundle mainBundle]];
    AHGMyInfoCenterViewController *myinfo =[borad instantiateViewControllerWithIdentifier:@"AHGMyInfoCenterViewController"] ;
    myinfo.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:myinfo animated:YES] ;
}
-(void)telAction{
    NSLog(@"打电话");
//    [Utile telActionWithPhoneNumber:@"13800138000"];
    AHGShopDetailViewController * de = [[AHGShopDetailViewController alloc]init];
    de.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:de animated:YES];
    

}

-(void)srocllToTop{
    [self.tableView setContentOffset:CGPointMake(0, -64) animated:YES];
}


@end
