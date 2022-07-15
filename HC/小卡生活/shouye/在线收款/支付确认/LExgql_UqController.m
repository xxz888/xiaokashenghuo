
#import "LExgql_UqController.h"
#import "BRmaPhqii_6dCell.h"

#import "DHSDpnz_x3.h"

@interface LExgql_UqController ()<UITableViewDelegate, UITableViewDataSource ,UITextFieldDelegate>

@property (nonatomic , strong) UIImageView *top_imageView;
@property (nonatomic , strong) UILabel *top_lab;
@property (nonatomic , strong) UIView *content_view;
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) UIButton *finishBtn;


@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , strong) UITextField *yzm_lab;

@property (nonatomic , strong) NSString *orderCode;


@property (nonatomic , strong) NSString *provinceAddress;
@property (nonatomic , strong) NSString *cityAddress;

@end

@implementation LExgql_UqController


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {}
#pragma 获取定位地址并进行比对

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
#pragma 调用刷卡接口 界面逻辑为 获取验证码

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
#pragma 确认刷卡接口

- (void)theoryHandwritingResearcher{
    
    if ([self.needCity isEqualToString:@"1"]) {
        DHSDpnz_x3 *model = [self GetToFindThe:@"市"];
        if (model.content.length == 0) {
            [ZIONf_d showBottomWithText:@"省市不能为空！"];
            return;
        }
    }
    DHSDpnz_x3 *models = [self GetToFindThe:@"验证码"];
    if (models.placeholder.length == 0) {
        [ZIONf_d showBottomWithText:@"验证码不能为空！"];
        return;
    }
    
    NSMutableDictionary *paramsData = [NSMutableDictionary dictionary];
    [paramsData setValue:self.orderCode forKey:@"orderCode"];
    [paramsData setValue:self.params[@"channelId"] forKey:@"channelId"];
    [paramsData setValue:self.params[@"idCard"] forKey:@"idCard"];
    [paramsData setValue:models.placeholder forKey:@"smsCode"];
    [paramsData setValue:self.params[@"bankCard"] forKey:@"bankCard"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/payment/fast/confirm" Params:paramsData success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 3) {
            [self invigoratingPeninsula];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}
#pragma 查看订单状态

- (void)specifyHaulAffidavitSeamy{

    __block NSInteger second = 60;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (second >= 0) {
                
                self.yzm_lab.text = [NSString stringWithFormat:@"%lds", second];
                
                second--;
                
                
            }else {
                
                dispatch_source_cancel(timer);
                self.yzm_lab.text = @"重新发送";
                
            }
            
        });
    });
    
    dispatch_resume(timer);
}

#pragma 确认支付

- (UIView *)content_view{
    if (!_content_view) {
        _content_view = [UIView new];
    }
    return _content_view;
}
#pragma 查找数据
- (DHSDpnz_x3 *)GetToFindThe:(NSString *)title{
    DHSDpnz_x3 *model;
    for (int i = 0 ; i < self.dataArr.count; i++) {
        DHSDpnz_x3 *models = self.dataArr[i];
        if ([models.name isEqualToString:title]) {
            model = models;
            break;
        }
    }
    return model;
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)crouchPolishedHeavy{
    @weakify(self);
    [self addLocationManager:^(NSString * _Nonnull province, NSString * _Nonnull city) {
        weak_self.provinceAddress = province;
        weak_self.cityAddress = city;
        [weak_self getAddressThan:province City:city isThan:^(NSString * _Nonnull provinceCode, NSString * _Nonnull cityCode, BOOL isThan) {
            if (isThan) {
                if ([[NSArray arrayWithObjects:@"重庆",@"北京",@"天津",@"上海", nil] containsObject:province]) {
                    [weak_self.params setValue:provinceCode forKey:@"cityCode"];
                }else{
                    [weak_self.params setValue:cityCode forKey:@"cityCode"];
                }
                DHSDpnz_x3 *model4 = weak_self.dataArr[4];
                model4.content = province;
                DHSDpnz_x3 *model5 = weak_self.dataArr[5];
                model5.content = city;
                [weak_self.tableView reloadData];
            }
        }];
    }];
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

- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"balloonOstentatious"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"确定支付" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_finishBtn bk_whenTapped:^{
            [self childhoodAssentReassuring];
        }];
    }
    return _finishBtn;
}

