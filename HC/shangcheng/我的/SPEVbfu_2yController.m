
#import "SPEVbfu_2yController.h"
#import "IQzkv_1LJCell.h"
#import "MMNGdtl_VController.h"
#import "LXmzDnez_cController.h"
#import "MHMXbIeg_Ty3Controller.h"
#import "QGQZvf_iView.h"
#import "YZBJyrUhd_EController.h"
#import "IOZJk_9Controller.h"
@interface SPEVbfu_2yController ()<UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate>

@property(strong, nonatomic) UIImageView *top_imageViewraitxiaoka;
@property(strong, nonatomic) UIImageView *top_HeadPortraitxiaoka;
@property(strong, nonatomic) UILabel *top_titlexiaoka;

@property(strong, nonatomic) UIView *content_Views;
@property(strong, nonatomic) NSArray *TitleArrxiaoka;

@property(strong, nonatomic) UIView *HC_viewxiaoka;


@property(strong, nonatomic) UIView *operation_Viewsxiaoka;
@property(strong, nonatomic) UITableView *tableView;

@property(strong, nonatomic) NSArray *dataArrxiaoka;

@end

@implementation SPEVbfu_2yController


- (UIView *)operation_Viewsxiaoka{
    if (!_operation_Viewsxiaoka) {
        _operation_Viewsxiaoka = [UIView new];
        self.operation_Viewsxiaoka.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.operation_Viewsxiaoka.layer.shadowOffset = CGSizeMake(0, 0.3);
        self.operation_Viewsxiaoka.layer.shadowOpacity = 0.2;
        self.operation_Viewsxiaoka.layer.shadowRadius = 3;
        self.operation_Viewsxiaoka.layer.shadowColor = [UIColor blackColor].CGColor;
        self.operation_Viewsxiaoka.layer.cornerRadius = 10;
    }
    return _operation_Viewsxiaoka;
}


#pragma 跳转小卡生活

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


- (UIImageView *)top_HeadPortraitxiaoka{
    if (!_top_HeadPortraitxiaoka) {
        _top_HeadPortraitxiaoka = [UIImageView getUIImageView:@"accidentStrictlySincerely"];
    }
    return _top_HeadPortraitxiaoka;
}


- (void)farmhandAppendix{
    
    
    NSDictionary *UserData = [self loadUserData];
    if ([UserData allKeys].count > 0 && ![UserData[@"username"] isEqualToString:@"13383773801"] ) {
        IOZJk_9Controller *tabber = [IOZJk_9Controller new];
        
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        delegate.window.rootViewController = tabber;
    }

}
#pragma mark - UITableViewDelegate UITableViewDataSource

- (UIImageView *)top_imageViewraitxiaoka{
    if (!_top_imageViewraitxiaoka) {
        _top_imageViewraitxiaoka = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"construeLily"]];
        _top_imageViewraitxiaoka.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _top_imageViewraitxiaoka;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(indexPath.row == 2){
        [self.xp_rootNavigationController pushViewController:[MMNGdtl_VController new] animated:YES];
    }
    
    else if(indexPath.row == 3) {
        if (![self toLogin]) return;
        [self.xp_rootNavigationController pushViewController:[LXmzDnez_cController new] animated:YES];
    }
    
    else if(indexPath.row == 1) {
        if (![self toLogin]) return;
        [self.xp_rootNavigationController pushViewController:[YZBJyrUhd_EController new] animated:YES];
    }
    
    else if(indexPath.row == 0) {
        if (![self toLogin]) return;
        [self.xp_rootNavigationController pushViewController:[RFc_RController new] animated:YES];
    }

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
        for (int i = 0; i < _TitleArrxiaoka.count; i++) {
            
            NSDictionary *dic = _TitleArrxiaoka[i];
            
            UIView *views = [UIView new];
            views.backgroundColor = [UIColor whiteColor];
            views.userInteractionEnabled = YES;
            [_content_Views addSubview:views];
            [views mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.offset(view_W);
                make.left.offset(X);
                make.centerY.equalTo(_content_Views);
            }];
            [views bk_whenTapped:^{
                [self eliminationPower:i];
            }];
            
            UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:dic[@"image"]]];
            [views addSubview:image];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.offset(0);
                make.centerX.equalTo(views);
            }];
            UILabel *title = [UILabel new];
            title.font = [UIFont getUIFontSize:14 IsBold:NO];
            title.textAlignment = NSTextAlignmentCenter;
            title.textColor = [UIColor blackColor];
            title.text = dic[@"name"];
            [views addSubview:title];
            [title mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.offset(20);
                make.centerX.equalTo(views);
                make.top.equalTo(image.mas_bottom).offset(8);
                make.bottom.offset(0);
            }];
            
            X = X + view_W;

        }
    }
    return _content_Views;
}


