
#import "KFszPp_mxXController.h"
#import "KKep_lController.h"
#import "XDHEdqz_T2View.h"
#import "XDZnhFiik_abController.h"
@interface KFszPp_mxXController ()<UITextFieldDelegate>

@property (nonatomic , strong) XDHEdqz_T2View *Keyboard;

@property (nonatomic , strong) NSDictionary *CreditData;
@property (nonatomic , strong) NSDictionary *CashData;

@end

@implementation KFszPp_mxXController


- (void)maximizeLanguishInquiryDereliction{
    self.pay_image.image = [UIImage imageNamed:getBankLogo([self.CreditData[@"bankAcronym"] lowercaseString])];
    self.pay_content.text = [NSString stringWithFormat:@"%@(%@)",self.CreditData[@"bankName"],getAfterFour([self.CreditData[@"cardNo"] stringValue])];
}


#pragma 获取默认信用卡

- (void)setSelectedRange:(NSRange)selectedRange textField:(UITextField *)textField {
    
    UITextPosition *startPosition = [textField positionFromPosition:textField.beginningOfDocument offset:selectedRange.location];
    
    UITextPosition *endPosition = [textField positionFromPosition:textField.beginningOfDocument offset:selectedRange.location + selectedRange.length];
    
    UITextRange *selectedTextRange = [textField textRangeFromPosition:startPosition toPosition:endPosition];
    [textField setSelectedTextRange:selectedTextRange];
}
#pragma 信用卡赋值

- (void)hallTurbulent:(UITextField *)textField offset:(NSInteger)offset {
    NSRange currentRange = [self forefatherAspirationImproviseConceited:textField];
    if (currentRange.location < offset) {
        offset = currentRange.location;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
        [self setSelectedRange:NSMakeRange(offset, 0) textField:textField];
    });
}

#pragma 获取默认储蓄卡

- (void)mateHeraldSword{
    @weakify(self);
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/user/debit/card/def" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            weak_self.CashData = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
            [weak_self pretentiousConsequently];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}
#pragma 储蓄卡赋值

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    [self spurnVersion];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = NO;
    
    self.amount_textfield.inputView=[[UIView alloc] init];
    self.amount_textfield.inputView.hidden = YES;
    [self.amount_textfield becomeFirstResponder];
    
}

#pragma 点击事件

- (void)pretentiousConsequently{
    self.account_image.image = [UIImage imageNamed:getBankLogo([self.CashData[@"bankAcronym"] lowercaseString])];
    self.account_content.text = [NSString stringWithFormat:@"%@(%@)",self.CashData[@"bankName"],getAfterFour([self.CashData[@"cardNo"] stringValue])];
}



#pragma 立即收款

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self entreatDiscordProprietorship];
    [self marxismTantrumQuadrupedTen];
    [self convergentUnseemlyWhelp];
    [self mateHeraldSword];
}
#pragma 自定义键盘操作

- (void)aviaryAssiduousKnow{
    
    
    if (self.amount_textfield.text.length == 0) {
        [ZIONf_d showBottomWithText:@"请输入刷卡金额"];
        return;
    }
    
    if ([NSString isTheWholeTen:self.amount_textfield.text]) {
        NSString *message = @"不建议输入整十金额，请重新输入";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:@"温馨提示"];
        [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 4)];
        [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont getUIFontSize:17 IsBold:NO] range:NSMakeRange(0, 4)];
        [alert setValue:alertControllerStr forKey:@"attributedTitle"];
        
        
        NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
        [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, message.length)];
        [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont getUIFontSize:15 IsBold:NO] range:NSMakeRange(0, message.length)];
        [alert setValue:alertControllerMessageStr forKey:@"attributedMessage"];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        
        [cancelAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
        
        [alert addAction:cancelAction];
        
        
        
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    
    if ([self.CreditData allKeys].count == 0) {
        [ZIONf_d showBottomWithText:@"支付信用卡不能为空！"];
        return;
    }
    if ([self.CashData allKeys].count == 0) {
        [ZIONf_d showBottomWithText:@"到账储蓄卡不能为空！"];
        return;
    }
    
    XDZnhFiik_abController *VC = [XDZnhFiik_abController new];
    VC.amount = self.amount_textfield.text;
    VC.CashData = self.CashData;
    VC.CreditData = self.CreditData;
    
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}
#pragma mark - 光标控制 - 获取&设置光标位置

