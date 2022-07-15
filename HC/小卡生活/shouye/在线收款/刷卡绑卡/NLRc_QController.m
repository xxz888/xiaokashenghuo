
#import "NLRc_QController.h"

@interface NLRc_QController ()

@property (weak, nonatomic) IBOutlet UIView *View1;
@property (weak, nonatomic) IBOutlet UITextField *textfield1;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;
@property (weak, nonatomic) IBOutlet UITextField *textfield3;
@property (weak, nonatomic) IBOutlet UITextField *textfield4;
@property (weak, nonatomic) IBOutlet UITextField *textfield5;

@property (weak, nonatomic) IBOutlet UIView *View5;

@property (weak, nonatomic) IBOutlet UILabel *getCode_lab;

@property (nonatomic , strong) NSDictionary *UserData;

@end

@implementation NLRc_QController


- (void)headmasterDump{

    __block NSInteger second = 60;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (second >= 0) {
                
                self.getCode_lab.text = [NSString stringWithFormat:@"%lds", second];
                
                second--;
                
                
            }else {
                self.getCode_lab.userInteractionEnabled = YES;
                dispatch_source_cancel(timer);
                self.getCode_lab.text = @"重新发送";
                
            }
            
        });
    });
    
    dispatch_resume(timer);
}


- (void)boudoirReception{
    
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:self.UserData[@"id"] forKey:@"userId"];
    [params setValue:self.UserData[@"fullname"] forKey:@"userName"];
    [params setValue:self.cardData[@"bankName"] forKey:@"bankName"];
    [params setValue:self.cardData[@"cardNo"] forKey:@"bankCard"];
    [params setValue:self.cardData[@"phone"] forKey:@"bankPhone"];
    [params setValue:self.cardData[@"securityCode"] forKey:@"securityCode"];
    [params setValue:self.cardData[@"expiredTime"] forKey:@"expiredTime"];
    [params setValue:self.cardData[@"idCard"] forKey:@"idCard"];
    [params setValue:self.channelId forKey:@"channelId"];
    [params setValue:brandId forKey:@"brandId"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/payment/fast/bindcard" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            if([responseObject[@"message"] isEqualToString:@"重复签约"]){
                [self.xp_rootNavigationController popViewControllerAnimated:YES];

                if (self.block) {
                    self.block(@"确认绑卡");
                }
            }else{
                [ZIONf_d showBottomWithText:@"短信发送成功"];
                self.getCode_lab.userInteractionEnabled = NO;
                [self headmasterDump];
            }
        }
        else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"签约确认";
    self.view.backgroundColor = [UIColor colorWithHexString:@"EFEFEF"];
    
    self.UserData = [NSDictionary dictionaryWithDictionary:[self loadUserData]];
    
    [self pallidMassage];
    
}

- (IBAction)签约确认:(id)sender {
    
    if (self.textfield5.text.length == 0) {
        [ZIONf_d showBottomWithText:@"请输入验证码"];
        return;
    }
    if (self.textfield5.text.length != 6) {
        [ZIONf_d showBottomWithText:@"请输入正确验证码"];
        return;
    }
    
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:self.textfield5.text forKey:@"smsMsg"];
    [params setValue:self.cardData[@"cardNo"] forKey:@"bankCard"];
    [params setValue:self.channelId forKey:@"channelId"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/payment/fast/bindcard/confirm" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            [self.xp_rootNavigationController popViewControllerAnimated:YES];
            if (self.block) {
                self.block(@"确认绑卡");
            }
        }
        else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
}


- (void)pallidMassage{
    
    
    [self.View1 getPartOfTheCornerRadius:CGRectMake(0, 0, DEVICE_WIDTH - 40, 50) CornerRadius:10 UIRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
    [self.View5 getPartOfTheCornerRadius:CGRectMake(0, 0, DEVICE_WIDTH - 40, 50) CornerRadius:10 UIRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
    
    
    
    self.textfield3.secureTextEntry = YES;
    self.textfield4.secureTextEntry = YES;
    self.textfield5.keyboardType = UIKeyboardTypeNumberPad;
    self.textfield1.text = self.UserData[@"fullname"];
    
    if (self.cardData.count > 0) {
        self.textfield2.text = [NSString getSecrectStringWithAccountNo:self.cardData[@"cardNo"]];
        
        self.textfield3.text = self.cardData[@"expiredTime"];
        
        self.textfield4.text = self.cardData[@"securityCode"];
        
        
    }
    
    [self.getCode_lab bk_whenTapped:^{
        [self boudoirReception];
    }];
    
}

@end
