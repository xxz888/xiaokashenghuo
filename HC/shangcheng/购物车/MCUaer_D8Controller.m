
#import "MCUaer_D8Controller.h"
#import "RAHAzn_7hTCell.h"
#import "UXOUagtuSskwp_npController.h"
@interface MCUaer_D8Controller ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , strong) UIView *bottom_view;
@property (nonatomic , strong) UILabel *left_lab;
@property (nonatomic , strong) UILabel *right_lab;

@property (nonatomic , strong) NSArray *array;

@property (nonatomic , strong) NSDictionary *buyDic;

@end

@implementation MCUaer_D8Controller


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.buyDic = self.dataArr[indexPath.row];
    self.left_lab.text = [NSString stringWithFormat:@"合计：￥%@",self.buyDic[@"size"]];
    [self.tableView reloadData];
    
}


- (UILabel *)left_lab{
    if (!_left_lab) {
        _left_lab = [UILabel getUILabelText:@"合计:0.00" TextColor:[UIColor colorWithHexString:@"#333333"] TextFont:[UIFont getUIFontSize:14 IsBold:NO] TextNumberOfLines:0];
        
    }
    return _left_lab;
}
- (void)去结算{
    
    if (self.buyDic.count > 0) {
        UXOUagtuSskwp_npController *VC = [UXOUagtuSskwp_npController new];
        VC.goodsDic = self.buyDic;
        VC.number = 1;
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
    }else{
        [ZIONf_d showBottomWithText:@"请选择需要结算的商品"];
    }
    
    
}
#pragma 我的收藏列表

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}
#pragma 商品详情

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArr = [NSMutableArray array];
    [self intendExemptEwe];
    
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
#pragma mark - UITableViewDelegate UITableViewDataSource

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

- (void)mischiefBemoanDistanceAntigen:(NSInteger)index{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSDictionary *goodsDic = self.dataArr[index];
    for (NSDictionary *dic in self.array) {
        
        if ([dic[@"tao_id"] isEqualToString:goodsDic[@"tao_id"]]) {
            [params setObject:dic[@"id"] forKey:@"id"];
        }
    }

    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/dShop" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 200) {
            [ZIONf_d showBottomWithText:@"删除成功"];
            
            [self gleamSilent];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
}

- (UILabel *)right_lab{
    if (!_right_lab) {
        _right_lab = [UILabel getUILabelText:@"去结算" TextColor:[UIColor colorWithHexString:@"#ffffff"] TextFont:[UIFont getUIFontSize:14 IsBold:NO] TextNumberOfLines:0];
        _right_lab.textAlignment = NSTextAlignmentCenter;
        _right_lab.ylCornerRadius = 16;
        _right_lab.backgroundColor = MainColor;
        _right_lab.userInteractionEnabled = YES;
        [_right_lab bk_whenTapped:^{
            [self 去结算];
        }];
    }
    return _right_lab;
}

- (void)gleamSilent{
    if (![self toLogin]) return;
    NSDictionary *UserDic = [self loadUserData];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:UserDic[@"username"] forKey:@"phone"];

    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/getShopping" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 200) {
            [self.dataArr removeAllObjects];
            self.array = [NSArray arrayWithArray:responseObject[@"data"]];
            for (int i = 0; i < self.array.count; i++) {
                NSDictionary *dic = self.array[i];
                [self loadData:dic[@"tao_id"]];
            }
            if (self.array.count == 0) {
                self.buyDic = nil;
                self.left_lab.text = @"合计：￥0.00";
                [self.tableView reloadData];
            }
        }
    } failure:^(NSString * _Nonnull error) {

    }];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"RAHAzn_7hTCell";
    RAHAzn_7hTCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"RAHAzn_7hTCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *goodsDic = self.dataArr[indexPath.row];

    [cell.min_icon sd_setImageWithURL:goodsDic[@"shopIcon"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    [cell.max_icon sd_setImageWithURL:goodsDic[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    cell.title_lab.text = goodsDic[@"shop_title"];
    cell.name_lab.text = goodsDic[@"title"];
    cell.price_lab.text = [NSString stringWithFormat:@"￥%@",goodsDic[@"size"]];
    
    [cell.clean_but bk_whenTapped:^{
        [self mischiefBemoanDistanceAntigen:indexPath.row];
    }];
    
    
    if(self.buyDic.count > 0){
        if ([self.buyDic[@"tao_id"] isEqualToString:goodsDic[@"tao_id"]]) {
            cell.select_icon.image = [UIImage imageNamed:@"valedictionDecelerate"];
        }else{
            cell.select_icon.image = [UIImage imageNamed:@"potentSidesplittingHive"];
        }
    }else{
        cell.select_icon.image = [UIImage imageNamed:@"potentSidesplittingHive"];
    }
    
    
    
    return cell;
}

#pragma 懒加载

- (void)intendExemptEwe{

    
    [self.view addSubview:self.bottom_view];
    [self.bottom_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.bottom.offset(-kTabBarHeight);
        make.height.offset(44);
    }];
    
    [self.bottom_view addSubview:self.right_lab];
    [self.right_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(32);
        make.centerY.equalTo(self.bottom_view);
        make.right.offset(-10);
        make.width.offset(70);
    }];
    
    [self.bottom_view addSubview:self.left_lab];
    [self.left_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(32);
        make.centerY.equalTo(self.bottom_view);
        make.right.equalTo(self.right_lab.mas_left).offset(-50);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.equalTo(self.bottom_view.mas_top).offset(0);
    }];
    [self.tableView reloadData];
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self gleamSilent];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UIView *)bottom_view{
    if (!_bottom_view) {
        _bottom_view = [UIView new];
        _bottom_view.backgroundColor = [UIColor colorWithHexString:@"F8F8F8"];
    }
    return _bottom_view;
}

@end
