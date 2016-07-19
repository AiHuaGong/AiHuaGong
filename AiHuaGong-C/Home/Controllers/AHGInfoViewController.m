
#import "AHGInfoViewController.h"
#import "AHGInfoCell.h"
@interface AHGInfoViewController ()

@end

@implementation AHGInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"指数";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *infoIdentifier = @"AHGInfoCell";
    
    AHGInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:infoIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AHGInfoCell" owner:self options:nil] firstObject];
        
    }
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 40;
    }
    return 0;

}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 40)];
        UILabel * la = [[UILabel alloc]init];
        la.frame = CGRectMake(view.frame.size.width / 2 - 50, 0, 100, 40);
        la.text = @"5月30日";
        la.textAlignment = NSTextAlignmentCenter;
        la.textColor = [UIColor redColor];
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [view addSubview:la];
        
        return view;
    }
    return nil;
}

@end
