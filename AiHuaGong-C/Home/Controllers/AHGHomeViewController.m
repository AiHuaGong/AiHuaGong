
#import "AHGHomeViewController.h"
#import "AHGHomeHeaderView.h"
@interface AHGHomeViewController ()<AHGHomeHeaderViewDelegate>{

}

@end

@implementation AHGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"爱化工平台";
    CGRect ViewSize = [[UIScreen mainScreen]bounds];
    AHGHomeHeaderView * header = [[AHGHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, ViewSize.size.width, 280)];
    self.tableView.tableHeaderView = header;
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tab_burning_press"] style:UIBarButtonItemStylePlain target:self action:@selector(showMyInfo)];
    self.navigationItem.leftBarButtonItem = left;
     UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tab_cool_press"] style:UIBarButtonItemStylePlain target:self action:@selector(telAction)];
    self.navigationItem.rightBarButtonItem = right;
    
    
    
    UIView * footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 800)];
    footer.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableFooterView = footer;
 }
#pragma mark -AHGHomeHeaderViewDelegate
-(void)clickedButtonWithTag:(NSInteger)buttonTag{
    switch (buttonTag) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }

}

-(void)showMyInfo{
    NSLog(@"我的信息");

}
-(void)telAction{
    NSLog(@"打电话");

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/



@end
