

#import <UIKit/UIKit.h>
@class AHGOrderStatusCell;
@protocol AHGOrderStatusCellDelegate <NSObject>

-(void)firstbuttonClicked:(NSString*)productId;
-(void)secondbuttonClicked:(NSString*)productId;


@end
@interface AHGOrderStatusCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UIImageView *productPic;
@property (weak, nonatomic) IBOutlet UILabel *productDes;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *namePhoto;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *totalCount;
@property (weak, nonatomic) IBOutlet UILabel *totalMoney;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *lastButton;
@property(nonatomic, weak) id<AHGOrderStatusCellDelegate>delegate;

@end
