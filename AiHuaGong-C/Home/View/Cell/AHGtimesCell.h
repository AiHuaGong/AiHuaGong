
#import <UIKit/UIKit.h>
@class AHGtimesCell;
@protocol AHGtimesCellDelegate <NSObject>

-(void)buyButtonClickedWithProductId:(NSInteger)productId;

@end


@interface AHGtimesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeDesLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *bugButton;
@property (weak, nonatomic) IBOutlet UILabel *leaveLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelWidthConstraint;

@property (weak,nonatomic) id<AHGtimesCellDelegate>delegate;
@end
