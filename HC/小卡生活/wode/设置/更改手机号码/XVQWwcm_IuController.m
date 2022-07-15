
#import "XVQWwcm_IuController.h"
#import "OSEvmbEwb_nUCell.h"
@interface XVQWwcm_IuController ()<UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate>

@property (nonatomic , strong) UIImageView *top_imageView;
@property (nonatomic , strong) UILabel *top_lab;
@property (nonatomic , strong) UIView *content_view;
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) UIButton *finishBtn;

@property (nonatomic , strong) NSMutableArray *dataArr;
@property (nonatomic , strong) NSDictionary *UserData;

@property (nonatomic , strong) UIButton *codeBtn;
@end

@implementation XVQWwcm_IuController


- (void)stemOvertime{

    DHSDpnz_x3 *model0 = self.dataArr[0];
    if (model0.content.length==0) {
        [ZIONf_d showBottomWithText:@"请输入验证码"];
        return;
    }
    
    DHSDpnz_x3 *model1 = self.dataArr[1];
    if (model1.content.length==0) {
        [ZIONf_d showBottomWithText:@"请输入新手机号"];
        return;
    }
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:model1.content forKey:@"username"];
    [dic setValue:model0.content forKey:@"smsCode"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/update/username" Params:dic success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSDictionary *dic = [userDefaults dictionaryRepresentation];
            for (id key in dic) {
                [userDefaults removeObjectForKey:key];
            }
            [userDefaults synchronize];
            
            
            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            PXFrJw_QnIController *loginView = [[PXFrJw_QnIController alloc]init];
            XPRootNavigationController *navi = [[XPRootNavigationController alloc]initWithRootViewController:loginView];
            delegate.window.rootViewController = navi;
            
            
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}


#pragma 确认

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if ( textField.tag == 100 && textField.text.length > 5 && ![string isEqualToString:@""]) {
        return NO;
    }else if(textField.tag == 200 && textField.text.length > 10 && ![string isEqualToString:@""]){
        return NO;
    }
    return YES;
}

-(UILabel *)top_lab{
    if(!_top_lab){
        _top_lab = [UILabel new];
        _top_lab.textAlignment = NSTextAlignmentLeft;
        [UILabel getToChangeTheLabel:_top_lab TextColor:[UIColor whiteColor] TextFont:[UIFont getUIFontSize:12 IsBold:YES]];
    }
    return _top_lab;
}

- (UIImageView *)top_imageView{
    if (!_top_imageView) {
        _top_imageView = [UIImageView getUIImageView:@"amendmentCaissonOvoid"];
    }
    return _top_imageView;
}


- (UIView *)content_view{
    if (!_content_view) {
        _content_view = [UIView new];
    }
    return _content_view;
}


#pragma 获取验证码

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"更改手机号码"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArr = [NSMutableArray array];
    [self seriousHumiliateSimianHabitual];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        
    }
    return _tableView;
}

- (void)fireActress {
    
    __block NSInteger second = 60;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (second >= 0) {
                
                [self.codeBtn setTitle:[NSString stringWithFormat:@"%lds", second] forState:UIControlStateNormal];
                [self.codeBtn setUserInteractionEnabled:NO];
                second--;
            }else {
                dispatch_source_cancel(timer);
                [self.codeBtn setTitle:@"重新发送" forState:(UIControlStateNormal)];
                [self.codeBtn setUserInteractionEnabled:YES];
            }
            
        });
    });
    
    dispatch_resume(timer);
}
#pragma 懒加载

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"OSEvmbEwb_nUCell";
    OSEvmbEwb_nUCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"OSEvmbEwb_nUCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.row == 0) {
        [cell.code_btn setHidden:NO];
        self.codeBtn = cell.code_btn;
        [self.codeBtn bk_whenTapped:^{
            [self filibusterClueBetoken];
        }];
        cell.content_textfield.tag = 100;
    }else{
        [cell.code_btn setHidden:YES];
        cell.content_textfield.tag = 200;
    }
    DHSDpnz_x3 *model = self.dataArr[indexPath.row];
    cell.model = model;
    cell.name_lab.text = model.name;
    cell.content_textfield.placeholder = model.placeholder;
    cell.content_textfield.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
    cell.content_textfield.delegate = self;
    return cell;
}


- (void)seriousHumiliateSimianHabitual{
    
    
    
    
    NSArray *data = [NSMutableArray arrayWithObjects:@"验证码",@"新手机号", nil];
    for (int i = 0; i < data.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data[i];
        model.placeholder = [NSString stringWithFormat:@"请输入%@",data[i]];

        [self.dataArr addObject:model];
    }
    
    [self.view addSubview:self.top_imageView];
    [self.top_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 46));
        make.top.left.offset(0);
    }];
    [self.view addSubview:self.top_lab];
    [self.top_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-40, 20));
        make.center.equalTo(self.top_imageView);
    }];
    
    
    [self.view addSubview:self.content_view];
    [self.content_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.equalTo(self.top_imageView.mas_bottom).offset(15);
        make.height.offset(data.count * 50);
    }];
    
    self.content_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.content_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.content_view.layer.shadowOpacity = 0.2;
    self.content_view.layer.shadowRadius = 3;
    self.content_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.content_view.layer.cornerRadius = 10;
    
    self.tableView.layer.cornerRadius = 10;
    [self.content_view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
    
    

    [self.view addSubview:self.finishBtn];
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 46));
        make.left.offset(15);
        make.top.equalTo(self.content_view.mas_bottom).offset(44);
    }];
    
    
    self.UserData = [NSDictionary dictionaryWithDictionary:[self loadUserData]];
    
    _top_lab.text = [NSString stringWithFormat:@"您正在修改%@的登录账号",[NSString getSecrectStringWithPhoneNumber:self.UserData[@"username"]]];
    
}


- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"balloonOstentatious"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_finishBtn bk_whenTapped:^{
            [self stemOvertime];
        }];
    }
    return _finishBtn;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)filibusterClueBetoken{
    
    NSString *phone = self.UserData[@"username"];
    if (phone.length != 11) {
        [ZIONf_d showBottomWithText:@"请输入正确的手机号"];
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:phone forKey:@"phone"];
    [params setValue:@"0" forKey:@"type"];
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/notice/pass/sms/send" Params:params success:^(id  _Nonnull responseObject) {
        if([responseObject[@"code"] intValue] == 0){
            
            [weakSelf fireActress];
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2.0];
        }else{
            [ZIONf_d showBottomWithText:@"请求失败！"];
        }
        

    } failure:^(NSString * _Nonnull error) {}];
}

@end
