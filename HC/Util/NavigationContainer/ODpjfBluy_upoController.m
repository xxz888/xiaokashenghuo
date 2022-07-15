
#import "ODpjfBluy_upoController.h"

@interface ODpjfBluy_upoController ()

@end

@implementation ODpjfBluy_upoController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tabClassArray = @[@"UBxhwf_PController",
                               @"XVGDvhh_kiController",
                               @"SGfGjysn_zV9Controller",
                               @"JLxcjiLdqwi_AController"];
    
    NSArray *tabItemUnSeletedImageArray = @[@"symbolUnsatisfactory",@"buttressPreliterateRejoicing",@"sauceDeath",@"randomResponsive"];
    
    NSArray *tabItemSeletedImageArray = @[@"alienFeasible",@"digestionBriberyHome",@"losePartBigotry",@"iodineUnpaid"];
    
    
    NSArray *tabItemNamesArray = @[@"首页", @"卡包", @"收益", @"我的"];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (int index = 0; index < tabClassArray.count; index++) {
        UIViewController *contentController = [[NSClassFromString(tabClassArray[index]) alloc] initWithNibName:nil bundle:nil];
        UITabBarItem *tabbaritem = [[UITabBarItem alloc] init];
        tabbaritem.title = tabItemNamesArray[index];
        tabbaritem.image = [[UIImage imageNamed:tabItemUnSeletedImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabbaritem.selectedImage = [[UIImage imageNamed:tabItemSeletedImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
         [tabbaritem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#666666"]} forState:UIControlStateNormal];
        
        [tabbaritem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
        
        
        tabbaritem.imageInsets = UIEdgeInsetsMake(1, 0, -1, 0);
        
        [tabbaritem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
        
        
        XPRootNavigationController *navigationController = [[XPRootNavigationController alloc] initWithRootViewController:contentController];
        navigationController.navigationController.navigationBar.translucent = YES;
        navigationController.tabBarItem = tabbaritem;
        [viewControllers addObject:navigationController];
    }
    
    self.viewControllers = viewControllers;
    
    
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];

    if (@available(iOS 13.0, *)) {
            self.tabBarController.tabBar.unselectedItemTintColor = [UIColor colorWithHexString:@"#666666"];
            self.tabBarController.tabBar.tintColor = [UIColor blackColor];
    } else {
            [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateSelected];
            [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#666666"]} forState:UIControlStateNormal];
    }
    
}



@end
