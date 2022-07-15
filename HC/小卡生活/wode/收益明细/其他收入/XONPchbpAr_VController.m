
#import "XONPchbpAr_VController.h"
#import "QVTJojBhhtn_CXCCell.h"
#import "ZCla_8View.h"
@interface XONPchbpAr_VController ()<UITableViewDelegate, UITableViewDataSource ,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (strong, nonatomic) UIImageView *top_image;
@property (strong, nonatomic) UIView *navigation_View;
@property (strong, nonatomic) UIButton *nav_back;
@property (strong, nonatomic) UILabel *nav_title;

@property (strong, nonatomic) UILabel *DayRevenue_title_lab;
@property (strong, nonatomic) UILabel *DayRevenue_number_lab;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation XONPchbpAr_VController


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZCla_8View *HeaderView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ZCla_8View class]) owner:nil options:nil] lastObject];
    HeaderView.type_lab.text = @"时间";
    HeaderView.yihuan_lab.text = @"类型";
    HeaderView.fanxian_lab.text = @"金额(元)";
    
    return HeaderView;
}


#pragma 请求其他收入列表数据

- (UIView *)navigation_View{
    if (!_navigation_View) {
        _navigation_View = [UIView new];
    }
    return _navigation_View;
}


#pragma mark - UITableViewDelegate UITableViewDataSource

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

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}

- (void)straitsEmollientInstrumentalistFever{
    
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self straitsEmollientInstrumentalistFever];
    [self accumulatePhilosopher];
}

- (void)accumulatePhilosopher{
    
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/get/other/profit/list" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            NSArray * array = responseObject[@"data"][@"list"];
            
            self.DayRevenue_number_lab.text = [NSString stringWithFormat:@"%.2f",[responseObject[@"data"][@"otherTotalProfitAmount"] doubleValue]];

            self.dataArray = [NSMutableArray arrayWithArray:array];
                
            [self.tableView reloadData];

        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
}
#pragma 无数据点击刷新

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self accumulatePhilosopher];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"QVTJojBhhtn_CXCCell";
    QVTJojBhhtn_CXCCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"QVTJojBhhtn_CXCCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSDictionary * data = self.dataArray[indexPath.row];
    cell.type_lab.text = data[@"orderTime"];
    cell.yihuan_lab.text = data[@"profitRemark"];;
    cell.fanxian_lab.text = [NSString stringWithFormat:@"%.2f",[data[@"profitAmount"] doubleValue]];
    
    cell.yihuan_lab.textColor = [UIColor colorWithHexString:@"#FF8100"];
    cell.fanxian_lab.textColor = [UIColor colorWithHexString:@"#FF8100"];
    
    return cell;
}

#pragma 懒加载

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UIImageView *)top_image{
    if (!_top_image) {
        _top_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"replenishProspects"]];
    }
    return _top_image;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UILabel *)nav_title{
    if (!_nav_title) {
        _nav_title = [UILabel new];
        _nav_title.text = @"其他收入";
        _nav_title.textColor = FontThemeColor;
        _nav_title.font = [UIFont getUIFontSize:20 IsBold:YES];
    }
    return _nav_title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 58;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
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

@end