- (void)convergentUnseemlyWhelp{
    @weakify(self);
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/credit/card/def" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            weak_self.CreditData = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
            [weak_self maximizeLanguishInquiryDereliction];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}
#pragma 更新光标位置

- (void)viewWillDisappear:(BOOL)animated{
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [self.Keyboard disMissView];
}

- (void)entreatDiscordProprietorship{

    
    [self.top_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(Ratio(161));
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
    }];
    [self.navigation_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 44));
        make.top.equalTo(self.top_image.mas_top).offset(kStatusBarHeight);
        make.left.equalTo(self.view);
    }];
    [self.nav_back setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
    [self.nav_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.centerY.equalTo(self.navigation_View);
    }];
    [self.nav_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.navigation_View);
    }];
    
    [self.history setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
    [self.history mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-12);
        make.centerY.equalTo(self.navigation_View);
    }];
    
    [self.content_view AddViewTypeRadius:10];
    [self.content_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 242));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.navigation_View.mas_bottom).offset(30);
    }];
    
    [self.login_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 19));
        make.top.offset(15);
        make.left.offset(15);
    }];
    
    [self.login_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 19));
        make.centerY.equalTo(self.login_image);
        make.left.equalTo(self.login_image.mas_right).offset(15);
    }];
    
    
    self.amount_view.layer.cornerRadius = 5.5;
    [self.amount_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH-60);
        make.centerX.equalTo(self.content_view);
        make.top.equalTo(self.login_image.mas_bottom).offset(8);
    }];
    
    [self.amount_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(19, 36));
        make.top.offset(18);
        make.left.offset(27);
    }];
    self.amount_textfield.delegate = self;
    [self.amount_textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(36);
        make.centerY.equalTo(self.amount_lab);
        make.left.equalTo(self.amount_lab.mas_right).offset(15);
        make.right.offset(-10);
    }];
    
    [self.amount_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(0.5);
        make.top.equalTo(self.amount_lab.mas_bottom).offset(8);
        make.left.offset(10);
        make.right.offset(-10);
    }];
    
    double lab_W = (DEVICE_WIDTH - 60 - 1) / 3;
    [self.amount_center_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.centerX.equalTo(self.amount_view);
        make.top.equalTo(self.amount_line.mas_bottom).offset(12);
    }];
    [self.amount_center_number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.centerX.equalTo(self.amount_center_title);
        make.top.equalTo(self.amount_center_title.mas_bottom).offset(10);
        make.bottom.offset(-10);
    }];
    
    [self.amount_left_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(0.5, 12));
        make.top.equalTo(self.amount_center_title.mas_bottom).offset(-1);
        make.right.equalTo(self.amount_center_title.mas_left);
    }];
    
    [self.amount_left_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.top.equalTo(self.amount_line.mas_bottom).offset(12);
        make.right.equalTo(self.amount_left_line.mas_left);
    }];
    [self.amount_left_number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.centerX.equalTo(self.amount_left_title);
        make.top.equalTo(self.amount_left_title.mas_bottom).offset(10);
    }];
    
    [self.amount_right_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(0.5, 12));
        make.top.equalTo(self.amount_center_title.mas_bottom).offset(-1);
        make.left.equalTo(self.amount_center_title.mas_right);
    }];
    
    [self.amount_right_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.top.equalTo(self.amount_line.mas_bottom).offset(12);
        make.left.equalTo(self.amount_right_line.mas_right);
    }];
    [self.amount_right_number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.centerX.equalTo(self.amount_right_title);
        make.top.equalTo(self.amount_right_title.mas_bottom).offset(10);
    }];
    
    
    [self.pay_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(90);
        make.top.equalTo(self.amount_view.mas_bottom).offset(Ratio(15));
        make.left.equalTo(self.amount_view.mas_left);
    }];
    
    [self.pay_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(23, 23));
        make.centerY.equalTo(self.pay_title);
        make.left.equalTo(self.pay_title.mas_right).offset(5);
    }];
    [self.pay_more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(44);
        make.centerY.equalTo(self.pay_title);
        make.right.equalTo(self.amount_view.mas_right);
    }];
    [self.pay_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.pay_title);
        make.left.equalTo(self.pay_image.mas_right).offset(5);
        make.right.equalTo(self.pay_more.mas_left).offset(-5);
    }];
    
    [self.account_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(90);
        make.top.equalTo(self.pay_title.mas_bottom).offset(Ratio(15));
        make.left.equalTo(self.amount_view.mas_left);
    }];
    
    [self.account_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(23, 23));
        make.centerY.equalTo(self.account_title);
        make.left.equalTo(self.account_title.mas_right).offset(5);
    }];
    [self.account_more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(44);
        make.centerY.equalTo(self.account_title);
        make.right.equalTo(self.amount_view.mas_right);
    }];
    [self.account_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.account_title);
        make.left.equalTo(self.account_image.mas_right).offset(5);
        make.right.equalTo(self.account_more.mas_left).offset(-5);
    }];
    
    
}



