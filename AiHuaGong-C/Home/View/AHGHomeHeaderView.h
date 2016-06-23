
#import <UIKit/UIKit.h>

@class AHGHomeHeaderView;
@protocol AHGHomeHeaderViewDelegate <NSObject>
/**
 *  点击上面类型按钮的操作
 *
 *  @param buttonTag tag
 */
-(void)clickedButtonWithTag:(NSInteger)buttonTag;
-(void)productButtonClicked;

@end
@interface AHGHomeHeaderView : UIView

@property(weak, nonatomic) id<AHGHomeHeaderViewDelegate>delegate;

@end
