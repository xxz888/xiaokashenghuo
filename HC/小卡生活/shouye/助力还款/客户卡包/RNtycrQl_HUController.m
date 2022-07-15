
#import "RNtycrQl_HUController.h"
#import "INZcy_MHFCell.h"
@interface RNtycrQl_HUController ()<UITableViewDelegate, UITableViewDataSource , DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UIImageView *bottom_image;
@property (nonatomic , strong) UIView *bottom_view;
@property (nonatomic , strong) UIImageView *bottom_left_img;
@property (nonatomic , strong) UILabel *bottom_right_lab;
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *CreditData;

@end

@implementation RNtycrQl_HUController


-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self turpitudeFlickHorrificHack];
    
}

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
            [weak_self turpitudeFlickHorrificHack];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weak_self turpitudeFlickHorrificHack];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}
- (void)定时消除指示器{
     [self dismiss];
}
#pragma mark - UITableViewDelegate UITableViewDataSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(turpitudeFlickHorrificHack) name:@"RefreshCustomerCardTable" object:nil];
    
    [self opusCubismQualm];
    [self turpitudeFlickHorrificHack];
    
}

- (void)determineAssure{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.empowerToken forKey:@"empowerToken"];
    @weakify(self);
    [self NetWorkingPostWithAddressURL:self hiddenHUD:YES url:@"/api/user/debit/list" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {

            DZHKj_FController *VC = [DZHKj_FController new];
            VC.data = [responseObject[@"data"] firstObject];
            VC.empowerToken = weak_self.empowerToken;
            VC.customer_idCard = self.customer_idCard;
            [weak_self.xp_rootNavigationController pushViewController:VC animated:YES];
            
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
        [self.tableView reloadData];
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
    
    
    
    
}
#pragma 无数据点击刷新

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 136;
}
#pragma 删除信用卡

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _CreditData.count;
}

- (void)turpitudeFlickHorrificHack{
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.empowerToken forKey:@"empowerToken"];
    
    @weakify(self);
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit/get/balance/plan/list" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            weak_self.CreditData = [NSArray arrayWithArray:responseObject[@"data"]];
            [weak_self.tableView reloadData];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
        
        [self performSelector:@selector(定时消除指示器) withObject:nil afterDelay:1.0];
    } failure:^(NSString * _Nonnull error) {
        
    }];
}



- (void)virusOriginalityConcatenateIgnominy:(NSInteger)index{
    NSDictionary *dic = self.CreditData[index];
    VCvSoj_RqController *VC = [VCvSoj_RqController new];
    VC.cardData = [NSMutableDictionary dictionaryWithDictionary:dic];
    VC.empowerToken = self.empowerToken;
    VC.customer_Name = self.customer_Name;
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}



- (UIImageView *)bottom_image{
    if (!_bottom_image) {
        _bottom_image = [UIImageView getUIImageView:@"amendmentCaissonOvoid"];
        _bottom_image.userInteractionEnabled = YES;
        [_bottom_image bk_whenTapped:^{
            
            VJFwoMliyr_pLqController *VC = [VJFwoMliyr_pLqController new];
            VC.empowerToken = self.empowerToken;
            VC.customer_Name = self.customer_Name;
            [self.xp_rootNavigationController pushViewController:VC animated:YES];
        }];
    }
    return _bottom_image;
}

- (UIImageView *)bottom_left_img{
    if (!_bottom_left_img) {
        _bottom_left_img = [UIImageView getUIImageView:@"plusResurrectMisconstrue"];
    }
    return _bottom_left_img;
}

- (void)batteryNegligenceAristocrat:(NSInteger)index{
    
    NSString * cardID= self.CreditData[index][@"id"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.empowerToken forKey:@"empowerToken"];
    
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:[NSString stringWithFormat:@"/api/user/credit/card/delete/%@",cardID] Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
            [self turpitudeFlickHorrificHack];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
}
#pragma 懒加载

- (void)opusCubismQualm{
   
    UIButton *leftbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 20)];
    [leftbutton setTitleColor:FontThemeColor forState:UIControlStateNormal];
    [leftbutton setTitle:@"客户信息" forState:UIControlStateNormal];
    leftbutton.titleLabel.font = [UIFont getUIFontSize:14 IsBold:NO];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];

    self.navigationItem.rightBarButtonItem = rightitem;
    [leftbutton bk_whenTapped:^{
        [self determineAssure];
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
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.bottom_image.mas_top).offset(0);
    }];
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.CreditData[indexPath.row];
    
    if ([[dic allKeys] containsObject:@"balancePlan"]) {
        
        ZPXXxocm_CController *VC = [ZPXXxocm_CController new];
        VC.cardData = dic;
        VC.planIDStr = dic[@"balancePlan"][@"id"];
        VC.empowerToken = self.empowerToken;
        VC.customer_Name = self.customer_Name;
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
    }
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
        [self indicativePercussionistPioneering:indexPath.row];
    }];

    [cell.zhiding_jihua_lab bk_whenTapped:^{
        [self virusOriginalityConcatenateIgnominy:indexPath.row];
    }];

    [cell.delete_image setHidden:NO];
    [cell.delete_image bk_whenTapped:^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您是否删除该信用卡？" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self batteryNegligenceAristocrat:indexPath.row];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
    
    return cell;
}


- (UIView *)bottom_view{
    if (!_bottom_view) {
        _bottom_view = [UIView new];
    }
    return _bottom_view;
}

- (void)indicativePercussionistPioneering:(NSInteger)index{
    
    NSDictionary *dic = self.CreditData[index];
    HTTuctg_1GCController *VC = [HTTuctg_1GCController new];
    VC.cardData = dic;
    VC.empowerToken = self.empowerToken;
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
    
}



@end
