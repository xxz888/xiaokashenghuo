
#import "HTTuctg_1GCController.h"
#import "JMLZu_efICell.h"
#import "ZPXXxocm_CController.h"
@interface HTTuctg_1GCController ()<UITableViewDelegate, UITableViewDataSource , DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSArray *CreditData;
@end

@implementation HTTuctg_1GCController


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"JMLZu_efICell";
    JMLZu_efICell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"JMLZu_efICell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.name_lab.text = [NSString stringWithFormat:@"%@(%@)",self.cardData[@"bankName"],getAfterFour([self.cardData[@"cardNo"] stringValue])];
    
    cell.log_image.image = [UIImage imageNamed:getBankLogo(self.cardData[@"bankAcronym"])];
    
    NSDictionary *dic = self.CreditData[indexPath.row];
    if ([dic[@"status"] intValue] == 1) {
        cell.type_lab.text = @"新建";
    }
    else if([dic[@"status"] intValue] == 2){
        cell.type_lab.text = @"执行中";
        cell.type_lab.textColor = [UIColor colorWithHexString:@"#1A1A4B"];
    }
    else if([dic[@"status"] intValue] == 3){
        cell.type_lab.text = @"已完成";
        cell.type_lab.textColor = [UIColor colorWithHexString:@"#209E2F"];
    }
    else if([dic[@"status"] intValue] == 4){
        cell.type_lab.text = @"还款失败";
        cell.type_lab.textColor = [UIColor redColor];
    }
    else if([dic[@"status"] intValue] == 5){
        cell.type_lab.text = @"取消中";
        cell.type_lab.textColor = [UIColor redColor];
    }
    else if([dic[@"status"] intValue] == 6){
        cell.type_lab.text = @"已取消";
        cell.type_lab.textColor = [UIColor colorWithHexString:@"#2741AD"];
    }
    else if([dic[@"status"] intValue] == 7){
        cell.type_lab.text = @"取消失败";
        cell.type_lab.textColor = [UIColor redColor];
    }
    else if([dic[@"status"] intValue] == 8){
        cell.type_lab.text = @"执行完成";
        cell.type_lab.textColor = [UIColor colorWithHexString:@"#209E2F"];
    }
    
    cell.bishu_lab.text = [NSString stringWithFormat:@"%@笔",dic[@"completedCount"]];
    
    cell.zd_amount_lab.text = [NSString stringWithFormat:@"%@",dic[@"taskAmount"]];
    
    double should = [dic[@"taskAmount"] doubleValue] - [dic[@"repaymentedAmount"] doubleValue];
    cell.sy_ShouldAlso_lab.text = should < 0 ? @"0" : [[NSString stringWithFormat:@"%f",should] removeUnwantedZero];
    
    cell.time_lab.text = [NSString stringWithFormat:@"%@",dic[@"createTime"]];
    
    return cell;
}

#pragma 获取信用卡还款历史

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.CreditData.count;
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}

- (void)denoteOppositionSuperb{
    @weakify(self);
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:self.cardData[@"cardNo"] forKey:@"cardNo"];
    if (self.empowerToken.length > 0) {
        [params setObject:self.empowerToken forKey:@"empowerToken"];
    }
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit/get/all/plan" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            weak_self.CreditData = [NSArray arrayWithArray:responseObject[@"data"]];
            [weak_self.tableView reloadData];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
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
            [weak_self denoteOppositionSuperb];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weak_self denoteOppositionSuperb];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self denoteOppositionSuperb];
}
#pragma 无数据点击刷新

- (void)baronDecipher{
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
        make.top.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"历史记录";
    
    [self baronDecipher];
    
    [self denoteOppositionSuperb];
}
#pragma 懒加载

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = self.CreditData[indexPath.row];
    
    ZPXXxocm_CController *VC = [ZPXXxocm_CController new];
    VC.cardData = self.cardData;
    VC.planIDStr = [NSString stringWithFormat:@"%@",dic[@"id"]];
    VC.empowerToken = self.empowerToken;
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
    
}




@end
