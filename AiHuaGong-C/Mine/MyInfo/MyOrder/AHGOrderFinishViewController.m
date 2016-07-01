
#import "AHGOrderFinishViewController.h"
#import "AHGOrderFinishCell.h"

@interface AHGOrderFinishViewController ()<AHGOrderFinishCellDelegate>

@end

@implementation AHGOrderFinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - AHGOrderFinishCellDelegate

-(void)bugAgainbuttonClicked:(NSString *)productId{
    NSLog(@"再次购买");
}
-(void)replybuttonClicked:(NSString *)productId{
    NSLog(@"申请售后");
    
}
#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 188;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *infoIdentifier = @"AHGOrderFinishCell";
    
    AHGOrderFinishCell * cell = [tableView dequeueReusableCellWithIdentifier:infoIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AHGOrderFinishCell" owner:self options:nil] firstObject];
        cell.delegate = self;
        
    }
    
    return cell;
}


@end
