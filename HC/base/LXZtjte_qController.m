
#import "LXZtjte_qController.h"
#import "AppDelegate.h"
#import <CoreLocation/CLLocationManager.h>
@interface LXZtjte_qController ()<AMapLocationManagerDelegate>

@property (nonatomic , assign) BOOL isAlert;

@property (nonatomic, strong) AMapLocationManager *LocationManager;

@end

@implementation LXZtjte_qController


- (BOOL)CameraPermissions{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (authStatus == AVAuthorizationStatusNotDetermined || authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        
        
        UIAlertController *alterCon = [UIAlertController alertControllerWithTitle:@"是否开启相机访问权限？"
                                                                          message:nil
                                                                   preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *OFF = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *ON = [UIAlertAction actionWithTitle:@"去开启" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) { 
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                    
                }];
            }
        }];
        [alterCon addAction:OFF];
        [alterCon addAction:ON];
        [[UIViewController currentViewController] presentViewController:alterCon animated:YES completion:nil];
        return NO;
    } else { 
        
        return YES;
    }
}


- (void)updateSuperMembersData:(NSDictionary *)data{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *UserData = [NSMutableDictionary dictionaryWithDictionary:[standardDefaults objectForKey:@"SuperMembers"]];

    [UserData addEntriesFromDictionary:data];
    [standardDefaults setObject:UserData forKey:@"SuperMembers"];
    [standardDefaults synchronize];
}

- (BOOL)RealNameAuthentication{
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:@"UserData"];
    if (UserData != nil && [UserData[@"selfLevel"] intValue] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您的帐号还未实名，是否立即去实名？" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"暂不实名" style:UIAlertActionStyleCancel handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"去实名" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            TSQTyHmvd_cKController *vc = [TSQTyHmvd_cKController new];
            [self.xp_rootNavigationController pushViewController:vc animated:YES];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        return NO;
    }else{
        return YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTranslucent:false];
    self.isAlert = NO;
}

- (void)amapLocationManager:(AMapLocationManager *)manager doRequireLocationAuth:(CLLocationManager*)locationManager{
    [locationManager requestAlwaysAuthorization];
}



- (float)randomBetween:(float)smallNum AndBigNum:(float)bigNum AndPrecision:(NSInteger)precision{
    
    float subtraction = bigNum - smallNum;
    
    subtraction = ABS(subtraction);
    
    subtraction *= precision;
    
    float randomNumber = arc4random() % ((int) subtraction + 1);
    
    randomNumber /= precision;
    
    float result = MIN(smallNum, bigNum) + randomNumber;
    
    return result;
}

- (BOOL)isEmpty:(id)object{
    if (object == nil || [object isEqual:[NSNull null]]) {
        return YES;
    } else if ([object isKindOfClass:[NSString class]]) {
        return [object isEqualToString:@""];
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [object isEqualToNumber:@(0)];
    }
    return NO;
}



- (BOOL)toLogin{
    
    
    NSDictionary *UserData = [self loadUserData];
    if ([UserData allKeys].count == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请登录" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"稍后" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"去登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            PXFrJw_QnIController *VC = [PXFrJw_QnIController new];
            
            [self.xp_rootNavigationController pushViewController:VC animated:YES];
            
        }]];
        [[UIViewController currentViewController] presentViewController:alert animated:YES completion:^{}];
        return NO;
    }
    return YES;
}


- (NSDictionary *)loadSuperMembersData{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:@"SuperMembers"];
    return UserData;
}


- (void)登陆过期{
    
    if (!self.isAlert) {
        self.isAlert = YES;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"登陆过期,请重新登录" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            self.isAlert = NO;
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.isAlert = NO;
            
            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            PXFrJw_QnIController *loginView = [[PXFrJw_QnIController alloc]init];
            XPRootNavigationController *navi = [[XPRootNavigationController alloc]initWithRootViewController:loginView];
            delegate.window.rootViewController = navi;
        }]];
        [[UIViewController currentViewController] presentViewController:alert animated:YES completion:^{}];
    }
    
}

- (void)setBubbleSortArray:(NSMutableArray *)dataArr FieldString:(NSString *)fieldStr{
    for (int i = 0; i < [dataArr count] ; i++) {
        for (int j = 0; j < [dataArr count] - i - 1; j++) {
            if ([dataArr[j][fieldStr] doubleValue] < [dataArr[j+1][fieldStr] doubleValue]) {
                NSDictionary *temp = dataArr[j];
                dataArr[j] = dataArr[j+1];
                dataArr[j+1] = temp;
            }
        }
    }
}
#pragma 冒泡排序 大的在前