- (void)sprawlingDesiccate{
    
    NSMutableArray *data = [NSMutableArray arrayWithObjects:@"持卡人",@"卡号",@"有效期",@"安全码",@"省份",@"市",@"验证码", nil];
    
    if (![self.needCity isEqualToString:@"1"]) {
        data = [NSMutableArray arrayWithObjects:@"持卡人",@"卡号",@"有效期",@"安全码",@"验证码", nil];
    }
    if (![self.needCode isEqualToString:@"1"]) {
        data = [NSMutableArray arrayWithObjects:@"持卡人",@"卡号",@"有效期",@"安全码",@"省份",@"市", nil];
    }
    if (![self.needCode isEqualToString:@"1"] && ![self.needCity isEqualToString:@"1"]) {
        data = [NSMutableArray arrayWithObjects:@"持卡人",@"卡号",@"有效期",@"安全码", nil];
    }
    
    for (int i = 0; i < data.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data[i];
        
        if ([data[i] isEqualToString:@"验证码"]) {
            model.content = @"获取验证码";
            model.placeholder = @"";
        }
        else if ([data[i] isEqualToString:@"持卡人"]){
            model.content = self.params[@"userName"];
        }
        else if ([data[i] isEqualToString:@"卡号"]){
            model.content = self.params[@"bankCard"];
        }
        else if ([data[i] isEqualToString:@"有效期"]){
            model.content = self.params[@"expiredTime"];
        }
        else if ([data[i] isEqualToString:@"安全码"]){
            model.content = self.params[@"securityCode"];
        }else if([data[i] isEqualToString:@"省份"] || [data[i] isEqualToString:@"市"]){
            model.placeholder = [NSString stringWithFormat:@"请选择%@",data[i]];
            
            
        }
        [self.dataArr addObject:model];
    }
    
    
        
        
    
    
    
    [self.view addSubview:self.top_imageView];
    [self.top_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 46));
        make.top.left.offset(0);
    }];
    [self.view addSubview:self.top_lab];
    [self.top_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 20));
        make.center.equalTo(self.top_imageView);
    }];
    
    
    [self.view addSubview:self.content_view];
    [self.content_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.equalTo(self.top_imageView.mas_bottom).offset(15);
        make.height.offset(self.dataArr.count*50);
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
        make.top.equalTo(self.content_view.mas_bottom).offset(50);
    }];
    
}

- (void)fissureAviaryUndersigned{
    @weakify(self);
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/payment/fast/apply" Params:self.params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            weak_self.orderCode = responseObject[@"data"];
            
            [ZIONf_d showBottomWithText:@"短信发送成功"];
            [self specifyHaulAffidavitSeamy];
            if (![self.needCode isEqualToString:@"1"]) {
                [self invigoratingPeninsula];
            }
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}



- (NSMutableDictionary *)params{
    if (!_params) {
        _params = [NSMutableDictionary dictionary];
    }
    return _params;
}




