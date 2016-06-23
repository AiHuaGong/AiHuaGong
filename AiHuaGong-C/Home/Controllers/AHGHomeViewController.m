
#import "AHGHomeViewController.h"
#import "AHGHomeHeaderView.h"
#import "Utile.h"
#import "AHGHomeApi.h"
@interface AHGHomeViewController ()<AHGHomeHeaderViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>{
    AHGHomeHeaderView * header;
}
@property(nonatomic, strong)UISearchDisplayController * searchDisController;
@property(nonatomic, strong)UISearchBar *searchBar;
@property(nonatomic, strong)NSMutableArray * disArray;
//@property(nonatomic, strong)NSMutableArray * disArray;
//@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation AHGHomeViewController
-(void)getbanners{
    BannerApi * api = [[BannerApi alloc]init];
    
    [api excuteWhithSuccess:^(NSURLSessionDataTask *response, id responseDate) {
        NSLog(@"得到结果%@",responseDate);
    } failure:^(NSURLSessionDataTask *response, NSError *error) {
         NSLog(@"得到结果%@",error);
    }];
}
-(void)getShoper{
    ReShopApi * shop = [[ReShopApi alloc]init];
    [shop excuteWhithSuccess:^(NSURLSessionDataTask *response, id responseDate) {
         NSLog(@"得到结果%@",responseDate);
    } failure:^(NSURLSessionDataTask *response, NSError *error) {
         NSLog(@"得到结果%@",error);
    }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getShoper];
//    [self getbanners];
    self.title = @"爱化工平台";
    CGRect ViewSize = [[UIScreen mainScreen]bounds];
    header = [[AHGHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, ViewSize.size.width, 300)];
    header.delegate = self;
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tab_burning_press"] style:UIBarButtonItemStylePlain target:self action:@selector(showMyInfo)];
    self.navigationItem.leftBarButtonItem = left;
     UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tab_cool_press"] style:UIBarButtonItemStylePlain target:self action:@selector(telAction)];
    self.navigationItem.rightBarButtonItem = right;
    self.tableView.scrollsToTop = YES;
    [self setFooterView];
    self.disArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    [self searchAction];
    self.tableView.tableHeaderView = header;
    
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
//#pragma mark UISearchBar and UISearchDisplayController Delegate Methods
//-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
//    //準備搜尋前，把上面調整的TableView調整回全屏幕的狀態，如果要產生動畫效果，要另外執行animation代碼
//    return YES;
//}
//////点击取消按钮
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
////   [self.searchBar resignFirstResponder];
//    
//}
//-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
//    //搜尋結束後，恢復原狀，如果要產生動畫效果，要另外執行animation代碼
//    return YES;
//}
//
//- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
//    // Return YES to cause the search result table view to be reloaded.
//    return YES;
//}
//
//- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
//    // Return YES to cause the search result table view to be reloaded.
//    return YES;
//}
//- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller{
//
//}
//- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller{
//
//    [self.searchDisController.searchResultsTableView setDelegate:self];
//    
//    
//}
//
//- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
//    
//    [self.searchBar resignFirstResponder];
//}

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


-(void)showShopButtonClicked:(UIButton*)bu{
    NSLog(@"点击了第%ld个商家按钮",(long)bu.tag);

}
-(void)TextButtonClicked:(UIButton*)bu{

    NSLog(@"点击了第%ld个文本标签按钮",(long)bu.tag);
}

-(void)setFooterView{
    UIView * footer = [[UIView alloc]init];
    footer.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    self.tableView.tableFooterView = footer;
    //商家视图
    UIView * baseView = [[UIView alloc]init];
    baseView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 200);
    [footer addSubview:baseView];
    baseView.backgroundColor = [UIColor whiteColor];
    CGFloat width = (self.tableView.frame.size.width - 16 )/ 3;
    for (int i = 0; i < 6; i++) {
        UIButton * bu = [[UIButton alloc]init];
        [baseView addSubview:bu];
        bu.tag = i;
        [bu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        bu.layer.borderWidth = 0.5;
        bu.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [bu setTitle:@"22" forState:UIControlStateNormal];
        [bu addTarget:self action:@selector(showShopButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        //        [bu setBackgroundImage:[UIImage imageNamed:@"interesting_person"] forState:UIControlStateNormal];
        UILabel * la = [[UILabel alloc]init];
        la.text = @"广州爱化工";
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
            if (i == 5) {
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
    traImage.image = [UIImage imageNamed:@"interesting_person"];
    traImage.frame = CGRectMake(0, CGRectGetMaxY(textView.frame) + 8, self.tableView.frame.size.width, 140);
    [footer addSubview:traImage];
    
    UIImageView * showImage = [[UIImageView alloc]init];
    showImage.frame = CGRectMake(0, CGRectGetMaxY(traImage.frame) + 8, self.tableView.frame.size.width, 120);
    [footer addSubview:showImage];
    showImage.image = [UIImage imageNamed:@"interesting_card"];
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
            NSLog(@"抢购");
            break;
        case 1:
            NSLog(@"商品");
            break;
        case 2:
            NSLog(@"指数");
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
}
-(void)telAction{
    NSLog(@"打电话");
    [Utile telActionWithPhoneNumber:@"13800138000"];

}

-(void)srocllToTop{
    [self.tableView setContentOffset:CGPointMake(0, -64) animated:YES];
}


@end
