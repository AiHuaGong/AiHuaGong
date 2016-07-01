

#import <UIKit/UIKit.h>
@class AHGOrderFinishCell;
@protocol AHGOrderFinishCellDelegate <NSObject>

-(void)bugAgainbuttonClicked:(NSString*)productId;
-(void)replybuttonClicked:(NSString*)productId;


@end
@interface AHGOrderFinishCell : UITableViewCell
@property(nonatomic, weak) id<AHGOrderFinishCellDelegate>delegate;
@end
