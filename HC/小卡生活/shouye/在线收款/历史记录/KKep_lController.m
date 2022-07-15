
#import "KKep_lController.h"
#import "MBZcz_L1Cell.h"
#import "JOue_PFController.h"
@interface KKep_lController ()<UITableViewDelegate, UITableViewDataSource ,DZNEmptyDataSetSource ,DZNEmptyDataSetDelegate>{
    NSInteger currentPage;
}

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *HistoryDataArr;

@end

@implementation KKep_lController


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JOue_PFController *VC = [JOue_PFController new];
    
    VC.orderID = self.HistoryDataArr[indexPath.row][@"id"];
    
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}

#pragma 获取历史记录列表

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"MBZcz_L1Cell";
    MBZcz_L1Cell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"MBZcz_L1Cell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *dic = self.HistoryDataArr[indexPath.row];

    cell.icon_image.image = [UIImage imageNamed:getBankLogo(dic[@"bankAcronym"])];

    cell.title_lab.text = [NSString stringWithFormat:@"%@(%@)",dic[@"bankName"],getAfterFour([dic[@"bankCard"] stringValue])];

    cell.content_number_lab.text = [NSString stringWithFormat:@"%.2f%@+%@元",[dic[@"rate"] doubleValue]*100,@"%",dic[@"fee"]];

    cell.number_lab.text = [NSString stringWithFormat:@"%.2f",[dic[@"realAmount"] doubleValue]];

    
    if ([dic[@"orderStatus"] intValue] == 0) {
        cell.type_lab.text = @"交易中";
    }else if([dic[@"orderStatus"] intValue] == 1){
        cell.type_lab.text = @"已成功";
    }else if([dic[@"orderStatus"] intValue] == 2){
        cell.type_lab.text = @"已失败";
    }
    
    return cell;
}



#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"交易记录";
    currentPage = 1;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
    
    [self confessArrear];
    
}

- (void)confessArrear{
    @weakify(self);
    
    NSMutableDictionary *paramsData = [NSMutableDictionary dictionary];
    [paramsData setValue:[NSString stringWithFormat:@"%li",currentPage] forKey:@"currentPage"];
    [paramsData setValue:@"20" forKey:@"pageSize"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/payment/quick/order/list" Params:paramsData success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            NSArray *array = [NSMutableArray arrayWithArray:responseObject[@"data"]];
            if (self->currentPage == 1) {
                weak_self.HistoryDataArr = [NSMutableArray arrayWithArray:array];
                [self.tableView.mj_footer endRefreshing];
            }else {
                
                if (![array count]) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                [weak_self.HistoryDataArr addObjectsFromArray:array];
            }
            
            [weak_self.tableView reloadData];
            
            if (weak_self.HistoryDataArr.count == 0) {
                [ZIONf_d showBottomWithText:@"暂无交易记录"];
            }
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
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
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.showsVerticalScrollIndicator = NO;
        
        @weakify(self);
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self->currentPage = 1;
            [weak_self confessArrear];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self->currentPage ++;
            [weak_self confessArrear];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}
#pragma 无数据点击刷新

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.HistoryDataArr.count;
}
#pragma 懒加载

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self confessArrear];
}

@end
