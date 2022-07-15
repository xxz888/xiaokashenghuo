
#import "YZBJyrUhd_EController.h"
#import "PQrTrasf_XCCell.h"

@interface YZBJyrUhd_EController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataArr;
@property (nonatomic , strong) NSArray *array;
@end

@implementation YZBJyrUhd_EController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收藏";
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArr = [NSMutableArray array];
    
    [self helpfulBringRelaxationBeam];
    [self symmetryHarbinger];
}


#pragma 我的收藏列表

- (void)loadData:(NSString *)tao_id{
    @weakify(self);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:tao_id forKey:@"tao_id"];

    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/shop/api/getGood/tid" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"status"] intValue] == 200) {
            [weak_self.dataArr addObject:[responseObject[@"content"] firstObject]];
            [self.tableView reloadData];
        }else if ([responseObject[@"status"] intValue] == 301){
            [ZIONf_d showBottomWithText:responseObject[@"content"]];
            [self.xp_rootNavigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}
#pragma 商品详情

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *goodsDic = self.dataArr[indexPath.row];
    
    BCiynw_PIController *VC = [BCiynw_PIController new];

    VC.tao_id = goodsDic[@"tao_id"];
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
    
}



- (void)helpfulBringRelaxationBeam{

    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    [self.tableView reloadData];
    
    
}


#pragma mark - UITableViewDelegate UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"PQrTrasf_XCCell";
    PQrTrasf_XCCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"PQrTrasf_XCCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *goodsDic = self.dataArr[indexPath.row];
    
    [cell.min_icon sd_setImageWithURL:goodsDic[@"shopIcon"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    [cell.max_icon sd_setImageWithURL:goodsDic[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    cell.title_lab.text = goodsDic[@"shop_title"];
    cell.name_lab.text = goodsDic[@"title"];
    cell.price_lab.text = [NSString stringWithFormat:@"￥%@",goodsDic[@"size"]];
    
    [cell.clean_but bk_whenTapped:^{
        [self mesaBrush:indexPath.row];
    }];
    
    return cell;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}

- (void)symmetryHarbinger{
    NSDictionary *UserDic = [self loadUserData];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:UserDic[@"username"] forKey:@"phone"];

    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/getCollect" Params:params success:^(id  _Nonnull responseObject) {
        [self.dataArr removeAllObjects];
        if ([responseObject[@"code"] intValue] == 200) {
            self.array = [NSArray arrayWithArray:responseObject[@"data"]];
            for (int i = 0; i < self.array.count; i++) {
                NSDictionary *dic = self.array[i];
                [self loadData:dic[@"tao_id"]];
            }
            if (self.array.count == 0) {
                [self.tableView reloadData];
            }
        }
    } failure:^(NSString * _Nonnull error) {

    }];
}

- (void)mesaBrush:(NSInteger)index{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSDictionary *goodsDic = self.dataArr[index];
    for (NSDictionary *dic in self.array) {
        
        if ([dic[@"tao_id"] isEqualToString:goodsDic[@"tao_id"]]) {
            [params setObject:dic[@"id"] forKey:@"id"];
        }
    }

    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/dCollect" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 200) {
            [ZIONf_d showBottomWithText:@"删除成功"];
            
            [self symmetryHarbinger];
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
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _tableView;
}

#pragma 懒加载

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


@end