- (void)eliminationPower:(NSInteger)index{
    if (![self toLogin]) return;
    BUtg_5Controller *VC = [BUtg_5Controller new];
    VC.index = index;
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.navigationBarHidden = YES;
    
    if([self toLogin]){
        NSDictionary *Userdic = [self loadUserData];
        self.top_titlexiaoka.text = [Userdic[@"nick"] length] == 0 ? @"未命名": Userdic[@"nick"];
    }
    [self farmhandAppendix];
}


- (UIView *)HC_viewxiaoka{
    if (!_HC_viewxiaoka) {
        _HC_viewxiaoka = [UIView new];
        UIImageView *icon_BG = [UIImageView getUIImageView:@"wasteAdmit"];
        icon_BG.ylCornerRadius = 10;
        [_HC_viewxiaoka addSubview:icon_BG];
        [icon_BG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.offset(0);
            make.left.offset(15);
            make.right.offset(-15);
        }];
        
        UIView *content = [UIView new];
        [_HC_viewxiaoka addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_HC_viewxiaoka);
            make.top.bottom.offset(0);
            make.height.offset(80);
        }];
        UIImageView *icon_img = [UIImageView getUIImageView:@"mall_HC_Icon"];
        [content addSubview:icon_img];
        [icon_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(content);
            make.left.offset(0);
        }];
        UIImageView *name_img = [UIImageView getUIImageView:@"mall_HC_Name"];
        [content addSubview:name_img];
        [name_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(content);
            make.left.equalTo(icon_img.mas_right).offset(5);
            make.right.offset(0);
        }];
        [_HC_viewxiaoka bk_whenTapped:^{
            [self farmhandAppendix];
        }];
    }
    return _HC_viewxiaoka;
}


