//
//  AHGTabBarViewController.m
//  AiHuaGong-C
//
//  Created by ap on 16/6/22.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import "AHGTabBarViewController.h"
#import "LZCartViewController.h"
@interface AHGTabBarViewController ()
@property(nonatomic,strong)UIButton * bu;
@end

@implementation AHGTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
    
}
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
//{
//    
//        if ([self.viewControllers indexOfObject:viewController]==1) {
//            
//            
//            return NO;
//        }
//    
//    return YES;
//}

-(void)setup
{
    //  添加突出按钮
    [self addCenterButtonWithImage:[UIImage imageNamed:@"interesting_card"] selectedImage:[UIImage imageNamed:@"interesting_person"]];
    //  UITabBarControllerDelegate 指定为自己
    self.delegate=self;
    //  指定当前页——中间页
//    self.selectedIndex=0;
    //  设点button状态
    self.bu.selected=NO;
    //  设定其他item点击选中颜色
    self.tabBar.tintColor= [UIColor colorWithRed:222/255.0 green:78/255.0 blue:22/255.0 alpha:1];
}


#pragma mark - addCenterButton
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage
{
    self.bu = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bu addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    self.bu.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    //  设定button大小为适应图片
    
     self.bu.frame = CGRectMake(self.tabBar.frame.size.width / 2 - 30 , -11, 60, 60);
    self.bu.clipsToBounds = YES;
    self.bu.layer.cornerRadius = 30;
    self.view.clipsToBounds = NO;
//    [self.bu setBackgroundColor:[UIColor redColor]];
    [self.bu setImage:buttonImage forState:UIControlStateNormal];
    [self.bu setImage:selectedImage forState:UIControlStateSelected];
    //  这个比较恶心  去掉选中button时候的阴影
    self.bu.adjustsImageWhenHighlighted=NO;
    UIImageView * image = [[UIImageView alloc]init];
    image.image = buttonImage;
    image.frame = CGRectMake(self.tabBar.frame.size.width / 2 - 30 , -11, 60, 60);
//    [self.tabBar addSubview:image];
    [self.tabBar addSubview:self.bu];
//    [self.tabBar bringSubviewToFront:self.bu];
    for (UIView * vi in self.tabBar.subviews) {
        if ([vi isKindOfClass:NSClassFromString(@"UIButton")]) {
            [self.tabBar bringSubviewToFront:vi];
        }
    }

}

-(void)pressChange:(id)sender
{
//    self.selectedIndex=1;
    self.bu.selected=YES;
    LZCartViewController * la = [[LZCartViewController alloc]init];
    [self presentViewController:la animated:YES completion:nil];
    
}

#pragma mark- TabBar Delegate

//  换页和button的状态关联上

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    if (self.selectedIndex==1) {
        self.bu.selected=YES;
        LZCartViewController * la = [[LZCartViewController alloc]init];
        [self presentViewController:la animated:YES completion:nil];
    }else
    {
        self.bu.selected=NO;
    }
}

@end
