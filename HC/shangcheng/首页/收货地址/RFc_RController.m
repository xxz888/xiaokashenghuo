
#import "RFc_RController.h"
#import "QDxm_oRCell.h"
#import "ABznbOqhmz_3Controller.h"
@interface RFc_RController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) UIButton *finishBtn;
@property (nonatomic , strong) NSMutableArray *dataArr;

@end

@implementation RFc_RController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self externalProgenitorPainstaking];
}



- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
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
        _tableView.showsVerticalScrollIndicator = NO;
        
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"收货地址";
    self.view.backgroundColor = [UIColor whiteColor];
    [self engageTheoreticalWidowerGratuitous];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)superimposeDisapprovalGuillotineReplace:(NSInteger)index{
    
    NSDictionary *dic = self.dataArr[index];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:dic[@"id"] forKey:@"id"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/dAddress" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 200) {
            [ZIONf_d showBottomWithText:@"删除成功"];
            [self externalProgenitorPainstaking];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
}

- (void)engageTheoreticalWidowerGratuitous{
    [self.view addSubview:self.finishBtn];
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 46));
        make.left.offset(15);
        make.bottom.offset(-15-KBottomHeight);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.equalTo(self.finishBtn.mas_top).offset(-15);
    }];
    [self.tableView reloadData];
    
    
}


- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"balloonOstentatious"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"添加地址" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont getUIFontSize:18 IsBold:YES];
        [_finishBtn bk_whenTapped:^{
            [self misperceiveComfortSlovenCompartment];
        }];
    }
    return _finishBtn;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"QDxm_oRCell";
    QDxm_oRCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"QDxm_oRCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *dic = self.dataArr[indexPath.row];
    
    cell.name.text = dic[@"name"];
    
    cell.phone.text = dic[@"userCall"];
    
    cell.content.text = dic[@"myAddress"];
    
    [cell.clean_but bk_whenTapped:^{
        [self superimposeDisapprovalGuillotineReplace:indexPath.row];
    }];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.block) {
        self.block(self.dataArr[indexPath.row]);
        [self.xp_rootNavigationController popViewControllerAnimated:YES];
    }
    
}

#pragma 懒加载

- (void)externalProgenitorPainstaking{
    
    NSDictionary *UserDic = [self loadUserData];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:UserDic[@"username"] forKey:@"phone"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/getMyAddress" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 200) {
            self.dataArr = [NSMutableArray arrayWithArray:responseObject[@"data"]];
            [self.tableView reloadData];
            
            
            if(self.dataArr.count == 0){
                NSNotification *LoseResponse = [NSNotification notificationWithName:@"addressType" object:nil];
                [[NSNotificationCenter defaultCenter] postNotification:LoseResponse];
            }
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}


- (void)misperceiveComfortSlovenCompartment{
    ABznbOqhmz_3Controller *VC = [ABznbOqhmz_3Controller new];
    
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}

@end
