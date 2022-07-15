
#import "XDZnhFiik_abController.h"
#import "ZHFmcQz_lCell.h"
#import "LExgql_UqController.h"
#import "UUWbfcGiigo_K1Controller.h"
#import "NLRc_QController.h"
@interface XDZnhFiik_abController ()<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *tableView;

@property (strong, nonatomic)  UIImageView *top_image;
@property (strong, nonatomic)  UIView *navigation_View;
@property (strong, nonatomic)  UIButton *nav_back;
@property (strong, nonatomic)  UILabel *nav_title;

@property (strong, nonatomic)  UILabel *name_lab;
@property (strong, nonatomic)  UILabel *number_lab;

@property (strong, nonatomic)  UILabel *select_channel;
@property (strong, nonatomic)  NSMutableArray *channelArr;


@end

@implementation XDZnhFiik_abController


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.showsVerticalScrollIndicator = NO;
        
    }
    return _tableView;
}
#pragma 获取通道列表数据

- (UILabel *)nav_title{
    if (!_nav_title) {
        _nav_title = [UILabel new];
        _nav_title.text = @"选择刷卡通道";
        _nav_title.textColor = FontThemeColor;
        _nav_title.font = [UIFont boldSystemFontOfSize:18];
    }
    return _nav_title;
}



#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)fellowVeneerSwearTrite{
    @weakify(self);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.CreditData[@"bankName"] forKey:@"bankName"];
    [params setValue:self.CashData[@"bankName"] forKey:@"debitBankName"];
    [params setValue:self.amount forKey:@"amount"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/payment/quick/choose/channel" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            weak_self.channelArr = [NSMutableArray arrayWithArray:responseObject[@"data"]];
            [weak_self.tableView reloadData];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}

- (UILabel *)name_lab{
    if (!_name_lab) {
        _name_lab = [UILabel new];
        _name_lab.text = @"信用卡刷卡";
        _name_lab.textColor = FontThemeColor;
        _name_lab.font = [UIFont getUIFontSize:18 IsBold:YES];
    }
    return _name_lab;
}


- (void)backAction{
    [self.xp_rootNavigationController popViewControllerAnimated:YES];
}

- (void)跳转支付确认:(NSDictionary *)channelDic 信息:(NSDictionary *)UserData{
    
    LExgql_UqController *VC = [LExgql_UqController new];
    
    [VC.params setValue:channelDic[@"id"] forKey:@"channelId"];
    [VC.params setValue:self.amount forKey:@"amount"];
    [VC.params setValue:UserData[@"username"] forKey:@"loginPhone"];
    [VC.params setValue:self.CreditData[@"bankName"] forKey:@"bankName"];
    [VC.params setValue:self.CreditData[@"cardNo"] forKey:@"bankCard"];
    [VC.params setValue:self.CreditData[@"phone"] forKey:@"bankPhone"];
    [VC.params setValue:self.CreditData[@"securityCode"] forKey:@"securityCode"];
    [VC.params setValue:self.CreditData[@"expiredTime"] forKey:@"expiredTime"];
    [VC.params setValue:self.CreditData[@"fullname"] forKey:@"userName"];
    [VC.params setValue:self.CreditData[@"idCard"] forKey:@"idCard"];
    
    [VC.params setValue:self.CashData[@"bankName"] forKey:@"debitBankName"];
    [VC.params setValue:self.CashData[@"cardNo"] forKey:@"debitBankCard"];
    [VC.params setValue:self.CashData[@"phone"] forKey:@"debitPhone"];

    VC.needCity = [channelDic[@"needCity"] stringValue];
    VC.needCode = [channelDic[@"needCode"] stringValue];
    
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
    
}



- (UIView *)navigation_View{
    if (!_navigation_View) {
        _navigation_View = [UIView new];
    }
    return _navigation_View;
}
#pragma 无数据点击刷新

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.channelArr.count;
}

- (UIImageView *)top_image{
    if (!_top_image) {
        _top_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lexicographerHeirIntolerant"]];
        _top_image.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _top_image;
}
#pragma 懒加载

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self geneAbstinence];
    [self fellowVeneerSwearTrite];
}

