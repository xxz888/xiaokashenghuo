
#import "BUtg_5Controller.h"

@interface BUtg_5Controller ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,RPTaggedNavViewDelegate>


@property (nonatomic, strong) HNWQdoe_hView * taggedNavView;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArr;

@end

@implementation BUtg_5Controller


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


#pragma mark -- taggedNavViewDelegate

- (void)clamorEndemicArmchair{

    
    self.taggedNavView = [[HNWQdoe_hView alloc]initWithFrame:CGRectMake(0, 1, DEVICE_WIDTH, 44)];
    self.taggedNavView.delegate = self;
    self.taggedNavView.dataArr = [NSArray arrayWithObjects:@"待支付",@"待发货",@"已发货",@"已完成", nil];
    self.taggedNavView.tagTextColor_normal = [UIColor colorWithHexString:@"999999"];
    self.taggedNavView.tagTextColor_selected = [UIColor colorWithHexString:@"#000000"];
    self.taggedNavView.tagTextFont_normal = 14;
    self.taggedNavView.tagTextFont_selected = 16;
    self.taggedNavView.sliderColor = [UIColor colorWithHexString:@"#000000"];
    self.taggedNavView.sliderW = 30;
    self.taggedNavView.sliderH = 2;
    [self.view addSubview:self.taggedNavView];
    [self.taggedNavView selectingOneTagWithIndex:self.index];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.right.offset(0);
        make.top.equalTo(self.taggedNavView.mas_bottom);
        make.bottom.offset(-KBottomHeight);
    }];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F0F2F5"];
    self.navigationItem.title = @"订单";
    [self clamorEndemicArmchair];
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
        _tableView.scrollEnabled = NO;
        
    }
    return _tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (void)haveSelectedIndex:(NSInteger)index{}

#pragma 懒加载

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}

@end
