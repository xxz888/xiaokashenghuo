
#import "MHMXbIeg_Ty3Controller.h"
#import "QOkhoiZbw_OLwController.h"
@interface MHMXbIeg_Ty3Controller ()

@end

@implementation MHMXbIeg_Ty3Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"客服中心";
    
    [self.zaixian_view bk_whenTapped:^{
        [self 在线客服];
    }];
    
    [self.qq_view bk_whenTapped:^{
        [self bowerUnderstandStraightenBetroth];
    }];
    
}

- (void)在线客服{
    [self.xp_rootNavigationController pushViewController:[QOkhoiZbw_OLwController new] animated:YES];
}
- (void)bowerUnderstandStraightenBetroth{
    
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]){
        
        
        NSString *QQ = @"493883049";
        
        NSString *url = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",QQ];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
        
    }else{
        [ZIONf_d showBottomWithText:@"请先安装QQ聊天软件"];
    }
}



@end
