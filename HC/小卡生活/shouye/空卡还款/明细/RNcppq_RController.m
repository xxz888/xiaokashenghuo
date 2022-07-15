
#import "RNcppq_RController.h"
#import "DVGVatz_PCell.h"
@interface RNcppq_RController ()<UITableViewDelegate, UITableViewDataSource , DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *tableView;

@end

@implementation RNcppq_RController


- (void)plutocracyFor{
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
        make.top.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
    
}
#pragma 获取空卡明细

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self medianReactantBolt];
}
#pragma mark - UITableViewDelegate UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"DVGVatz_PCell";
    DVGVatz_PCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"DVGVatz_PCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    
    return cell;
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
            [weak_self medianReactantBolt];
            [weak_self.tableView.mj_header endRefreshing];
        }];
        
        _tableView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weak_self medianReactantBolt];
            [weak_self.tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"明细";
    self.view.backgroundColor = [UIColor whiteColor];
    [self plutocracyFor];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 63;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}
#pragma 无数据点击刷新

- (void)medianReactantBolt{
    @weakify(self);
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
#pragma 懒加载

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}


@end
