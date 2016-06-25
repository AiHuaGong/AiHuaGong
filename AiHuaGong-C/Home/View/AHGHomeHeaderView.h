
#import <UIKit/UIKit.h>
#import "JXBAdPageView.h"
@class AHGHomeHeaderView;
@protocol AHGHomeHeaderViewDelegate <NSObject>
/**
 *  点击上面类型按钮的操作
 *
 *  @param buttonTag tag
 */
-(void)clickedButtonWithTag:(NSInteger)buttonTag;
-(void)productButtonClicked;
-(void)BannerPicClicked:(NSInteger)BannerId;
@end
@interface AHGHomeHeaderView : UIView<JXBAdPageViewDelegate>
@property(nonatomic, strong)NSArray * banArr;
@property(weak, nonatomic) id<AHGHomeHeaderViewDelegate>delegate;
@property(nonatomic, strong)JXBAdPageView * JXView;
-(id)initWithFrame:(CGRect)frame Array:(NSMutableArray*)arr;
@end
