
#import "JLxcjiLdqwi_AController.h"
#import "ZHdtphAm_HCell.h"
#import "IFmy_zoMController.h"
#import "GPc_9IxController.h"
#import "BSbqcLvls_npEController.h"
#import "MMNGdtl_VController.h"
#import "KOf_4View.h"
@interface JLxcjiLdqwi_AController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UIImageView *top_imageView;
@property(strong, nonatomic) UIImageView *top_HeadPortrait;
@property(strong, nonatomic) UILabel *top_title;
@property(strong, nonatomic) UILabel *top_members;
@property(strong, nonatomic) UILabel *top_phone;
@property(strong, nonatomic) UILabel *top_id;
@property(strong, nonatomic) UIButton *top_personalData;
@property(strong, nonatomic) UISwitch *TopSwitch;
@property(strong, nonatomic) UISwitch *bottomSwitch;
@property(strong, nonatomic) UIView *content_line_gold;

@property(strong, nonatomic) UIView *content_Views;
@property(strong, nonatomic) NSArray *TitleArr;

@property(strong, nonatomic) UIView *operation_Views;
@property(strong, nonatomic) UITableView *tableView;

@property(strong, nonatomic) NSArray *dataArr;

@end

@implementation JLxcjiLdqwi_AController


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"ZHdtphAm_HCell";
    ZHdtphAm_HCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"ZHdtphAm_HCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.name_lab.text = self.dataArr[indexPath.row][@"name"];
    cell.icon_image.image = [UIImage imageNamed:self.dataArr[indexPath.row][@"image"]];
    
    if (indexPath.row == 5) {
        [cell.contentView addSubview:self.TopSwitch];
        [self.TopSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 30));
            make.centerY.equalTo(cell.contentView);
            make.right.offset(-15);
        }];
        [cell.right_but setHidden:YES];
    }else if (indexPath.row == 6) {
        [cell.contentView addSubview:self.bottomSwitch];
        [self.bottomSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 30));
            make.centerY.equalTo(cell.contentView);
            make.right.offset(-15);
        }];
        [cell.right_but setHidden:YES];
    }else{
        [cell.right_but setHidden:NO];
    }
    return cell;
}
#pragma 开启中介授权

