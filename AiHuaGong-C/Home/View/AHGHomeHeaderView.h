
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
-(void)BannerPicClicked:(NSInteger)BannerId;
@optional
-(void)productButtonClicked;
@end

@interface AHGHomeHeaderView : UIView<JXBAdPageViewDelegate>
@property(nonatomic, strong)NSArray * banArr;
@property(weak, nonatomic) id<AHGHomeHeaderViewDelegate>delegate;
@property(nonatomic, strong)JXBAdPageView * JXView;
-(id)initWithFrame:(CGRect)frame Array:(NSMutableArray*)arr showBelow:(BOOL)bol;
@end
