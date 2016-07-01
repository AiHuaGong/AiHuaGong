//
//  AHGTabBarViewController.h
//  AiHuaGong-C
//
//  Created by ap on 16/6/22.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AHGTabBarViewController : UITabBarController<UITabBarControllerDelegate>{

}
@property(nonatomic, strong)NSString * fromType; // 0:首页  1:商品列表  2:其他
+ (instancetype) sharedInstance;
-(void)changeSelectedState:(NSString*)type;
-(void)changeFromType:(NSString*)type;

-(void)addCenterButtonWithImage;
-(void)hideButtonAction:(BOOL)bol;
- (void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage;
@end
