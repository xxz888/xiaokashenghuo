
#import "JOue_PFController.h"
#import "ZAyPp_jhXCell.h"

@interface JOue_PFController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@property (strong, nonatomic)  UIImageView *top_image;
@property (strong, nonatomic)  UIView *navigation_View;
@property (strong, nonatomic)  UIButton *nav_back;
@property (strong, nonatomic)  UILabel *nav_title;
@property (strong, nonatomic)  BEwdca_WView *tradingTypeView;

@property (strong, nonatomic)  NSMutableArray *dataArr;

@end

@implementation JOue_PFController


- (void)corralQualify{
    @weakify(self);
    
        [self NetWorkingPostWithURL:self hiddenHUD:NO url:[NSString stringWithFormat:@"/api/payment/quick/order/%@",self.orderID] Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            NSDictionary *data = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
            
            self.tradingTypeView.number_lab.text = [NSString stringWithFormat:@"¥%@",data[@"amount"]];
            if ([data[@"orderStatus"] intValue] == 0) {
                self.tradingTypeView.title_lab.text = @"交易中";
            } else if([data[@"orderStatus"] intValue] == 1){
                self.tradingTypeView.title_lab.text = @"已成功";
            }else if([data[@"orderStatus"] intValue] == 2){
                self.tradingTypeView.title_lab.text = @"已失败";
            }
            
            for (int i = 0; i < self.dataArr.count; i++) {
                DHSDpnz_x3 *model = self.dataArr[i];
                if ([model.name isEqualToString:@"信用卡"]) {
                    model.content = [NSString stringWithFormat:@"%@(%@)",data[@"bankName"],getAfterFour([data[@"bankCard"] stringValue])];
                    model.placeholder = data[@"bankAcronym"];
                }
                else if ([model.name isEqualToString:@"储蓄卡"]){
                    model.content = [NSString stringWithFormat:@"%@(%@)",data[@"debitBankName"],getAfterFour([data[@"debitBankCard"] stringValue])];
                    model.placeholder = data[@"debitBankAcronym"];
                }
                else if ([model.name isEqualToString:@"交易通道"]){
                    model.content = data[@"channelName"];
                }
                else if ([model.name isEqualToString:@"交易时间"]){
                    model.content = data[@"createTime"];
                }
                else if ([model.name isEqualToString:@"手续费"]){
                    model.content = data[@"charge"];
                }
                else if ([model.name isEqualToString:@"服务费"]){
                    model.content = data[@"fee"];
                }
                else if ([model.name isEqualToString:@"合计"]){
                    model.content = data[@"totalCost"];
                }
                else if ([model.name isEqualToString:@"到账金额"]){
                    model.content = [NSString stringWithFormat:@"%.2f",[data[@"realAmount"] doubleValue]];
                }
                else if ([model.name isEqualToString:@"订单号"]){
                    model.content = data[@"orderCode"];
                }
            }
            
            [weak_self.tableView reloadData];
            
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}

#pragma 获取历史详情

- (UIView *)navigation_View{
    if (!_navigation_View) {
        _navigation_View = [UIView new];
    }
    return _navigation_View;
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)backAction{
    [self.xp_rootNavigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}

- (UIButton *)nav_back{
    if (!_nav_back) {
        _nav_back = [UIButton new];
        [_nav_back setImage:[UIImage imageNamed:@"nihilismSlur"] forState:UIControlStateNormal];
        [_nav_back addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [_nav_back setEnlargeEdgeWithTop:10 right:20 bottom:10 left:10];
    }
    return _nav_back;
}



- (UILabel *)nav_title{
    if (!_nav_title) {
        _nav_title = [UILabel new];
        _nav_title.text = @"交易详情";
        _nav_title.textColor = FontThemeColor;
        _nav_title.font = [UIFont boldSystemFontOfSize:18];
    }
    return _nav_title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
#pragma 懒加载

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.showsVerticalScrollIndicator = NO;
        
    }
    return _tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"ZAyPp_jhXCell";
    ZAyPp_jhXCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"ZAyPp_jhXCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    DHSDpnz_x3 *model = self.dataArr[indexPath.row];
    cell.title_lab.text = model.name;
    if (![model.name isEqualToString:@"分割线"]) {
        cell.content_lab.text = [NSString stringWithFormat:@"%@",model.content];
        [cell.line_view setHidden:YES];
        [cell.title_lab setHidden:NO];
        [cell.content_lab setHidden:NO];
    }else{
        [cell.title_lab setHidden:YES];
        [cell.content_lab setHidden:YES];
        [cell.line_view setHidden:NO];
    }
    
    
    if (indexPath.row == 1 || indexPath.row == 0) {
        [cell.icon_image setHidden:NO];
        cell.icon_image.image = [UIImage imageNamed:getBankLogo(model.placeholder)];
    }else{
        [cell.icon_image setHidden:YES];
    }
    
    
        
    
    return cell;
}

- (void)grimaceEncounterImmigrant{
    
    NSMutableArray *data = [NSMutableArray arrayWithObjects:@"信用卡",@"储蓄卡",@"分割线",@"交易通道",@"交易时间",@"分割线",@"手续费",@"服务费",@"合计",@"分割线",@"到账金额",@"订单号", nil];
    
    for (int i = 0; i < data.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data[i];
        [self.dataArr addObject:model];
    }
    

    [self.view addSubview:self.top_image];
    [self.top_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(161);
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
    
    self.tradingTypeView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BEwdca_WView class]) owner:nil options:nil] lastObject];
    [self.tradingTypeView.determine_btn setHidden:YES];
    [self.view addSubview:self.tradingTypeView];
    [self.tradingTypeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH - 15, 163));
        make.top.equalTo(self.navigation_View.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
    }];
    
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.tradingTypeView.mas_bottom).offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
}

- (UIImageView *)top_image{
    if (!_top_image) {
        _top_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"designationBasinFlexible"]];
        _top_image.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _top_image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArr = [NSMutableArray array];
    [self grimaceEncounterImmigrant];
    
    [self corralQualify];
}
@end