- (void)addLocationManager:(void(^)(NSString *province,NSString *city))backname{
    
    
    [AMapLocationManager updatePrivacyShow:AMapPrivacyShowStatusDidShow privacyInfo:AMapPrivacyInfoStatusDidContain];
    [AMapLocationManager updatePrivacyAgree:AMapPrivacyAgreeStatusDidAgree];
    
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)) {
        
    }
    else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请打开APP定位权限" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
            NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:settingsURL options:@{} completionHandler:nil];
        }];
        
        [sureAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
        
        [alertController addAction:cancelAction];
        [alertController addAction:sureAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    [AMapServices sharedServices].apiKey = AMaPAppKey;
    self.LocationManager = [[AMapLocationManager alloc] init];
    self.LocationManager.delegate = self;
    if (@available(iOS 14.0, *)) {
        self.LocationManager.locationAccuracyMode = AMapLocationFullAndReduceAccuracy;
    } else {
        
    }
    
    [self.LocationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    self.LocationManager.locationTimeout =5;
    
    self.LocationManager.reGeocodeTimeout = 5;
    
    [self.LocationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error){
            if (error.code == AMapLocationErrorLocateFailed){
                [ZIONf_d showBottomWithText:@"定位失败，请手动选择"];
                return;
            }
        }
        if (regeocode){
            
            NSString *province = regeocode.province;
            if([province containsString:@"市"]){
                province = [province stringByReplacingOccurrencesOfString:@"市" withString:@""];
            }
            backname(province,regeocode.city);
        }
    }];
    
}


- (void)updateUserData:(NSDictionary *)data{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *UserData = [NSMutableDictionary dictionaryWithDictionary:[standardDefaults objectForKey:@"UserData"]];

    [UserData addEntriesFromDictionary:data];
    [standardDefaults setObject:UserData forKey:@"UserData"];
    [standardDefaults synchronize];
}

#pragma mark - 获取单次定位地址 返回

- (NSDictionary *)loadUserData{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:@"UserData"];
    return UserData;
}

- (NSDictionary *)getToObtainTheSpecified:(NSString *)key{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *UserData = [standardDefaults objectForKey:key];
    return UserData;
}






- (void)getAddressThan:(NSString *)province City:(NSString *)city isThan:(void(^)(NSString *provinceCode,NSString *cityCode,BOOL isThan))backname{
    [self NetWorkingPostWithAddressURL:[UIViewController currentViewController] hiddenHUD:YES url:@"/api/payment/province/list" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            
            NSArray *array = [NSArray arrayWithArray:responseObject[@"data"]];
            for(int i = 0 ; i < array.count ; i++){
                
                NSDictionary *provinceDic = array[i];
                if ([provinceDic[@"name"] containsString:[province substringToIndex:2]]) {
                    NSMutableDictionary *params = [NSMutableDictionary dictionary];
                    [params setValue:provinceDic[@"id"] forKey:@"parent"];
                    
                    [self NetWorkingPostWithAddressURL:self hiddenHUD:YES url:@"/api/payment/city/list" Params:params success:^(id  _Nonnull responseObject) {
                        if ([responseObject[@"code"] intValue] == 0) {
                            NSArray *array = [NSArray arrayWithArray:responseObject[@"data"]];
                            BOOL isThan = NO;
                            NSDictionary *cityDic = [NSDictionary dictionary];
                            for(NSDictionary *dic in array){
                                if ([dic[@"name"] containsString:city]) {
                                    cityDic = dic;
                                    isThan = YES;
                                }
                            }
                            backname(provinceDic[@"id"],cityDic[@"id"],isThan);
                        }else{
                            backname(@"",@"",NO);
                            [ZIONf_d showCenterWithText:responseObject[@"message"]];
                        }
                    } failure:^(NSString * _Nonnull error) {
                        backname(@"",@"",NO);
                    }];
                }
            }
        }else{
            [ZIONf_d showCenterWithText:responseObject[@"message"]];
            backname(@"",@"",NO);
        }
    } failure:^(NSString * _Nonnull error) {
        backname(@"",@"",NO);
    }];
    
}




- (void)updateToObtainTheSpecified:(NSString *)key Data:(NSDictionary *)data{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *UserData = [NSMutableDictionary dictionaryWithDictionary:[standardDefaults objectForKey:key]];

    [UserData addEntriesFromDictionary:data];
    [standardDefaults setObject:UserData forKey:key];
    [standardDefaults synchronize];
}
@end
