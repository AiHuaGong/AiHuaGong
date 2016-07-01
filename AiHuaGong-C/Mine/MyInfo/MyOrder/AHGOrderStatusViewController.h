
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,OrderStatusType) {
    AHGOrderStatusWaittingPay,
    AHGOrderStatusWaittingReceive,
    AHGOrderStatusRefunds
    
};

@interface AHGOrderStatusViewController : UITableViewController
-(id)initWithOrderStatus:(OrderStatusType)type;
@property(nonatomic)OrderStatusType  type;
@end