- (void)arbitratorSheet{
    
    self.TitleArr = [NSArray arrayWithObjects:
                     @{@"name":@"收益规则",@"image":@"arsonNonviscous"},
                     @{@"name":@"收益明细",@"image":@"odiumBarkGraphite"},
                     @{@"name":@"素材管理",@"image":@"histocompatibilityParticularize"},
                     @{@"name":@"我的团队",@"image":@"favorableSeemlySpeaker"}, nil];
    
    self.dataArr = [NSArray arrayWithObjects:
                     @{@"name":@"邀请好友",@"image":@"viableVenerationRecompense"},
                     @{@"name":@"使用帮助",@"image":@"importerGlobe"},
                     @{@"name":@"客服中心",@"image":@"radiateGrowlInept"},
                     @{@"name":@"关于我们",@"image":@"clemencyLeaven"},
                     @{@"name":@"系统设置",@"image":@"acreOutrageous"},
                    @{@"name":@"开启上级权限",@"image":@"behindhandForagerContribution"},nil];
    
    [self.view addSubview:self.top_imageView];
    [self.top_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 150 + kTopHeight));
        make.top.right.left.offset(0);
    }];
    self.top_HeadPortrait.layer.masksToBounds = YES;
    self.top_HeadPortrait.layer.cornerRadius = 31;
    [self.view addSubview:self.top_HeadPortrait];
    [self.top_HeadPortrait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(62, 62));
        make.left.offset(15);
        make.top.equalTo(self.top_imageView.mas_top).offset(kTopHeight-9);
    }];
    [self.view addSubview:self.top_title];
    [self.top_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.top_HeadPortrait.mas_right).offset(12);
        make.top.equalTo(self.top_HeadPortrait.mas_top).offset(8);
    }];
    
    self.top_members.layer.masksToBounds = YES;
    self.top_members.layer.cornerRadius = 10;
    [self.view addSubview:self.top_members];
    [self.top_members mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(20);
        make.left.equalTo(self.top_title.mas_right).offset(10);
        make.centerY.equalTo(self.top_title);
    }];
    
    [self.view addSubview:self.top_phone];
    [self.top_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.top_title.mas_left).offset(0);
        make.top.equalTo(self.top_title.mas_bottom).offset(5);
    }];
    [self.view addSubview:self.top_id];
    [self.top_id mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.top_phone.mas_left).offset(0);
        make.top.equalTo(self.top_phone.mas_bottom).offset(5);
    }];
    [self.view addSubview:self.top_personalData];
    [self.top_personalData mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(self.top_HeadPortrait);
    }];
    
    [self.view addSubview:self.content_line_gold];
    [self.content_line_gold mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 1.0));
        make.left.offset(0);
        make.top.equalTo(self.top_imageView.mas_bottom).offset(0);
    }];
    
    UIView *content_line = [UIView new];
    content_line.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    [self.view addSubview:content_line];
    [content_line getPartOfTheCornerRadius:CGRectMake(0, 0, DEVICE_WIDTH - 28, 63) CornerRadius:10 UIRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
    [content_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH - 28, 63));
        make.left.offset(14);
        make.bottom.equalTo(self.top_imageView.mas_bottom);
    }];
    
    
    [self.view addSubview:self.content_Views];
    [self.content_Views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 124));
        make.left.offset(15);
        make.top.equalTo(self.top_imageView.mas_bottom).offset(-62);
    }];
    
    [self.view addSubview:self.operation_Views];
    [self.operation_Views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, self.dataArr.count * 44 + 10));
        make.left.offset(15);
        make.top.equalTo(self.content_Views.mas_bottom).offset(10);
    }];
    
    [self.operation_Views addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, self.dataArr.count * 44));
        make.left.offset(0);
        make.centerY.equalTo(self.operation_Views);
    }];
    
    
}



- (UISwitch *)TopSwitch{
    if (!_TopSwitch) {
        _TopSwitch = [UISwitch new];
        [_TopSwitch addTarget:self action:@selector(AuthorizedAgents:)forControlEvents:UIControlEventTouchUpInside];
    }
    return _TopSwitch;
}
#pragma 开启分润

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

- (void)conserveChuckle:(NSInteger)index{
    
    
    if (index == 1) {
        [self.xp_rootNavigationController pushViewController:[IFmy_zoMController new] animated:YES];
    }
    
    else if(index == 2) {
        [self.xp_rootNavigationController pushViewController:[OWGl_MQController new] animated:YES];
        
    }
    
    else if(index == 0) {
        [self.xp_rootNavigationController pushViewController:[EQDbtKp_WVkController new] animated:YES];
    }
    
    else if(index == 3) {
        OTJz_5lController *VC = [OTJz_5lController new];
        VC.type = @"团队";
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
    }
    
}
#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self arbitratorSheet];
}

- (UILabel *)top_members{
    if (!_top_members) {
        _top_members = [UILabel new];
        _top_members.text = @"V1";
        _top_members.textAlignment = NSTextAlignmentCenter;
        _top_members.font = [UIFont getUIFontSize:10 IsBold:YES];
        _top_members.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        _top_members.textColor = [UIColor blackColor];
    }
    return _top_members;
}