- (void)interiorCapacity{
    

    self.TitleArrxiaoka = [NSArray arrayWithObjects:
                     @{@"name":@"待支付",@"image":@"puritanicalJeans"},
                     @{@"name":@"待发货",@"image":@"gridironSwarthy"},
                     @{@"name":@"已发货",@"image":@"sittingroomEntrapment"},
                     @{@"name":@"已完成",@"image":@"standNeutron"}, nil];

    self.dataArrxiaoka = [NSArray arrayWithObjects:
                    @{@"name":@"收货地址",@"image":@"radiateGrowlInept"},
                    @{@"name":@"我的收藏",@"image":@"geometryDifferAmusement"},
                
                     @{@"name":@"关于我们",@"image":@"clemencyLeaven"},
                     @{@"name":@"系统设置",@"image":@"acreOutrageous"},nil];
    
    [self.view addSubview:self.top_imageViewraitxiaoka];
    [self.top_imageViewraitxiaoka mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 130 + kTopHeight));
        make.top.right.left.offset(0);
    }];
    self.top_HeadPortraitxiaoka.layer.masksToBounds = YES;
    self.top_HeadPortraitxiaoka.layer.cornerRadius = 31;
    [self.view addSubview:self.top_HeadPortraitxiaoka];
    [self.top_HeadPortraitxiaoka mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(62, 62));
        make.left.offset(15);
        make.top.equalTo(self.top_imageViewraitxiaoka.mas_top).offset(kTopHeight-9);
    }];
    [self.view addSubview:self.top_titlexiaoka];
    [self.top_titlexiaoka mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.top_HeadPortraitxiaoka.mas_right).offset(12);
        make.centerY.equalTo(self.top_HeadPortraitxiaoka);
    }];

    
    
    [self.view addSubview:self.content_Views];
    [self.content_Views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 100));
        make.left.offset(15);
        make.top.equalTo(self.top_imageViewraitxiaoka.mas_bottom).offset(-50);
    }];
    
    [self.view addSubview:self.HC_viewxiaoka];
    [self.HC_viewxiaoka mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
        make.top.equalTo(self.content_Views.mas_bottom).offset(15);
    }];
    
    
    
    [self.view addSubview:self.operation_Viewsxiaoka];
    [self.operation_Viewsxiaoka mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, self.dataArrxiaoka.count * 50 + 20));
        make.left.offset(15);
        make.top.equalTo(self.HC_viewxiaoka.mas_bottom).offset(15);
    }];
    
    [self.operation_Viewsxiaoka addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, self.dataArrxiaoka.count * 50));
        make.left.offset(0);
        make.centerY.equalTo(self.operation_Viewsxiaoka);
    }];
}

- (UILabel *)top_titlexiaoka{
    if (!_top_titlexiaoka) {
        _top_titlexiaoka = [UILabel new];
        _top_titlexiaoka.text = @"暂无昵称";
        _top_titlexiaoka.font = [UIFont getUIFontSize:15 IsBold:YES];
        _top_titlexiaoka.textColor = [UIColor whiteColor];
        _top_titlexiaoka.userInteractionEnabled = YES;
        [_top_titlexiaoka bk_whenTapped:^{
            [self usageBlush];
        }];
    }
    return _top_titlexiaoka;
}


- (void)usageBlush{
    if (![self toLogin]) return;
    @weakify(self);
    QGQZvf_iView *trading = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QGQZvf_iView class]) owner:nil options:nil] lastObject];
    trading.width = DEVICE_WIDTH - 40;
    trading.height = 320;
    trading.layer.cornerRadius = 8;
    
    LSTPopView *popView = [LSTPopView initWithCustomView:trading
                                                  popStyle:LSTPopStyleSpringFromTop
                                              dismissStyle:LSTDismissStyleSmoothToTop];
    LSTPopViewWK(popView)
    [trading.btn bk_whenTapped:^{
        if (trading.textfield.text.length > 0 ) {
            [weak_self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/user/update/nick" Params:@{@"nick":trading.textfield.text} success:^(id  _Nonnull responseObject) {
                if ([responseObject[@"code"] intValue] == 0) {
                    self.top_titlexiaoka.text = trading.textfield.text;
                    [ZIONf_d showBottomWithText:responseObject[@"message"]];
                    
                    
                    NSMutableDictionary *UserData = [NSMutableDictionary dictionaryWithDictionary:[self loadUserData]];
                    [UserData setObject:trading.textfield.text forKey:@"nick"];
                    [self updateUserData:UserData];
                    
                }else{
                    [ZIONf_d showBottomWithText:responseObject[@"message"]];
                }
            } failure:^(NSString * _Nonnull error) {
                
            }];
        }
        [wk_popView dismiss];
    }];
    popView.bgClickBlock = ^{
        [wk_popView dismiss];
    };
    [popView pop];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F0F2F5"];
    [self interiorCapacity];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrxiaoka.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"IQzkv_1LJCell";
    IQzkv_1LJCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"IQzkv_1LJCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.name_lab.text = self.dataArrxiaoka[indexPath.row][@"name"];
    cell.icon_image.image = [UIImage imageNamed:self.dataArrxiaoka[indexPath.row][@"image"]];
    
    
    return cell;
}


@end
