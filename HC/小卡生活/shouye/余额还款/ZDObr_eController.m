
#import "ZDObr_eController.h"
#import "INZcy_MHFCell.h"

@interface ZDObr_eController ()<UITableViewDelegate, UITableViewDataSource , DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UIView *top_view;
@property (nonatomic , strong) UIView *ts1_view;
@property (nonatomic , strong) UILabel *ts1_lab;
@property (nonatomic , strong) UIView *ts2_view;
@property (nonatomic , strong) UILabel *ts2_lab;

@property (nonatomic , strong) UIImageView *bottom_image;
@property (nonatomic , strong) UIView *bottom_view;
@property (nonatomic , strong) UIImageView *bottom_left_img;
@property (nonatomic , strong) UILabel *bottom_right_lab;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *CreditData;

@property (nonatomic , assign) BOOL isIndicator;

@end

@implementation ZDObr_eController


- (void)plasterCryptic{
    @weakify(self);
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/user/get/balance/fee" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            NSDictionary *data = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
            weak_self.ts1_lab.text = [NSString stringWithFormat:@"费率：%@（每一万元80元手续费）+%@元/次",@"0.80%",data[@"fee"]];
            double amount = (0.0080 - [data[@"settle"] doubleValue]) * 10000;
            if (amount == 0) {
                weak_self.ts2_lab.text = @"升级V1即可享受，还款金额万分之8的现金";
            }else{
                weak_self.ts2_lab.text =[NSString stringWithFormat:@"每还款一笔，立返当前金额万分之%.0f的现金",amount];
            }
            
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}

- (UILabel *)bottom_right_lab{
    if (!_bottom_right_lab) {
        _bottom_right_lab = [UILabel new];
        _bottom_right_lab.text = @"添加信用卡";
        _bottom_right_lab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _bottom_right_lab.font = [UIFont getUIFontSize:18 IsBold:YES];
        _bottom_right_lab.textAlignment = NSTextAlignmentCenter;
    }
    return _bottom_right_lab;
}

#pragma 获取余额还款首页费率

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}


#pragma 获取信用卡还款计划

- (UIView *)bottom_view{
    if (!_bottom_view) {
        _bottom_view = [UIView new];
    }
    return _bottom_view;
}


#pragma mark - UITableViewDelegate UITableViewDataSource

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
        
        
        @weakify(self);
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weak_self rancorousNumismaticRetardNorm];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weak_self rancorousNumismaticRetardNorm];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"余额还款";
    
    self.isIndicator = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rancorousNumismaticRetardNorm) name:@"RefreshTable" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rancorousNumismaticRetardNorm) name:@"RefreshCardTable" object:nil];
    [self planetDelegate];
    [self rancorousNumismaticRetardNorm];
    [self plasterCryptic];
}

- (UIView *)top_view{
    if (!_top_view) {
        _top_view = [UIView new];
    }
    return _top_view;
}

- (void)rancorousNumismaticRetardNorm{
    @weakify(self);
    [self NetWorkingPostWithURL:self hiddenHUD:self.isIndicator url:@"/api/credit/get/balance/plan/list" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            weak_self.CreditData = [NSArray arrayWithArray:responseObject[@"data"]];
            [weak_self.tableView reloadData];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}
#pragma 无数据点击刷新

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self rancorousNumismaticRetardNorm];
    
}

- (UIImageView *)bottom_left_img{
    if (!_bottom_left_img) {
        _bottom_left_img = [UIImageView getUIImageView:@"plusResurrectMisconstrue"];
    }
    return _bottom_left_img;
}

- (void)tumblerCherryChangeableHull:(NSInteger)index{
    NSDictionary *dic = self.CreditData[index];
    HTTuctg_1GCController *VC = [HTTuctg_1GCController new];
    VC.cardData = dic;
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}


- (UIView *)ts1_view{
    if (!_ts1_view) {
        _ts1_view = [UIView new];
        _ts1_view.backgroundColor = [UIColor colorWithHexString:@"#FF8A00"];
        _ts1_view.layer.cornerRadius = 1.5;
    }
    return _ts1_view;
}


- (UIImageView *)bottom_image{
    if (!_bottom_image) {
        _bottom_image = [UIImageView getUIImageView:@"amendmentCaissonOvoid"];
        _bottom_image.userInteractionEnabled = YES;
        [_bottom_image bk_whenTapped:^{
            [self.xp_rootNavigationController pushViewController:[VJFwoMliyr_pLqController new] animated:YES];
        }];
    }
    return _bottom_image;
}
#pragma 懒加载

