
#import "QIIoxag_l4.h"
#import "GRcyRifxy_UZ.h"
#import "MBProgressHUD.h"
#import "LXZtjte_qController.h"


@implementation UIViewController (HUD)


- (void)NetWorkingPostWithImageURL:(UIViewController *)Controller hiddenHUD:(BOOL)hidden url:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    if (!hidden) {
        [self Show];
    }
    
    [GRcyRifxy_UZ PostWithImageURL:url Params:params success:^(id  _Nonnull responseObject) {
        
        [self dismiss];
        
        if([responseObject[@"code"] intValue] == 5){
            [[LXZtjte_qController new] 登陆过期];
        }else{
            success(responseObject);
        }
    } failure:^(NSString * _Nonnull error) {
        [self dismiss];
        [ZIONf_d showBottomWithText:error duration:2];
        failure(error);
    }];
}


- (void)NetWorkingPostWithAddressURL:(UIViewController *)Controller hiddenHUD:(BOOL)hidden url:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    if (!hidden) {
        [self Show];
    }
    [GRcyRifxy_UZ PostWithAddressURL:url Params:params success:^(id  _Nonnull responseObject) {
        
        [self dismiss];
        
        if([responseObject[@"code"] intValue] == 5){
            [[LXZtjte_qController new] 登陆过期];
        }else{
            success(responseObject);
        }
    } failure:^(NSString * _Nonnull error) {
        [self dismiss];
        [ZIONf_d showBottomWithText:error duration:2];
        failure(error);
    }];
}



- (void)Show{
    [MBProgressHUD showHUDAddedTo:[UIDevice currentWindow] animated:YES];
}


- (void)NetWorkingPostWithURL:(UIViewController *)Controller hiddenHUD:(BOOL)hidden url:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    if (!hidden) {
        [self Show];
    }
    [GRcyRifxy_UZ PostWithURL:url Params:params success:^(id  _Nonnull responseObject) {
        [self dismiss];
        if([responseObject[@"code"] intValue] == 5){
            [[LXZtjte_qController new] 登陆过期];
        }else{
            success(responseObject);
        }
        
    } failure:^(NSString * _Nonnull error) {
        [self dismiss];
        [ZIONf_d showBottomWithText:error duration:2];
        failure(error);
    }];
}

- (void)dismiss{
    [MBProgressHUD hideHUDForView:[UIDevice currentWindow] animated:YES];
}



@end
