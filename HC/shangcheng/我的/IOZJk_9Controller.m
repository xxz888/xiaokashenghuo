
#import "IOZJk_9Controller.h"

@interface IOZJk_9Controller ()<UITabBarControllerDelegate>

@end

@implementation IOZJk_9Controller


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0){
    
    XPRootNavigationController *navCtrl = (XPRootNavigationController *)viewController;
    UIViewController *rootCtrl = navCtrl.viewControllers.firstObject;
    
    if ([rootCtrl isKindOfClass:[XVGDvhh_kiController class]]) {
        
        NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *UserData = [standardDefaults objectForKey:@"UserData"];
        if (UserData != nil && [UserData[@"selfLevel"] intValue] == 0) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您没有实名认证" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"暂不实名" style:UIAlertActionStyleCancel handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"去实名" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                UINavigationController *nav = tabBarController.viewControllers[tabBarController.selectedIndex];
                TSQTyHmvd_cKController *vc = [TSQTyHmvd_cKController new];
                [nav pushViewController:vc animated:YES];
                
            }]];
            [rootCtrl presentViewController:alert animated:YES completion:nil];
            return NO;
        }else{
            return YES;
        }
    }else{
        return YES;
    }
    
}
#pragma --------- tabber 切换拦截 及 实名认证跳转 ------------

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self rootViewController];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


- (void)rootViewController{
    
    
 
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
        [self addChildViewController:navigationController];
    }
    
    
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];

    if (@available(iOS 13.0, *)) {
        self.tabBar.unselectedItemTintColor = [UIColor colorWithHexString:@"#666666"];
        self.tabBar.tintColor = [UIColor blackColor];
    } else {
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateSelected];
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#666666"]} forState:UIControlStateNormal];
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    id traget = self.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:traget action:nil];
    [self.view addGestureRecognizer:pan];
}

@end
