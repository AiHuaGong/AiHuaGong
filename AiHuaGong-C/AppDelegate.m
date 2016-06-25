
#import "AppDelegate.h"
#import "AHGHomeViewController.h"
#import "AHGProductListViewController.h"
#import "AHGShopingCarViewController.h"
#import "AHGTabBarViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>{

}
@property(nonatomic,strong)UIButton * bu;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setTabarAction];
    
    
    return YES;
    
}

-(void)setTabarAction{
    AHGHomeViewController * home = [[AHGHomeViewController alloc]init];
    [home.tabBarItem setImage:[UIImage imageNamed:@"tab_burning_nor"]];
    [home.tabBarItem setSelectedImage:[UIImage imageNamed:@"tab_burning_press"]];
    [home.tabBarItem setTitle:@"爱化工平台"];
    AHGProductListViewController * product = [[AHGProductListViewController alloc]init];
    [product.tabBarItem setImage:[UIImage imageNamed:@"tab_mine_nor"]];
    [product.tabBarItem setSelectedImage:[UIImage imageNamed:@"tab_mine_press"]];
    [product.tabBarItem setTitle:@"商品列表"];
    AHGShopingCarViewController * shop = [[AHGShopingCarViewController alloc]init];
//    [shop.tabBarItem setImage:[UIImage imageNamed:@"tab_mine_nor"]];
//    [shop.tabBarItem setSelectedImage:[UIImage imageNamed:@"tab_mine_press"]];
    [shop.tabBarItem setTitle:@""];
    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:home];
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:shop];
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:product];
    
    AHGTabBarViewController * tab = [[AHGTabBarViewController alloc]init];
    [tab setViewControllers:@[nav1,nav2,nav3]animated:YES];
//    CGFloat offset = 15.0;
//    for (UITabBarItem *item in tab.tabBar.items) {
//        item.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
//    }
    self.window.rootViewController = tab;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