- (UIButton *)top_personalData{
    if (!_top_personalData) {
        _top_personalData = [[UIButton alloc]init];
        [_top_personalData setTitle:@"个人资料" forState:UIControlStateNormal];
        [_top_personalData setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _top_personalData.titleLabel.font = [UIFont getUIFontSize:12 IsBold:NO];
        [_top_personalData setImage:[UIImage imageNamed:@"tokenZipcodePredominance"] forState:UIControlStateNormal];
        [_top_personalData layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:15];
        [_top_personalData bk_whenTapped:^{
            [self.xp_rootNavigationController pushViewController:[GPc_9IxController new] animated:YES];
        }];
    }
    return _top_personalData;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UIView *)content_Views{
    if (!_content_Views) {
        _content_Views = [UIView new];
        self.content_Views.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.content_Views.layer.shadowOffset = CGSizeMake(0, 0.3);
        self.content_Views.layer.shadowOpacity = 0.2;
        self.content_Views.layer.shadowRadius = 3;
        self.content_Views.layer.shadowColor = [UIColor blackColor].CGColor;
        self.content_Views.layer.cornerRadius = 10;
        
        
        
 
        CGFloat X = 0;
        double view_W = (DEVICE_WIDTH-30)/4;
        for (int i = 0; i < _TitleArr.count; i++) {
            
            NSDictionary *dic = _TitleArr[i];
            
            UIView *views = [UIView new];
            views.backgroundColor = [UIColor whiteColor];
            views.userInteractionEnabled = YES;
            [views bk_whenTapped:^{
                [self conserveChuckle:i];
            }];
            [_content_Views addSubview:views];
            [views mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.offset(view_W);
                make.left.offset(X);
                make.centerY.equalTo(_content_Views);
            }];
            
            UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:dic[@"image"]]];
            [views addSubview:image];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.offset(0);
                make.centerX.equalTo(views);
            }];
            UILabel *title = [UILabel new];
            title.font = [UIFont getUIFontSize:15 IsBold:YES];
            title.textAlignment = NSTextAlignmentCenter;
            title.textColor = [UIColor blackColor];
            title.text = dic[@"name"];
            [views addSubview:title];
            [title mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.offset(20);
                make.centerX.equalTo(views);
                make.top.equalTo(image.mas_bottom).offset(5);
                make.bottom.offset(0);
            }];
            
            X = X + view_W;

        }
    }
    return _content_Views;
}


- (UIView *)content_line_gold{
    if (!_content_line_gold) {
        _content_line_gold = [UIView new];
        _content_line_gold.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    }
    return _content_line_gold;
}


- (UIImageView *)top_imageView{
    if (!_top_imageView) {
        _top_imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rivalryExistenceResurgent"]];
        _top_imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _top_imageView;
}

- (void)defuseInsulinDisparageRacial{
    @weakify(self);
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/user/empower/switch" Params:@{@"status":@(self.TopSwitch.on)} success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            if (self.TopSwitch.on) {
                [ZIONf_d showBottomWithText:@"开启成功"];
            }else{
                [ZIONf_d showBottomWithText:@"关闭成功"];
            }
            
        }else{
            weak_self.TopSwitch.on = !weak_self.TopSwitch.on;
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}


- (UILabel *)top_title{
    if (!_top_title) {
        _top_title = [UILabel new];
        _top_title.text = @"熊威";
        _top_title.font = [UIFont getUIFontSize:15 IsBold:YES];
        _top_title.textColor = [UIColor colorWithHexString:@"#ffffff"];
    }
    return _top_title;
}

- (UISwitch *)bottomSwitch{
    if (!_bottomSwitch) {
        _bottomSwitch = [UISwitch new];
        [_bottomSwitch addTarget:self action:@selector(FenRunVoice:)forControlEvents:UIControlEventTouchUpInside];
        
        NSDictionary *UserData = [self loadUserData];
        _bottomSwitch.on = [UserData[@"msgSound"] boolValue];
    }
    return _bottomSwitch;
}

- (UILabel *)top_id{
    if (!_top_id) {
        _top_id = [UILabel new];
        _top_id.font = [UIFont getUIFontSize:9 IsBold:NO];
        _top_id.textColor = FontThemeColor;
    }
    return _top_id;
}


- (UIView *)operation_Views{
    if (!_operation_Views) {
        _operation_Views = [UIView new];
        self.operation_Views.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.operation_Views.layer.shadowOffset = CGSizeMake(0, 0.3);
        self.operation_Views.layer.shadowOpacity = 0.2;
        self.operation_Views.layer.shadowRadius = 3;
        self.operation_Views.layer.shadowColor = [UIColor blackColor].CGColor;
        self.operation_Views.layer.cornerRadius = 10;
    }
    return _operation_Views;
}


