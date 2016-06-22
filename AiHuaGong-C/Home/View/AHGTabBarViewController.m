//
//  AHGTabBarViewController.m
//  AiHuaGong-C
//
//  Created by ap on 16/6/22.
//  Copyright © 2016年 AHG. All rights reserved.
//

#import "AHGTabBarViewController.h"

@interface AHGTabBarViewController ()
@property(nonatomic,strong)UIButton * bu;
@end

@implementation AHGTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}

-(void)setup
{
    //  添加突出按钮
    [self addCenterButtonWithImage:[UIImage imageNamed:@"A-iocn"] selectedImage:[UIImage imageNamed:@"tab_cool_nor"]];
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
//    self.bu.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
     self.bu.frame = CGRectMake(self.tabBar.frame.size.width / 2 - 30 , CGRectGetHeight(self.view.frame) - 60, 60, 60);
    self.bu.clipsToBounds = YES;
    self.bu.layer.cornerRadius = 30;
    self.view.clipsToBounds = NO;
    [self.bu setBackgroundColor:[UIColor redColor]];
    [self.bu setImage:buttonImage forState:UIControlStateNormal];
    [self.bu setImage:selectedImage forState:UIControlStateSelected];
    //  这个比较恶心  去掉选中button时候的阴影
    self.bu.adjustsImageWhenHighlighted=NO;
    
    
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
//    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
//    if (heightDifference < 0)
//        self.bu.center = self.tabBar.center;
//    else
//    {
//        CGPoint center = self.tabBar.center;
//        center.y = center.y - heightDifference/2.0;
//        self.bu.center = center;
//    }
//    self.bu.center = self.tabBar.center;
    [self.view addSubview:self.bu];
}

-(void)pressChange:(id)sender
{
    self.selectedIndex=1;
    self.bu.selected=YES;
}

#pragma mark- TabBar Delegate

//  换页和button的状态关联上

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==1) {
        self.bu.selected=YES;
    }else
    {
        self.bu.selected=NO;
    }
}

@end
