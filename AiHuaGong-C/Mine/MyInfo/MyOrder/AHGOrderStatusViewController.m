
#import "AHGOrderStatusViewController.h"
#import "AHGOrderStatusCell.h"

@interface AHGOrderStatusViewController ()<AHGOrderStatusCellDelegate>

@end

@implementation AHGOrderStatusViewController
-(id)initWithOrderStatus:(OrderStatusType)type{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
//    switch (self.type) {
//        case AHGOrderStatusWaittingPay :
//            self.tableView.backgroundColor = [UIColor yellowColor];
//            break;
//        case AHGOrderStatusWaittingReceive :
//            self.tableView.backgroundColor = [UIColor blueColor];
//            break;
//        case AHGOrderStatusRefunds :
//            self.tableView.backgroundColor = [UIColor greenColor];
//            break;
//        default:
//            break;
//    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
#pragma mark - AHGOrderStatusCellDelegate
-(void)firstbuttonClicked:(NSString *)productId{
    NSLog(@"点击了第一个按钮");
}
-(void)secondbuttonClicked:(NSString *)productId{
    NSLog(@"点击了第二个按钮");
}
#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 240+2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *infoIdentifier = @"AHGOrderStatusCell";
    
    AHGOrderStatusCell * cell = [tableView dequeueReusableCellWithIdentifier:infoIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AHGOrderStatusCell" owner:self options:nil] firstObject];
        cell.delegate = self;
        
    }
    [self showButtonTitle:cell];
    
    return cell;
}

-(void)showButtonTitle:(AHGOrderStatusCell*)cell{
    switch (self.type) {
        case AHGOrderStatusWaittingPay :{
//            self.tableView.backgroundColor = [UIColor yellowColor];
        }
            break;
        case AHGOrderStatusWaittingReceive :{
            [cell.firstButton setTitle:@"取消订单" forState:UIControlStateNormal];
            [cell.lastButton setTitle:@"确认收货" forState:UIControlStateNormal];
        }
            break;
        case AHGOrderStatusRefunds :{
            [cell.firstButton setTitle:@"申请售后" forState:UIControlStateNormal];
            [cell.lastButton setTitle:@"取消中" forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }


}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
