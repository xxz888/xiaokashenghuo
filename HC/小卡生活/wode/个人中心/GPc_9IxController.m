
#import "GPc_9IxController.h"
#import "BKYt_IHlCell.h"
#import "QGQZvf_iView.h"
#import "HWay_WVOController.h"
@interface GPc_9IxController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArr;

@end

@implementation GPc_9IxController


- (void)axialLiteratiSupervisor:(NSDictionary *)data{
    if (data.count == 0) {
        return;
    }
    
    for (int i = 0; i < self.dataArr.count; i++) {
        DHSDpnz_x3 *model = self.dataArr[i];
        
        if ([model.name isEqualToString:@"真实姓名"]) {
            model.content = data[@"fullname"];
        }
        else if ([model.name isEqualToString:@"昵 称"]){
            if (data[@"nick"]) {
                model.content = data[@"nick"];
            }else{
                model.content = @"暂无昵称";
            }
        }
        else if ([model.name isEqualToString:@"手机号"]){
            model.content = data[@"username"];
        }
        else if ([model.name isEqualToString:@"ID编号"]){
            model.content = @"暂无编号";
        }
        else if ([model.name isEqualToString:@"注册日期"]){
            model.content = data[@"createTime"];
        }
        else if ([model.name isEqualToString:@"实名状态"]){
            if([data[@"selfLevel"] intValue] == 0){
                model.content = @"未实名";
            }
            else{
                model.content = @"已实名";
            }
            
        }
    }
    
    
    if ([data[@"agent"] intValue] == 1) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = @"超级会员设置";
        model.content = @"";
        [self.dataArr addObject:model];
    }
    
    
    
    
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DHSDpnz_x3 *model = self.dataArr[indexPath.row];
    
    if ([model.name isEqualToString:@"昵 称"]) {
        
        @weakify(self);
        QGQZvf_iView *trading = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QGQZvf_iView class]) owner:nil options:nil] lastObject];
        trading.frame = CGRectMake(0, 0, DEVICE_WIDTH - 40, 320);
        
        trading.layer.cornerRadius = 8;
        
        LSTPopView *popView = [LSTPopView initWithCustomView:trading
                                                      popStyle:LSTPopStyleSpringFromTop
                                                  dismissStyle:LSTDismissStyleSmoothToTop];
        LSTPopViewWK(popView)
        [trading.btn bk_whenTapped:^{
            if (trading.textfield.text.length > 0 ) {
                [weak_self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/user/update/nick" Params:@{@"nick":trading.textfield.text} success:^(id  _Nonnull responseObject) {
                    if ([responseObject[@"code"] intValue] == 0) {
                        model.content = trading.textfield.text;
                        [weak_self.tableView reloadData];
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
    
    else if([model.name isEqualToString:@"超级会员设置"]){
        [self.xp_rootNavigationController pushViewController:[HWay_WVOController new] animated:YES];
    }
}
#pragma 添加个人资料

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"个人中心"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArr = [NSMutableArray array];
    [self repossessHerbaceousMountebank];
    [self thicknessTortureUnscrupulousness];
}


#pragma mark - UITableViewDelegate UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)thicknessTortureUnscrupulousness{
    
    
    NSDictionary *UserData = [self loadUserData];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:[NSString stringWithFormat:@"/api/user/get/%@",UserData[@"id"]] Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            
            [self updateUserData:responseObject[@"data"]];
            
            [self axialLiteratiSupervisor:responseObject[@"data"]];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"BKYt_IHlCell";
    BKYt_IHlCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"BKYt_IHlCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    DHSDpnz_x3 *model = self.dataArr[indexPath.row];
    if ([model.name isEqualToString:@"昵 称"] || [model.name isEqualToString:@"超级会员设置"]) {
        [cell.right_image setHidden:NO];
        [cell.content_lab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-26);
        }];
        [cell.right_image mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView);
            make.right.offset(-10);
        }];
        
    }else{
        [cell.right_image setHidden:YES];
        [cell.content_lab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-10);
        }];
    }
    
    
    cell.name_lab.text = model.name;
    if (model.content.length == 0) {
        cell.content_lab.text = model.name;
        cell.content_lab.textColor = [UIColor colorWithHexString:@"#999999"];
        
    }else{
        if ([model.content containsString:@"暂无"]) {
            cell.content_lab.textColor = [UIColor colorWithHexString:@"#999999"];
        }else{
            cell.content_lab.textColor = [UIColor blackColor];
        }
        if ([model.name isEqualToString:@"手机号"]){
            cell.content_lab.text = [NSString getSecrectStringWithPhoneNumber:model.content];
        }else{
            cell.content_lab.text = model.content;
        }
    }
    if([model.name isEqualToString:@"超级会员设置"]){
        cell.content_lab.text = @"";
    }
    
    return cell;
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
        _tableView.scrollEnabled = NO;
        
    }
    return _tableView;
}


- (void)repossessHerbaceousMountebank{
    
    NSArray *data = [NSMutableArray arrayWithObjects:@"真实姓名",@"昵 称",@"手机号",@"注册日期",@"实名状态", nil];
    for (int i = 0; i < data.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data[i];
        [self.dataArr addObject:model];
    }
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-KBottomHeight);
        make.left.top.right.offset(0);
    }];

}


#pragma 懒加载

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

@end
