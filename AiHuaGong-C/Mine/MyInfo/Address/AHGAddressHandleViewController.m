
#import "AHGAddressHandleViewController.h"
#import "AHGHandleCell.h"
@interface AHGAddressHandleViewController ()<AHGHandleCellDelegate>

@end

@implementation AHGAddressHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"地址管理";
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

-(void)changeSelectState:(UIButton *)bu{
    bu.selected = !bu.selected;

}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 133;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *infoIdentifier = @"AHGHandleCell";
    
    AHGHandleCell * cell = [tableView dequeueReusableCellWithIdentifier:infoIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AHGHandleCell" owner:self options:nil] firstObject];
        cell.delegate = self;
        
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