- (void)invigoratingPeninsula{
    @weakify(self);
    NSMutableDictionary *paramsData = [NSMutableDictionary dictionary];
    [paramsData setValue:self.params[@"channelId"] forKey:@"channelId"];
    [paramsData setValue:self.orderCode forKey:@"orderCode"];
    
    [paramsData setValue:self.params[@"idCard"] forKey:@"idCard"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/payment/fast/query" Params:paramsData success:^(id  _Nonnull responseObject) {
        
        BEwdca_WView *trading = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BEwdca_WView class]) owner:nil options:nil] lastObject];
        trading.backgroundColor = [UIColor clearColor];
        if ([responseObject[@"code"] intValue] == 0) {
            trading.title_lab.text = @"交易成功";
        }else if ([responseObject[@"code"] intValue] == 1){
            trading.title_lab.text = @"交易失败";
        }else if ([responseObject[@"code"] intValue] == 3){
            trading.title_lab.text = @"处理中";
        }
        trading.number_lab.text = weak_self.params[@"amount"];

        
        LSTPopView *popView = [LSTPopView initWithCustomView:trading
                                                      popStyle:LSTPopStyleSpringFromTop
                                                  dismissStyle:LSTDismissStyleSmoothToTop];
        LSTPopViewWK(popView)
        [trading.determine_btn bk_whenTapped:^{
            [wk_popView dismiss];
            [weak_self backToAppointedController:[KFszPp_mxXController new]];
        }];
        [popView pop];
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
}

#pragma 懒加载

- (void)childhoodAssentReassuring{
    
    
    if ([self.needCode isEqualToString:@"1"]) {
        [self theoryHandwritingResearcher];
    }
    else{
        [self fissureAviaryUndersigned];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"支付确认";
    self.dataArr = [NSMutableArray array];
    self.orderCode = @"";
    self.provinceAddress = @"";
    self.cityAddress = @"";
    [self sprawlingDesiccate];
    [self crouchPolishedHeavy];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"BRmaPhqii_6dCell";
    BRmaPhqii_6dCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"BRmaPhqii_6dCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.model = self.dataArr[indexPath.row];

    [cell.content_textfield bk_whenTapped:^{
        
        if ([cell.title_lab.text isEqualToString:@"省份"]||[cell.title_lab.text isEqualToString:@"市"]) {
            
            ZZCEkpLfibp_WvjView *PickerView = [[ZZCEkpLfibp_WvjView alloc]init];
            PickerView.provinceAddress = self.provinceAddress;
            PickerView.cityAddress = self.cityAddress;
            PickerView.channelId = [self.params[@"channelId"] stringValue];
            PickerView.Block = ^(NSDictionary *startDic, NSDictionary *endDic) {
                
                if ([startDic allKeys].count > 0) {
                    if ([[NSArray arrayWithObjects:@"重庆",@"北京",@"天津",@"上海", nil] containsObject:startDic[@"name"]]) {
                        [self.params setValue:startDic[@"id"] forKey:@"cityCode"];
                    }else{
                        [self.params setValue:endDic[@"id"] forKey:@"cityCode"];
                    }
                    DHSDpnz_x3 *model4 = self.dataArr[4];
                    model4.content = startDic[@"name"];
                    DHSDpnz_x3 *model5 = self.dataArr[5];
                    model5.content = endDic[@"name"];
                    [self.tableView reloadData];
                }
                
            };
            [PickerView show];
        }
        
        else if([cell.title_lab.text isEqualToString:@"验证码"]){
            self.yzm_lab = cell.content_textfield;
            if ([self.needCity isEqualToString:@"1"]) {
                if (![[self.params allKeys] containsObject:@"cityCode"]) {
                    [ZIONf_d showBottomWithText:@"请选择城市"];
                    return;
                }
            }
            
            [self fissureAviaryUndersigned];
        }
        
        
    }];
    
    return cell;
}


- (UIImageView *)top_imageView{
    if (!_top_imageView) {
        _top_imageView = [UIImageView getUIImageView:@"amendmentCaissonOvoid"];
    }
    return _top_imageView;
}

-(UILabel *)top_lab{
    if(!_top_lab){
        _top_lab = [UILabel new];
        _top_lab.text = @"信息加密处理，仅用于银行卡验证，请验证您本人的银行卡";
        _top_lab.textAlignment = NSTextAlignmentCenter;
        [UILabel getToChangeTheLabel:_top_lab TextColor:[UIColor blackColor] TextFont:[UIFont getUIFontSize:12 IsBold:NO]];
    }
    return _top_lab;
}

@end
