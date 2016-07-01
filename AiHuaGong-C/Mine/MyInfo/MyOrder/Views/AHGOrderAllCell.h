
#import <UIKit/UIKit.h>
@class AHGOrderAllCell;
@protocol AHGOrderAllCellDelegate <NSObject>

-(void)buyActionWithProductId:(NSString*)productId;
-(void)cancleActionWithProductId:(NSString*)productId;
-(void)showMoreProductButtonClicked;

@end

@interface AHGOrderAllCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *productDes;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property(nonatomic, weak) id<AHGOrderAllCellDelegate>delegate;
@end
