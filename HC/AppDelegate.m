
#import "AppDelegate.h"

#import <AVFoundation/AVFoundation.h>
@interface AppDelegate ()<UITabBarControllerDelegate,JPUSHRegisterDelegate,AVSpeechSynthesizerDelegate>{
    AVSpeechSynthesizer *_avSpeaker;
}

@property (strong, nonatomic) UITabBarController *tabBarController;

@end

@implementation AppDelegate



- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  
  NSLog(@"通知错误信息: %@", error);
}




- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  
  [JPUSHService registerDeviceToken:deviceToken];
}
#pragma ---------  9.0以后使用新API接口  ------------

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        
    }else{
        
    }
}






- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler{
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        
        [self abstemiousEdgeCounteract:userInfo];
    }
    
    
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert);

}

- (void)abstemiousEdgeCounteract:(NSDictionary *)userInfo{
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:@"UserData"];
    if (![userInfo[@"userId"] isEqualToString:@"0"] && [UserData[@"msgSound"] intValue] == 1) {
        
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:userInfo[@"sound"]];
        
        utterance.rate = 0.5;
        
        utterance.pitchMultiplier = 1;
        
        utterance.volume = 1;
        
        utterance.preUtteranceDelay = 0.1;
        
        utterance.postUtteranceDelay = 0.1;
        
        AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        
        utterance.voice = voice;
        
        [_avSpeaker speakUtterance:utterance];
    }
}



- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options{
    if ([url.host isEqualToString:@"safepay"]) {
        
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            if ([resultDic[@"resultStatus"] intValue] == 9000) {
                
                NSNotification *LoseResponse = [NSNotification notificationWithName:@"RefreshAlipay" object:nil];
                [[NSNotificationCenter defaultCenter] postNotification:LoseResponse];
                [ZIONf_d showBottomWithText:@"付款成功"];
            }else{
                [ZIONf_d showBottomWithText:resultDic[@"memo"]];
            }
            
        }];
        
        
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    return YES;
}

#pragma 前台收到远程通知

- (UIViewController *)rootViewController{
    
    
    NSArray *tabClassArray = @[@"WKEXrwLzxn_ImController",@"USvtNu_iController",@"MCUaer_D8Controller",@"SPEVbfu_2yController"];
    
    NSArray *tabItemUnSeletedImageArray = @[@"evenWhenClatter",@"slackenRivetingSod",@"adaptAshoreWrong",@"hassleApex"];
    
    NSArray *tabItemSeletedImageArray = @[@"grieveGong",@"labVestigial",@"leatherMusic",@"importanceImpetus"];
    
    
    NSArray *tabItemNamesArray = @[@"首页",@"分类",@"购物车",@"我的"];
    
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
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = viewControllers;
    
    
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];

    if (@available(iOS 13.0, *)) {
            self.tabBarController.tabBar.unselectedItemTintColor = [UIColor colorWithHexString:@"#666666"];
            self.tabBarController.tabBar.tintColor = [UIColor blackColor];
    } else {
            [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateSelected];
            [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#666666"]} forState:UIControlStateNormal];
    }
    

    return self.tabBarController;
}


#pragma 点击通知都执行,不管前台后台还是杀死的状态

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    
    
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    }
    else{
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    [JPUSHService setupWithOption:@{} appKey:@"2e802fca44f1ae53c7019d6e" channel:@"App Store" apsForProduction:YES];
    [JPUSHService setLogOFF];
    
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:@"UserData"];
    if ([UserData allKeys].count > 0 && ![UserData[@"username"] isEqualToString:@"13383773801"]) {
        IOZJk_9Controller *tabber = [IOZJk_9Controller new];
        self.window.rootViewController = tabber;
    }else{
        
        self.window.rootViewController = [self rootViewController];
    }
    
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;

    [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleLightContent;
    
    _avSpeaker = [[AVSpeechSynthesizer alloc] init];
    _avSpeaker.delegate = self;
    
    return YES;
}


- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive || [UIApplication sharedApplication].applicationState ==  UIApplicationStateActive) {
            NSMutableDictionary *data = [NSMutableDictionary dictionary];
            [data setObject:userInfo[@"msg"] forKey:@"msg"];
            [data setObject:userInfo[@"title"] forKey:@"title"];
            [data setObject:userInfo[@"userId"] forKey:@"userId"];
            [data setObject:userInfo[@"createTime"] forKey:@"createTime"];
            
            XPRootNavigationController *rootNavigationController = (XPRootNavigationController *)[UIViewController currentViewController].navigationController;
            UIViewController * Controller = [rootNavigationController.viewControllers lastObject];

            XPCupuzDxlbf_JController *VC = [XPCupuzDxlbf_JController new];
            VC.dataDic = data;
            [Controller.xp_rootNavigationController pushViewController:VC animated:YES];
        }
    }
    
    completionHandler();
}

@end