- (UIView *)ts2_view{
    if (!_ts2_view) {
        _ts2_view = [UIView new];
        _ts2_view.backgroundColor = [UIColor colorWithHexString:@"#FF8A00"];
        _ts2_view.layer.cornerRadius = 1.5;
    }
    return _ts2_view;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.CreditData[indexPath.row];
    
    if ([[dic allKeys] containsObject:@"balancePlan"]) {
        
        ZPXXxocm_CController *VC = [ZPXXxocm_CController new];
        VC.cardData = dic;
        VC.planIDStr = dic[@"balancePlan"][@"id"];
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.CreditData.count;
}

- (UILabel *)ts1_lab{
    if (!_ts1_lab) {
        _ts1_lab = [UILabel new];
        _ts1_lab.text = @"费率：0.80%（每一万元80元手续费）+1元/次";
        _ts1_lab.textColor = [UIColor colorWithHexString:@"#999999"];
        _ts1_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _ts1_lab;
}

- (void)planetDelegate{
    [self.view addSubview:self.top_view];
    [self.top_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.offset(15);
        make.height.offset(64);
    }];
    self.top_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.top_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.top_view.layer.shadowOpacity = 0.2;
    self.top_view.layer.shadowRadius = 3;
    self.top_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.top_view.layer.cornerRadius = 10;
    
    
    [self.top_view addSubview:self.ts1_lab];
    [self.ts1_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(32);
        make.right.offset(-10);
        make.top.offset(10);
        make.height.offset(17);
    }];
    [self.top_view addSubview:self.ts1_view];
    [self.ts1_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(3, 3));
        make.left.offset(22.5);
        make.centerY.equalTo(self.ts1_lab);
    }];
    
    [self.top_view addSubview:self.ts2_lab];
    [self.ts2_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(32);
        make.right.offset(-10);
        make.bottom.offset(-10);
        make.height.offset(17);
    }];
    [self.top_view addSubview:self.ts2_view];
    [self.ts2_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(3, 3));
        make.left.offset(22.5);
        make.centerY.equalTo(self.ts2_lab);
    }];
    
    [self.view addSubview:self.bottom_image];
    [self.bottom_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 46));
        make.left.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
    [self.view addSubview:self.bottom_view];
    [self.bottom_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bottom_image);
    }];
    
    [self.bottom_view addSubview:self.bottom_left_img];
    [self.bottom_left_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottom_view);
        make.left.offset(10);
    }];
    [self.bottom_view addSubview:self.bottom_right_lab];
    [self.bottom_right_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottom_view);
        make.left.equalTo(self.bottom_left_img.mas_right).offset(10);
        make.right.offset(-10);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
        make.top.equalTo(self.top_view.mas_bottom).offset(10);
        make.bottom.equalTo(self.bottom_image.mas_top).offset(0);
    }];
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    self.isIndicator = YES;
}

- (UILabel *)ts2_lab{
    if (!_ts2_lab) {
        _ts2_lab = [UILabel new];
        _ts2_lab.text = @"每还款一笔，立返当前金额千分之一的现金";
        _ts2_lab.textColor = [UIColor colorWithHexString:@"#999999"];
        _ts2_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _ts2_lab;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 136;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *Identifier = @"INZcy_MHFCell";
    INZcy_MHFCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"INZcy_MHFCell" owner:nil options:nil] lastObject];
    }
    
    NSDictionary *dic = self.CreditData[indexPath.row];
    
    cell.title_lab.text = [NSString stringWithFormat:@"%@(%@)",dic[@"bankName"],getAfterFour([dic[@"cardNo"] stringValue])];
    
    cell.yinhang_image.image = [UIImage imageNamed:getBankLogo(dic[@"bankAcronym"])];
    
    cell.content_lab.text = [NSString stringWithFormat:@"账单日 每月%@日丨还款日 每月%@日",dic[@"billDay"],dic[@"repaymentDay"]];
    
    
    
    NSDictionary *balancePlan = dic[@"balancePlan"];
    
    if ([[dic allKeys] containsObject:@"balancePlan"]) {
        cell.bg_image.image = [UIImage imageNamed:@"excitabilityNonviableAntipathy"];
        cell.jihua_lab.text = [NSString stringWithFormat:@"计划执行中，已还款%@元",balancePlan[@"repaymentedAmount"]];
        
        cell.zhiding_jihua_lab.text = @"计划详情";
        
        cell.zhiding_jihua_lab.userInteractionEnabled = NO;
        
        double pro = [balancePlan[@"repaymentedAmount"] doubleValue] / [balancePlan[@"taskAmount"] doubleValue];
        
        cell.progress = [[NSString stringWithFormat:@"%.2f",pro] doubleValue];
        
    }
    else{
        cell.progress = 10000.0f;
        cell.zhiding_jihua_lab.text = @"制定计划";
        cell.zhiding_jihua_lab.userInteractionEnabled = YES;
        cell.jihua_lab.text = @"请及时设置本月还款计划";
        if (indexPath.row%2 == 0) {
            cell.bg_image.image = [UIImage imageNamed:@"foulNostrumAlternation"];
        }
        else{
            cell.bg_image.image = [UIImage imageNamed:@"thiefBolted"];
        }
    }
    
    [cell.lishi_lab bk_whenTapped:^{
        [self tumblerCherryChangeableHull:indexPath.row];
    }];
    
    [cell.zhiding_jihua_lab bk_whenTapped:^{
        [self notorietyApplication:indexPath.row];
    }];
    
    
    return cell;
}

- (void)notorietyApplication:(NSInteger)index{
    NSDictionary *dic = self.CreditData[index];
    VCvSoj_RqController *VC = [VCvSoj_RqController new];
    VC.cardData = [NSMutableDictionary dictionaryWithDictionary:dic];
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}



@end
