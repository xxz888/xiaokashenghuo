
#import "EIjkdKnerl_vowController.h"
#import "ULTTqJuku_qCell.h"
@interface EIjkdKnerl_vowController ()<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (strong, nonatomic)  UIImageView *top_image;
@property (strong, nonatomic)  UIView *navigation_View;
@property (strong, nonatomic)  UIButton *nav_back;
@property (strong, nonatomic)  UILabel *nav_title;
@property (strong, nonatomic)  UISegmentedControl *segment;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , assign) NSInteger page;
@property (nonatomic , strong) NSString *type;


@end

@implementation EIjkdKnerl_vowController


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        XPCupuzDxlbf_JController *VC = [XPCupuzDxlbf_JController new];
        VC.dataDic = self.dataArr[indexPath.row];
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
}

- (void)dolorousDetergentInferenceVicissitudinous{
    
    [self.view addSubview:self.top_image];
    [self.top_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(76 + kTopHeight);
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
    [self.nav_back bk_whenTapped:^{
        [self reckonExpositoryPlenty];
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
    
    
    _segment = [[UISegmentedControl alloc]initWithItems:@[@"个人消息",@"平台消息"]];
    _segment.selectedSegmentIndex = 0;
    [_segment addTarget:self action:@selector(segmentSelected:) forControlEvents:UIControlEventValueChanged];
    _segment.tintColor = [UIColor colorWithHexString:@"#F4CA99"];
    [_segment ensureiOS12Style];
    [self.view addSubview:self.segment];
    [self.segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 40));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.navigation_View.mas_bottom).offset(20);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
        make.top.equalTo(self.top_image.mas_bottom).offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"ULTTqJuku_qCell";
    ULTTqJuku_qCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"ULTTqJuku_qCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *data = self.dataArr[indexPath.row];
    cell.title_lab.text = data[@"title"];
    cell.time_lab.text = data[@"createTime"];
    
    cell.content_lab.text = [data[@"msg"] stringByReplacingOccurrencesOfString:@"&" withString:@"\n"];
    
    return cell;
}



#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)reckonExpositoryPlenty{
    [self.xp_rootNavigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.type = @"1";
    self.page = 1;
    [self dolorousDetergentInferenceVicissitudinous];
    [self profusionWatchBritish];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
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
            self.page = 1;
            [weak_self profusionWatchBritish];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.page ++;
            [weak_self profusionWatchBritish];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
        
    }
    return _tableView;
}
#pragma 无数据点击刷新

- (UIImageView *)top_image{
    if (!_top_image) {
        _top_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"replenishProspects"]];
        _top_image.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _top_image;
}


- (UIButton *)nav_back{
    if (!_nav_back) {
        _nav_back = [UIButton new];
        [_nav_back setImage:[UIImage imageNamed:@"nihilismSlur"] forState:UIControlStateNormal];
        [_nav_back addTarget:self action:@selector(reckonExpositoryPlenty) forControlEvents:UIControlEventTouchUpInside];
        [_nav_back setEnlargeEdgeWithTop:10 right:20 bottom:10 left:10];
    }
    return _nav_back;
}

- (UIView *)navigation_View{
    if (!_navigation_View) {
        _navigation_View = [UIView new];
    }
    return _navigation_View;
}
#pragma 懒加载

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(void)segmentSelected:(id)sender{
    UISegmentedControl* control = (UISegmentedControl*)sender;
    if (control.selectedSegmentIndex) {
        self.type = @"0";
    }else{
        self.type = @"1";
    }
    self.page = 1;
    [self profusionWatchBritish];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self profusionWatchBritish];
}

- (UILabel *)nav_title{
    if (!_nav_title) {
        _nav_title = [UILabel new];
        _nav_title.text = @"消息中心";
        _nav_title.textColor = FontThemeColor;
        _nav_title.font = [UIFont boldSystemFontOfSize:18];
    }
    return _nav_title;
}





- (void)profusionWatchBritish{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSString stringWithFormat:@"%li",self.page] forKey:@"currentPage"];
    [params setObject:@"12" forKey:@"pageSize"];
    [params setObject:self.type forKey:@"type"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/msg/get" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            NSArray * array = responseObject[@"data"];
            if (self.page == 1) {
                self.dataArr = [NSMutableArray arrayWithArray:array];
                [self.tableView.mj_footer endRefreshing];
            }
            else {
                
                if (![responseObject[@"data"] count]) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                [self.dataArr addObjectsFromArray:array];
            }
            [self.tableView reloadData];

        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}




@end
