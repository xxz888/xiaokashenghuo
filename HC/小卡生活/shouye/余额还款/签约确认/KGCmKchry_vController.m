
#import "KGCmKchry_vController.h"
#import "YZPGjEuvf_jDCell.h"
#import "DHSDpnz_x3.h"
@interface KGCmKchry_vController ()<UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate>

@property (nonatomic , strong) UIImageView *top_imageView;
@property (nonatomic , strong) UILabel *top_lab;
@property (nonatomic , strong) UIView *content_view;
@property (nonatomic , strong) UITableView *tableView;
@property (strong, nonatomic)  UIButton *finishBtn;

@property (nonatomic , strong) NSMutableArray *dataArr;
@property (nonatomic , strong) UITextField *yzm_lab;

@property (nonatomic , strong) NSString *bindIdStr;

@end

@implementation KGCmKchry_vController


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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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

#pragma mark - UITableViewDelegate UITableViewDataSource

- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"balloonOstentatious"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"签约确定" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_finishBtn bk_whenTapped:^{
            [self sneakersReleaseSteam];
        }];
    }
    return _finishBtn;
}

- (void)sneakersReleaseSteam{
    
    DHSDpnz_x3 * model = self.dataArr[4];
    if (model.placeholder.length == 0) {
        [ZIONf_d showBottomWithText:@"验证码不能为空！"];
        return;
    }
    
    NSDictionary *UserData = [self loadUserData];
    
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:self.cardData[@"cardNo"] forKey:@"cardNo"];
    [params setValue:model.placeholder forKey:@"smsCode"];
    [params setValue:self.bindIdStr forKey:@"bindId"];
    [params setValue:UserData[@"idcard"] forKey:@"idCard"];
    
    if (self.empowerToken.length > 0) {
        [params setObject:self.empowerToken forKey:@"empowerToken"];
    }
    
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit/bind/card/confirm" Params:params success:^(id  _Nonnull responseObject) {
        
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

- (UIImageView *)top_imageView{
    if (!_top_imageView) {
        _top_imageView = [UIImageView getUIImageView:@"amendmentCaissonOvoid"];
    }
    return _top_imageView;
}


- (void)commitmentFord{
    
    NSArray *data = [NSMutableArray arrayWithObjects:@"持卡人",@"卡号",@"有效期",@"安全码",@"验证码", nil];
    for (int i = 0; i < data.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data[i];
        
        
        if (self.cardData.count > 0) {
            
            if ([data[i] isEqualToString:@"持卡人"]) {
                
                if (self.empowerToken.length > 0) {
                    model.content = self.customer_Name;
                }else{
                    
                    NSDictionary *UserData = [self loadUserData];
                    model.content = [NSString stringWithFormat:@"%@",UserData[@"fullname"]];
                }
            }
            else if ([data[i] isEqualToString:@"卡号"]){
                model.content = self.cardData[@"cardNo"];
            }
            else if ([data[i] isEqualToString:@"有效期"]){
                model.content = self.cardData[@"expiredTime"];
            }
            else if ([data[i] isEqualToString:@"安全码"]){
                model.content = self.cardData[@"securityCode"];
            }else{
                model.content = @"获取验证码";
            }
            
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
        make.top.equalTo(self.content_view.mas_bottom).offset(50);
    }];
}

- (UIView *)content_view{
    if (!_content_view) {
        _content_view = [UIView new];
    }
    return _content_view;
}

- (void)pilgrimRepairmenHarborMedical{

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
                self.yzm_lab.userInteractionEnabled = YES;
                dispatch_source_cancel(timer);
                self.yzm_lab.text = @"重新发送";
                
            }
            
        });
    });
    
    dispatch_resume(timer);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma 懒加载

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"签约确认";
    self.dataArr = [NSMutableArray array];
    self.bindIdStr = @"";
    [self commitmentFord];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (void)coilPurificationObservance{
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:self.cardData[@"cardNo"] forKey:@"cardNo"];
    if (self.empowerToken.length > 0) {
        [params setObject:self.empowerToken forKey:@"empowerToken"];
    }
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit//bind/card" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            if([responseObject[@"message"] isEqualToString:@"重复签约"]){
                [self.xp_rootNavigationController popViewControllerAnimated:YES];
                
                if (self.block) {
                    self.block(@"确认绑卡");
                }
            }else{
                self.bindIdStr = [NSString stringWithFormat:@"%@",responseObject[@"data"]];
                [ZIONf_d showBottomWithText:@"短信发送成功"];
                self.yzm_lab.userInteractionEnabled = NO;
                [self pilgrimRepairmenHarborMedical];
            }
        }
        else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(self.yzm_lab.text.length > 5 && ![string isEqualToString:@""]){
        return NO;
    }
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"YZPGjEuvf_jDCell";
    YZPGjEuvf_jDCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"YZPGjEuvf_jDCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.model = self.dataArr[indexPath.row];
    
    if([cell.title_lab.text isEqualToString:@"验证码"]){
        self.yzm_lab = cell.content_textfield;
        self.yzm_lab.delegate = self;
    }
    
    [cell.content_textfield bk_whenTapped:^{
        [self coilPurificationObservance];
    }];
    return cell;
}

@end
