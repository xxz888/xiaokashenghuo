
#import "ORLDfxr_jController.h"
#import "IBDWss_dn9Cell.h"
#import "XJDBdwyzEqvlg_CbView.h"
@interface ORLDfxr_jController ()<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>{
    NSInteger ThisPage;
}

@property (strong, nonatomic) UIImageView *top_image;
@property (strong, nonatomic) UIView *navigation_View;
@property (strong, nonatomic) UIButton *nav_back;
@property (strong, nonatomic) UILabel *nav_title;

@property (strong, nonatomic) UILabel *DayRevenue_title_lab;
@property (strong, nonatomic) UILabel *DayRevenue_number_lab;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArray;


@end

@implementation ORLDfxr_jController


- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}

#pragma 请求管理分润列表数据

- (UIButton *)nav_back{
    if (!_nav_back) {
        _nav_back = [UIButton new];
        [_nav_back setImage:[UIImage imageNamed:@"nihilismSlur"] forState:UIControlStateNormal];
        [self.nav_back bk_whenTapped:^{
            [self.xp_rootNavigationController popViewControllerAnimated:YES];
        }];
        [_nav_back setEnlargeEdgeWithTop:10 right:20 bottom:10 left:10];
    }
    return _nav_back;
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (UIView *)navigation_View{
    if (!_navigation_View) {
        _navigation_View = [UIView new];
    }
    return _navigation_View;
}

- (void)especiallyGemstonePilferAskew{
    
    [self.view addSubview:self.top_image];
    [self.top_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(85 + kTopHeight);
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
    
    [self.view addSubview:self.DayRevenue_title_lab];
    [self.DayRevenue_title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.top.equalTo(self.navigation_View.mas_bottom).offset(30);
        make.left.offset(0);
    }];
    [self.view addSubview:self.DayRevenue_number_lab];
    [self.DayRevenue_number_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.top.equalTo(self.DayRevenue_title_lab.mas_bottom).offset(5);
        make.left.offset(0);
    }];

    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top_image.mas_bottom);
        make.bottom.offset(-KBottomHeight);
        make.left.right.offset(0);
    }];
    
    
    
    
}

- (void)deflectCatapultOutgoing{

    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSString stringWithFormat:@"%li",ThisPage] forKey:@"currentPage"];
    [dic setValue:@"20" forKey:@"pageSize"];

    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/get/manage/profit/list" Params:dic success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            NSArray * array = responseObject[@"data"][@"list"];
            
            self.DayRevenue_number_lab.text = [NSString stringWithFormat:@"%.2f",[responseObject[@"data"][@"manageTotalProfitAmount"] doubleValue]];
   
            
            if (self->ThisPage == 1) {
                self.dataArray = [NSMutableArray arrayWithArray:array];
                [self.tableView.mj_footer endRefreshing];
            }
            else {
                
                if (![responseObject[@"data"][@"list"] count]) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                [self.dataArray addObjectsFromArray:array];
            }
            [self.tableView reloadData];

        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    XJDBdwyzEqvlg_CbView *HeaderView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XJDBdwyzEqvlg_CbView class]) owner:nil options:nil] lastObject];
    return HeaderView;
}


- (UILabel *)nav_title{
    if (!_nav_title) {
        _nav_title = [UILabel new];
        _nav_title.text = @"管理奖分润";
        _nav_title.textColor = FontThemeColor;
        _nav_title.font = [UIFont getUIFontSize:20 IsBold:YES];
    }
    return _nav_title;
}
#pragma 无数据点击刷新

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self deflectCatapultOutgoing];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

#pragma 懒加载

- (UIImageView *)top_image{
    if (!_top_image) {
        _top_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"replenishProspects"]];
    }
    return _top_image;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 58;
}

- (UILabel *)DayRevenue_title_lab{
    if (!_DayRevenue_title_lab) {
        _DayRevenue_title_lab = [UILabel new];
        _DayRevenue_title_lab.text = @"累计金额(元)";
        _DayRevenue_title_lab.textColor = FontThemeColor;
        _DayRevenue_title_lab.font = [UIFont getUIFontSize:18 IsBold:YES];
        _DayRevenue_title_lab.textAlignment = NSTextAlignmentCenter;
    }
    return _DayRevenue_title_lab;
}

- (UILabel *)DayRevenue_number_lab{
    if (!_DayRevenue_number_lab) {
        _DayRevenue_number_lab = [UILabel new];
        _DayRevenue_number_lab.text = @"240.98";
        _DayRevenue_number_lab.textColor = FontThemeColor;
        _DayRevenue_number_lab.font = [UIFont getUIFontSize:18 IsBold:YES];
        _DayRevenue_number_lab.textAlignment = NSTextAlignmentCenter;
    }
    return _DayRevenue_number_lab;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"IBDWss_dn9Cell";
    IBDWss_dn9Cell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"IBDWss_dn9Cell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSDictionary *data = self.dataArray[indexPath.row];
    cell.time_lab.text = data[@"orderTime"];
    cell.name_lab.text = [cell.name_lab.text getNameEncryption:data[@"fullname"]];
    
    if ([data[@"vipLevel"] intValue] == 0) {
        cell.dengji_lab.text = @"普通";
    }else{
        cell.dengji_lab.text = [NSString stringWithFormat:@"V%@",data[@"vipLevel"]];
    }
    if ([data[@"balanceSameAmount"] stringValue].length > 0) {
        cell.huankuan_lab.text = [NSString stringWithFormat:@"%.2f",[data[@"balanceSameAmount"] doubleValue]];
    }else{
        cell.huankuan_lab.text = [NSString stringWithFormat:@"%.2f",[data[@"quickSameAmount"] doubleValue]];
    }
    
    cell.fenrun_lab.text = [NSString stringWithFormat:@"%.2f",[data[@"profitAmount"] doubleValue]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ThisPage = 1;
    [self especiallyGemstonePilferAskew];
    [self deflectCatapultOutgoing];
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
            self->ThisPage = 1;
            [weak_self deflectCatapultOutgoing];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self->ThisPage ++;
            [weak_self deflectCatapultOutgoing];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}

@end