- (void)AuthorizedAgents:(UISwitch *)sw{
    
    if (!sw.on) {
        [self defuseInsulinDisparageRacial];
    }else{
        @weakify(self);
        KOf_4View *trading = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KOf_4View class]) owner:nil options:nil] lastObject];
        trading.frame = CGRectMake(0, 0, DEVICE_WIDTH - 40, 320);
        
        trading.layer.cornerRadius = 8;
        
        LSTPopView *popView = [LSTPopView initWithCustomView:trading
                                                      popStyle:LSTPopStyleSpringFromTop
                                                  dismissStyle:LSTDismissStyleSmoothToTop];
        LSTPopViewWK(popView)
        [trading.left_btn bk_whenTapped:^{
            weak_self.TopSwitch.on = NO;
            [wk_popView dismiss];
        }];
        [trading.right_btn bk_whenTapped:^{
            [wk_popView dismiss];
            [weak_self defuseInsulinDisparageRacial];
        }];
        [popView pop];
    }
}

- (UIImageView *)top_HeadPortrait{
    if (!_top_HeadPortrait) {
        _top_HeadPortrait = [UIImageView getUIImageView:@"accidentStrictlySincerely"];
    }
    return _top_HeadPortrait;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UILabel *)top_phone{
    if (!_top_phone) {
        _top_phone = [UILabel new];
        _top_phone.text = @"152****0828";
        _top_phone.font = [UIFont getUIFontSize:10 IsBold:YES];
        _top_phone.textColor = [UIColor colorWithHexString:@"#ffffff"];
    }
    return _top_phone;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    NSDictionary *UserData = [self loadUserData];
    
    
    self.top_phone.text = [NSString getSecrectStringWithPhoneNumber:UserData[@"username"]];
    
    self.TopSwitch.on = [UserData[@"empower"] boolValue];
    
    
    if ([NSString isBlankString:[UserData[@"nick"] stringValue]]) {
        self.top_title.text = [UserData[@"fullname"] length] == 0 ? @"未实名" : UserData[@"fullname"];
    }else{
        self.top_title.text = UserData[@"nick"];
    }
    if ([UserData[@"vipLevel"] intValue] == 0) {
        self.top_members.text = @"普通";
        [self.top_members mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.offset(30);
        }];
    }else{
        self.top_members.text = [NSString stringWithFormat:@"V%@",UserData[@"vipLevel"]];
        [self.top_members mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.offset(20);
        }];
    }
    
    id traget = self.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:traget action:nil];
    [self.view addGestureRecognizer:pan];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self.xp_rootNavigationController pushViewController:[GTRMuq_ZController new] animated:YES];
    }
    
    else if(indexPath.row == 1) {
        [self.xp_rootNavigationController pushViewController:[PXl_3jController new] animated:YES];
    }
    
    else if(indexPath.row == 2) {
        [self.xp_rootNavigationController pushViewController:[VFBTtRyb_7lController new] animated:YES];
    }
    
    else if(indexPath.row == 3) {
        [self.xp_rootNavigationController pushViewController:[MMNGdtl_VController new] animated:YES];
    }
    
    else if(indexPath.row == 4) {
        [self.xp_rootNavigationController pushViewController:[LXmzDnez_cController new] animated:YES];
    }

}


- (void)FenRunVoice:(UISwitch *)sw{
    
    @weakify(self);
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/user/msg/sound/switch" Params:@{@"status":@(sw.on)} success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            if (sw.on) {
                [ZIONf_d showBottomWithText:@"开启成功"];
            }else{
                [ZIONf_d showBottomWithText:@"关闭成功"];
            }
            NSMutableDictionary *UserData = [NSMutableDictionary dictionaryWithDictionary:[self loadUserData]];
            [UserData setObject:[NSString stringWithFormat:@"%i",sw.on] forKey:@"msgSound"];
            [self updateUserData:UserData];
        }else{
            weak_self.bottomSwitch.on = !weak_self.bottomSwitch.on;
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}
@end