- (UIButton *)nav_back{
    if (!_nav_back) {
        _nav_back = [UIButton new];
        [_nav_back setImage:[UIImage imageNamed:@"nihilismSlur"] forState:UIControlStateNormal];
        [_nav_back addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [_nav_back setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
    }
    return _nav_back;
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self fellowVeneerSwearTrite];
}

- (UILabel *)select_channel{
    if (!_select_channel) {
        _select_channel = [UILabel new];
        _select_channel.text = @"选择刷卡通道";
        _select_channel.textColor = [UIColor colorWithHexString:@"#333333"];
        _select_channel.font = [UIFont getUIFontSize:15 IsBold:NO];
    }
    return _select_channel;
}

- (void)geneAbstinence{
    
    [self.nav_back bk_whenTapped:^{
        [self.xp_rootNavigationController popViewControllerAnimated:YES];
    }];

    [self.view addSubview:self.top_image];
    [self.top_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(Ratio(161));
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
    }];
    [self.view addSubview:self.navigation_View];
    [self.navigation_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 44));
        make.top.equalTo(self.top_image.mas_top).offset(kStatusBarHeight);
        make.left.equalTo(self.view);
    }];
    
    [self.view addSubview:self.nav_back];
    [self.nav_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.centerY.equalTo(self.navigation_View);
    }];
    [self.view addSubview:self.nav_title];
    [self.nav_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.navigation_View);
    }];
    
    [self.view addSubview:self.name_lab];
    [self.name_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigation_View.mas_bottom).offset(35);
        make.left.offset(30);
    }];
    
    [self.view addSubview:self.number_lab];
    [self.number_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigation_View.mas_bottom).offset(35);
        make.right.offset(-30);
    }];
    
    
    
    [self.view addSubview:self.select_channel];
    [self.select_channel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top_image.mas_bottom).offset(20);
        make.left.offset(15);
    }];
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.select_channel.mas_bottom).offset(10);
        make.bottom.offset(-KBottomHeight);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (UILabel *)number_lab{
    if (!_number_lab) {
        _number_lab = [UILabel new];
        _number_lab.text = [NSString stringWithFormat:@"%@元",self.amount];
        _number_lab.textColor = FontThemeColor;
        _number_lab.font = [UIFont getUIFontSize:18 IsBold:YES];
        _number_lab.textAlignment = NSTextAlignmentRight;
    }
    return _number_lab;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"ZHFmcQz_lCell";
    ZHFmcQz_lCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"ZHFmcQz_lCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSDictionary *data = self.channelArr[indexPath.row];
    
    cell.title_lab.text = data[@"alias"];
    
    cell.dbxe_lab.text = [NSString stringWithFormat:@"单笔限额：%@",data[@"limitMax"]];
    
    cell.drxe_lab.text = [NSString stringWithFormat:@"单日限额：%@",data[@"dayMax"]];
    
    cell.jysj_lab.text = [NSString stringWithFormat:@"交易时间：%@-%@",[data[@"startTime"] substringToIndex:5],[data[@"endTime"] substringToIndex:5]];
    
    cell.feilv_lab.text = [NSString stringWithFormat:@"交易费率：%.2f%@+%@元",[data[@"costRate"] doubleValue]*100,@"%",data[@"costFee"]];
    
    
    [cell.chakan_lab bk_whenTapped:^{
        UUWbfcGiigo_K1Controller *VC = [UUWbfcGiigo_K1Controller new];
        VC.channelID = data[@"id"];
        VC.navigationItem.title = data[@"alias"];
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
    }];
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSDictionary *UserData = [self loadUserData];
    
    NSDictionary *channelDic = self.channelArr[indexPath.row];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:channelDic[@"id"] forKey:@"channelId"];
    [params setValue:UserData[@"username"] forKey:@"loginPhone"];
    [params setValue:self.CreditData[@"bankName"] forKey:@"bankName"];
    [params setValue:self.CreditData[@"cardNo"] forKey:@"bankCard"];
    [params setValue:self.CreditData[@"phone"] forKey:@"bankPhone"];
    [params setValue:self.CreditData[@"securityCode"] forKey:@"securityCode"];
    [params setValue:self.CreditData[@"expiredTime"] forKey:@"expiredTime"];
    [params setValue:self.CreditData[@"fullname"] forKey:@"userName"];
    [params setValue:self.CreditData[@"idCard"] forKey:@"idCard"];
    [params setValue:self.CashData[@"bankName"] forKey:@"debitBankName"];
    [params setValue:self.CashData[@"cardNo"] forKey:@"debitBankCard"];
    [params setValue:self.CashData[@"phone"] forKey:@"debitPhone"];

    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/payment/fast/verify/bindcard" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            [self 跳转支付确认:channelDic 信息:UserData];
        }else if([responseObject[@"code"] intValue] == 3){
            NLRc_QController *VC = [NLRc_QController new];
            VC.cardData = self.CreditData;
            VC.channelId = channelDic[@"id"];
            VC.block = ^(NSString * _Nonnull str) {
                [self 跳转支付确认:channelDic 信息:UserData];
            };
            [self.xp_rootNavigationController pushViewController:VC animated:YES];
        }
        else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
    
}
@end
