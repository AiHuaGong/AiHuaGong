//
//  AHGTabBarViewController.m
//  AiHuaGong-C
//
//  Created by ap on 16/6/22.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import "AHGTabBarViewController.h"
#import "LZCartViewController.h"
#import "AHGHomeViewController.h"
#import "AHGProductListViewController.h"
#import "AHGShopingCarViewController.h"
@interface AHGTabBarViewController (){
    UIButton* button;

}
@property(nonatomic,strong)UIButton * bu;
@end

@implementation AHGTabBarViewController

static AHGTabBarViewController * ahgTabbar;
+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ahgTabbar = [[self alloc] init];
    });
    return ahgTabbar;
}
-(void)changeFromType:(NSString *)type{
    self.fromType = type;
}
-(void)changeSelectedState:(NSString *)type{
    if ([type isEqualToString:@"0"]) {
        self.selectedIndex=0;
    }
    else{
        self.selectedIndex=2;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    AHGHomeViewController * home = [[AHGHomeViewController alloc]init];
    [home.tabBarItem setImage:[UIImage imageNamed:@"tab_burning_nor"]];
    [home.tabBarItem setSelectedImage:[UIImage imageNamed:@"tab_burning_press"]];
    [home.tabBarItem setTitle:@"爱化工平台"];
    home.title = @"爱化工平台";
    AHGShopingCarViewController * shop = [[AHGShopingCarViewController alloc]init];
//    [self addCenterButtonWithImage:[UIImage imageNamed:@"shoppingCar"] highlightImage:[UIImage imageNamed:@"shoppingCar"]];
    
    AHGProductListViewController * product = [[AHGProductListViewController alloc]init];
    [product.tabBarItem setImage:[UIImage imageNamed:@"list"]];
    [product.tabBarItem setSelectedImage:[UIImage imageNamed:@"list_select"]];
    [product.tabBarItem setTitle:@"商品列表"];
    product.title = @"商品列表";
//    [shop.tabBarItem setTitle:@""];
    
    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:home];
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:shop];
    [nav2.view bringSubviewToFront:button];
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:product];
    [self setViewControllers:@[nav1,nav2,nav3]animated:YES];
    
    
}

-(void)setup
{
    //  添加突出按钮
    [self addCenterButtonWithImage];
    //  UITabBarControllerDelegate 指定为自己
    self.delegate=self;
    //  指定当前页——中间页
//    self.selectedIndex=0;
    //  设点button状态
//    self.bu.selected=NO;
    //  设定其他item点击选中颜色
    self.tabBar.tintColor= [UIColor colorWithRed:222/255.0 green:78/255.0 blue:22/255.0 alpha:1];
}


#pragma mark - addCenterButton
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage
{
    self.bu = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bu addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    self.bu.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    //  设定button大小为适应图片
    
     self.bu.frame = CGRectMake(self.tabBar.frame.size.width / 2 - 30 , -11, 60, 60);
//    self.bu.frame = CGRectMake(self.tabBar.frame.size.width / 2 - 30 , self.view.frame.size.height - 60, 60, 60);
    self.bu.clipsToBounds = YES;
    self.bu.layer.cornerRadius = 30;
    self.view.clipsToBounds = NO;
//    [self.bu setBackgroundColor:[UIColor redColor]];
    [self.bu setImage:[UIImage imageNamed:@"shoppingCar"] forState:UIControlStateNormal];
//    [self.bu setImage:selectedImage forState:UIControlStateSelected];
    //  这个比较恶心  去掉选中button时候的阴影
    self.bu.adjustsImageWhenHighlighted=NO;
    [self.tabBar insertSubview:self.bu atIndex:1];
    self.tabBarController.tabBar.opaque = YES;
    [self.view bringSubviewToFront:self.bu];

}

//添加中间按钮
- (void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}

-(void)hideButtonAction:(BOOL)bol{
//    self.bu.hidden = bol;
    [self.bu removeFromSuperview];
    self.bu = nil;
//    [self.view bringSubviewToFront:self.bu];

}

-(void)pressChange:(id)sender
{
//    self.selectedIndex=1;
//    self.bu.selected=YES;
    LZCartViewController * la = [[LZCartViewController alloc]init];
    la.fromType = self.fromType;
    [self presentViewController:la animated:YES completion:nil];
    
}

#pragma mark- TabBar Delegate

//  换页和button的状态关联上

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    if (self.selectedIndex==1) {
        self.bu.selected=YES;
        LZCartViewController * la = [[LZCartViewController alloc]init];
        la.fromType = self.fromType;
        [self presentViewController:la animated:YES completion:nil];
    }else
    {
        self.bu.selected=NO;
    }
}

@end
