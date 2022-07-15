
#import "UYRYeYrwuz_2Controller.h"
#import "BWDlBmi_CCell.h"
#import "RNtycrQl_HUController.h"
#import "IDoXkynm_6FController.h"
#import "NAHlInimc_TController.h"
@interface UYRYeYrwuz_2Controller ()<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UIView *search_view;
@property (nonatomic , strong) UIImageView *search_image;
@property (nonatomic , strong) UITextField *search_textfield;
@property (nonatomic , strong) UIButton *search_btn;

@property (nonatomic , strong) UIImageView *bottom_image;
@property (nonatomic , strong) UIView *bottom_view;
@property (nonatomic , strong) UIImageView *bottom_left_img;
@property (nonatomic , strong) UILabel *bottom_right_lab;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , assign) NSInteger page;


@property (nonatomic , strong) NSString *empowerToken;

@end

@implementation UYRYeYrwuz_2Controller


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"客户列表";
    self.view.backgroundColor = [UIColor whiteColor];
    self.page = 1;
    [self inquietudeIncandescence];
    [self motiveVariegated];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(motiveVariegated) name:@"RefreshCustomerTable" object:nil];
    
}
- (void)定时消除指示器{
     [self dismiss];
}
#pragma 添加客户

- (UILabel *)bottom_right_lab{
    if (!_bottom_right_lab) {
        _bottom_right_lab = [UILabel new];
        _bottom_right_lab.text = @"添加客户";
        _bottom_right_lab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _bottom_right_lab.font = [UIFont getUIFontSize:18 IsBold:YES];
        _bottom_right_lab.textAlignment = NSTextAlignmentCenter;
    }
    return _bottom_right_lab;
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
            [weak_self motiveVariegated];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.page ++;
            [weak_self motiveVariegated];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}
#pragma mark - UITableViewDelegate UITableViewDataSource

- (UIImageView *)bottom_left_img{
    if (!_bottom_left_img) {
        _bottom_left_img = [UIImageView getUIImageView:@"plusResurrectMisconstrue"];
    }
    return _bottom_left_img;
}

- (UIImageView *)bottom_image{
    if (!_bottom_image) {
        _bottom_image = [UIImageView getUIImageView:@"amendmentCaissonOvoid"];
        _bottom_image.userInteractionEnabled = YES;
        [_bottom_image bk_whenTapped:^{
            [self merchandiseTrainingEpistemology];
        }];
    }
    return _bottom_image;
}


- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = self.dataArr[indexPath.row];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:data[@"id"] forKey:@"userId"];
    
    [self NetWorkingPostWithAddressURL:self hiddenHUD:YES url:@"/api/user/empower/token" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            self.empowerToken = responseObject[@"data"];
            
            if ([data[@"selfLevel"] intValue] == 0) {
                NAHlInimc_TController *VC = [NAHlInimc_TController new];
                VC.empowerToken = self.empowerToken;
                [self.xp_rootNavigationController pushViewController:VC animated:YES];
            }else{
                
                NSMutableDictionary *params = [NSMutableDictionary dictionary];
                [params setObject:self.empowerToken forKey:@"empowerToken"];
                
                
                [self NetWorkingPostWithAddressURL:self hiddenHUD:YES url:@"/api/user/debit/list" Params:params success:^(id  _Nonnull responseObject) {
                    if ([responseObject[@"code"] intValue] == 0) {
                        
                        if([responseObject[@"data"] count] > 0){
                            RNtycrQl_HUController *VC = [RNtycrQl_HUController new];
                            VC.navigationItem.title = [NSString stringWithFormat:@"%@的卡包",[data[@"fullname"] getNamelength:data[@"fullname"]]];
                            VC.empowerToken = self.empowerToken;
                            VC.customer_idCard = data[@"idcard"];
                            VC.customer_Name = data[@"fullname"];
                            [self.xp_rootNavigationController pushViewController:VC animated:YES];
                        }else{
                            NAHlInimc_TController *VC = [NAHlInimc_TController new];
                            VC.empowerToken = self.empowerToken;
                            [self.xp_rootNavigationController pushViewController:VC animated:YES];
                        }
                    }else{
                        [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
                    }
                } failure:^(NSString * _Nonnull error) {
                    
                }];
            }

        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}



- (UIImageView *)search_image{
    if (!_search_image) {
        _search_image = [UIImageView getUIImageView:@"angleEarthyCostly"];
    }
    return _search_image;
}
#pragma 无数据点击刷新

- (void)oysterMoat:(NSInteger)index{
    
    NSDictionary *data = self.dataArr[index];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:data[@"id"] forKey:@"userId"];
    
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/user/empower/close" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            self.page = 1;
            [self motiveVariegated];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
    
}
#pragma 懒加载

