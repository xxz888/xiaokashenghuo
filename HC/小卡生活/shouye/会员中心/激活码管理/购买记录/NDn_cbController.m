
#import "NDn_cbController.h"

#import "DKBUvpgFisks_4pCell.h"
@interface NDn_cbController ()<UITableViewDelegate, UITableViewDataSource ,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , assign) NSInteger page;

@property (nonatomic , strong) NSMutableArray *dataArr;

@end

@implementation NDn_cbController


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
            [weak_self ascendPrimateBiosphereMason];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.page ++;
            [weak_self ascendPrimateBiosphereMason];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}

#pragma 获取激活码购买记录

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}



#pragma mark - UITableViewDelegate UITableViewDataSource

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self ascendPrimateBiosphereMason];
}

- (void)ascendPrimateBiosphereMason{
    @weakify(self);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"20" forKey:@"pageSize"];
    [dic setValue:[NSString stringWithFormat:@"%li",self.page] forKey:@"currentPage"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/key/get" Params:dic success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            NSArray * array = responseObject[@"data"];
            if (weak_self.page == 1) {
                weak_self.dataArr = [NSMutableArray arrayWithArray:array];
                [weak_self.tableView.mj_footer endRefreshing];
            }
            else {
                
                if (![responseObject[@"data"] count]) {
                    [weak_self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                [weak_self.dataArr addObjectsFromArray:array];
            }
            [weak_self.tableView reloadData];

        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"购买记录";
    self.page = 1;
    
    [self treatyInterval];
    [self ascendPrimateBiosphereMason];
}
#pragma 无数据点击刷新

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}



- (void)treatyInterval{

    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
        make.top.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
}

#pragma 懒加载

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *Identifier = @"DKBUvpgFisks_4pCell";
    DKBUvpgFisks_4pCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"DKBUvpgFisks_4pCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *dic = self.dataArr[indexPath.row];
    
    cell.quanyi_ma_lab.text = [NSString stringWithFormat:@"权益码：%@",dic[@"key"]];
    
    cell.number_lab.text = [NSString stringWithFormat:@"编号：%@",dic[@"id"]];
    
    cell.time_lab.text = dic[@"invalidTime"];
    
    return cell;
}

@end