- (NSRange)forefatherAspirationImproviseConceited:(UITextField *)textField {
    
    NSInteger location = [textField offsetFromPosition:textField.beginningOfDocument toPosition:textField.selectedTextRange.start];
    
    NSInteger length = [textField offsetFromPosition:textField.selectedTextRange.start toPosition:textField.selectedTextRange.end];
    
    return NSMakeRange(location, length);
}


- (void)marxismTantrumQuadrupedTen{
    @weakify(self);
    [self.nav_back bk_whenTapped:^{
        [weak_self.xp_rootNavigationController popViewControllerAnimated:YES];
    }];
    
    self.history.userInteractionEnabled = YES;
    [self.history bk_whenTapped:^{
        [weak_self.xp_rootNavigationController pushViewController:[KKep_lController new] animated:YES];
    }];
    
    self.pay_more.userInteractionEnabled = YES;
    [self.pay_more bk_whenTapped:^{
        QJn_cController *VC = [QJn_cController new];
        VC.block = ^(NSDictionary * _Nullable dataDic) {
            weak_self.CreditData = dataDic;
            [weak_self maximizeLanguishInquiryDereliction];
        };
        [weak_self.xp_rootNavigationController pushViewController:VC animated:YES];
    }];
    
    self.account_more.userInteractionEnabled = YES;
    [self.account_more bk_whenTapped:^{
        GAIkn_vController *VC = [GAIkn_vController new];
        VC.block = ^(NSDictionary * _Nullable dataDic) {
            weak_self.CashData = dataDic;
            [weak_self pretentiousConsequently];
        };
        [weak_self.xp_rootNavigationController pushViewController:VC animated:YES];
    }];
}


- (void)spurnVersion{
    @weakify(self);
    self.Keyboard = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XDHEdqz_T2View class]) owner:nil options:nil] lastObject];
    self.Keyboard.block = ^(NSString * _Nonnull str) {
        
        if ([str isEqualToString:@"收起"]) {
            [weak_self.Keyboard disMissView];
        }
        else if ([str isEqualToString:@"删除"]){
            NSInteger index = [weak_self forefatherAspirationImproviseConceited:weak_self.amount_textfield].location;
            if(weak_self.amount_textfield.text.length > 0 && index > 0){
                NSString *string = weak_self.amount_textfield.text;
                
                weak_self.amount_textfield.text = [NSString stringWithFormat:@"%@%@",[string substringToIndex:index-1],[string substringFromIndex:index]];
                
                [weak_self hallTurbulent:weak_self.amount_textfield offset:index-1];
            }
        }
        else if([str isEqualToString:@"立即收款"]){
            [weak_self aviaryAssiduousKnow];
        }
        else{
            NSInteger index = [weak_self forefatherAspirationImproviseConceited:weak_self.amount_textfield].location;
            NSString *string = weak_self.amount_textfield.text;
            NSString *string1 = AppendString([string substringToIndex:index], str);
            
            weak_self.amount_textfield.text = [NSString stringWithFormat:@"%@%@",string1,[string substringFromIndex:index]];
            
            [weak_self hallTurbulent:weak_self.amount_textfield offset:index+1];
        }
    };
    [self.Keyboard ShowView];
}

@end