- (UIView *)bottom_view{
    if (!_bottom_view) {
        _bottom_view = [UIView new];
        _bottom_view.userInteractionEnabled = NO;
    }
    return _bottom_view;
}






- (void)merchandiseTrainingEpistemology{
    
    IDoXkynm_6FController *VC = [IDoXkynm_6FController new];
    
    [self.navigationController pushViewController:VC animated:YES];
}

- (UIView *)search_view{
    if (!_search_view) {
        _search_view = [UIView new];
        [_search_view setViewTypeshadow];
    }
    return _search_view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"BWDlBmi_CCell";
    BWDlBmi_CCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"BWDlBmi_CCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *data = self.dataArr[indexPath.row];
    
    cell.zxjihua_lab.text = [NSString stringWithFormat:@"执行中的计划：%@",data[@"runAll"]];
    cell.yichangjihua_lab.text = [NSString stringWithFormat:@"异常计划：%@",data[@"failAll"]];
    
    cell.name_lab.text = [data[@"selfLevel"] intValue] == 0 ? @"未实名" : data[@"fullname"];
    cell.phone_lab.text = data[@"username"];
    
    [cell.clean_btn bk_whenTapped:^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您是否删除该客户？" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self oysterMoat:indexPath.row];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
    return cell;
}


- (UIButton *)search_btn{
    if (!_search_btn) {
        _search_btn = [UIButton new];
        [_search_btn setTitle:@"搜索" forState:UIControlStateNormal];
        [_search_btn setTitleColor:[UIColor colorWithHexString:@"#1A1A4B"] forState:UIControlStateNormal];
        _search_btn.titleLabel.font = [UIFont getUIFontSize:12 IsBold:NO];
        [_search_btn bk_whenTapped:^{
            [self.view endEditing:YES];
            [self motiveVariegated];
        }];
    }
    return _search_btn;
}


- (UITextField *)search_textfield{
    if (!_search_textfield) {
        _search_textfield = [UITextField new];
        _search_textfield.placeholder = @"输入名字、手机号查询";
        _search_textfield.font = [UIFont getUIFontSize:14 IsBold:NO];
    }
    return _search_textfield;
}

- (void)motiveVariegated{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:[NSString stringWithFormat:@"%li",self.page] forKey:@"page"];
    [params setObject:@"10" forKey:@"size"];
    [params setObject:self.search_textfield.text forKey:@"phone"];
    
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit/empower/list" Params:params success:^(id  _Nonnull responseObject) {
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
            
            [self performSelector:@selector(定时消除指示器) withObject:nil afterDelay:1.0];
            [self.tableView reloadData];

        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
    
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self motiveVariegated];
}

- (void)inquietudeIncandescence{
    
    
    [self.view addSubview:self.search_view];
    [self.search_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-20, 40));
        make.top.offset(10);
        make.left.offset(10);
    }];
    
    
    [self.search_view addSubview:self.search_image];
    [self.search_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(18, 18));
        make.centerY.equalTo(self.search_view);
        make.left.offset(10);
    }];
    
    [self.search_view addSubview:self.search_btn];
    [self.search_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 36));
        make.centerY.equalTo(self.search_view);
        make.right.offset(-10);
    }];
    
    [self.search_view addSubview:self.search_textfield];
    [self.search_textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(36);
        make.centerY.equalTo(self.search_view);
        make.left.equalTo(self.search_image.mas_right).offset(10);
        make.right.equalTo(self.search_btn.mas_left).offset(-10);
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
        make.left.equalTo(self.bottom_left_img.mas_right).offset(10);
        make.top.bottom.offset(0);
        make.right.offset(-10);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
        make.top.equalTo(self.search_view.mas_bottom).offset(10);
        make.bottom.equalTo(self.bottom_view.mas_top).offset(-10);
    }];
    
}

@end
