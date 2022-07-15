
#import "GAIkn_vController.h"
#import "SQg_BICell.h"
@interface GAIkn_vController ()<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UIImageView *bottom_image;
@property (nonatomic , strong) UIView *bottom_view;
@property (nonatomic , strong) UIImageView *bottom_left_img;
@property (nonatomic , strong) UILabel *bottom_right_lab;

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *CashCardArr;
@end

@implementation GAIkn_vController


- (void)solventOdiumFurbish{
    [self.xp_rootNavigationController pushViewController:[DCht_SXController new] animated:YES];
}
#pragma 请求储蓄卡列表数据

- (UIImageView *)bottom_image{
    if (!_bottom_image) {
        _bottom_image = [UIImageView getUIImageView:@"amendmentCaissonOvoid"];
        _bottom_image.userInteractionEnabled = YES;
        [_bottom_image bk_whenTapped:^{
            [self solventOdiumFurbish];
        }];
    }
    return _bottom_image;
}
#pragma 设置默认储蓄卡

- (void)familyCancer:(NSString *)cardID type:(NSString *)typeStr{
    
    UIAlertController *alterCon = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"是否%@？",typeStr]
                                                                      message:nil
                                                               preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OFF = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *ON = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if ([typeStr isEqualToString:@"删除"]) {
            [self selfConcentric:cardID];
        }else{
            [self equipConspicuousBricklayerSwill:cardID];
        }
    }];
    [alterCon addAction:OFF];
    [alterCon addAction:ON];
    [[UIViewController currentViewController] presentViewController:alterCon animated:YES completion:nil];
}
#pragma 删除储蓄卡

- (UIView *)bottom_view{
    if (!_bottom_view) {
        _bottom_view = [UIView new];
        _bottom_view.userInteractionEnabled = NO;
    }
    return _bottom_view;
}




#pragma mark - UITableViewDelegate UITableViewDataSource

- (UILabel *)bottom_right_lab{
    if (!_bottom_right_lab) {
        _bottom_right_lab = [UILabel new];
        _bottom_right_lab.text = @"添加储蓄卡";
        _bottom_right_lab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _bottom_right_lab.font = [UIFont getUIFontSize:18 IsBold:YES];
        _bottom_right_lab.textAlignment = NSTextAlignmentCenter;
    }
    return _bottom_right_lab;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"SQg_BICell";
    SQg_BICell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"SQg_BICell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary * diction = self.CashCardArr[indexPath.row];
    cell.icon_image.image = [UIImage imageNamed:getBankLogo([diction[@"bankAcronym"] lowercaseString])];
    cell.yinhang_lab.text = [NSString stringWithFormat:@"%@",diction[@"bankName"]];
    cell.weihao_lab.text = [NSString stringWithFormat:@"尾号：%@",getAfterFour([diction[@"cardNo"] stringValue])];
    cell.name_lab.text = [diction[@"fullname"] stringByReplacingCharactersInRange:NSMakeRange(1, 1) withString:@"*"];
    cell.right_lab.text = [diction[@"def"] intValue] == 0 ? @"设置默认卡" : @"默认卡";
    
    [cell.xiugai_btn bk_whenTapped:^{
        DZHKj_FController *vc = [DZHKj_FController new];
        vc.CardID = diction[@"id"];
        [self.xp_rootNavigationController pushViewController:vc animated:YES];
    }];
    [cell.right_lab bk_whenTapped:^{
        [self familyCancer:diction[@"id"] type:@"设置默认卡"];
    }];
    [cell.delete_btn bk_whenTapped:^{
        [self familyCancer:diction[@"id"] type:@"删除"];
    }];
    
    return cell;
}


- (void)franticPhonetic{
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/debit/card/list" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            self.CashCardArr = [NSMutableArray arrayWithArray:responseObject[@"data"]];
            [self.tableView reloadData];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.CashCardArr.count;
}
#pragma 无数据点击刷新

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.block) {
        [self.xp_rootNavigationController popViewControllerAnimated:YES];
        self.block(self.CashCardArr[indexPath.row]);
    }
    
}

- (void)selfConcentric:(NSString *)cardID{
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:[NSString stringWithFormat:@"/api/user/debit/card/delete/%@",cardID] Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
            [self franticPhonetic];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}


- (UIImageView *)bottom_left_img{
    if (!_bottom_left_img) {
        _bottom_left_img = [UIImageView getUIImageView:@"plusResurrectMisconstrue"];
    }
    return _bottom_left_img;
}

#pragma 懒加载

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self franticPhonetic];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"储蓄卡";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(franticPhonetic) name:@"RefreshCardTable" object:nil];
    [self alongHallmarkPrestigeSedition];
    [self franticPhonetic];
}

- (void)equipConspicuousBricklayerSwill:(NSString *)cardID{
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:[NSString stringWithFormat:@"/api/user/debit/card/change/def/%@",cardID] Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            [self franticPhonetic];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    

}


- (void)alongHallmarkPrestigeSedition{
    
    
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
        make.top.offset(0);
        make.bottom.equalTo(self.bottom_image.mas_top).offset(0);
    }];
    
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
            [self.CashCardArr removeAllObjects];
            [weak_self franticPhonetic];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.CashCardArr removeAllObjects];
            [weak_self franticPhonetic];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}

@end
