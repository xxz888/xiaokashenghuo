
#import "DWPJrtbd_SController.h"
#import "DLbbry_HF1Cell.h"
#import "ULJZrxdd_ECell.h"
@interface DWPJrtbd_SController ()<UITextFieldDelegate,UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UIImageView *top_imageView;
@property (strong, nonatomic) UIView *navigation_View;
@property (nonatomic , strong) UITextField *textField;

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *searchTipsArr;

@property (nonatomic , strong) UICollectionView *collectionview;

@property (nonatomic , strong) NSMutableArray *dataHotArr;
@property (nonatomic , assign) int page;
@end

@implementation DWPJrtbd_SController


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [UIView new];
    UILabel *title = [UILabel getUILabelText:@"搜索推荐" TextColor:[UIColor blackColor] TextFont:[UIFont getUIFontSize:18 IsBold:YES] TextNumberOfLines:0];
    [headerView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(20);
        make.left.offset(12);
        if (section == 0) {
            make.bottom.offset(0);
        }else{
            make.centerY.equalTo(headerView);
        }
    }];
    if (section == 0) {
        title.text = @"热门搜索";
    }
    return headerView;
}

#pragma 搜索

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView == self.tableView) {
    CGFloat sectionHeaderHeight = 52;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
     }
    }
}

#pragma textField

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self loadData];
    [textField resignFirstResponder];
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 36;
    }
    return 52;
}
#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)propellentHemostatDedicationBarrier{
    
    
    
    [self.view addSubview:self.top_imageView];
    [self.top_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, kTopHeight));
        make.top.right.left.offset(0);
    }];
    
    [self.view addSubview:self.navigation_View];
    [self.navigation_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 44));
        make.top.equalTo(self.top_imageView.mas_top).offset(kStatusBarHeight);
        make.left.equalTo(self.view);
    }];
    CGFloat navHeight = 5;
    CGFloat leftViewHeight = 30;
    if(kStatusBarHeight > 20){
        navHeight = 0;
        leftViewHeight = 34;
    }
    UIView *leftView = [UIView new];
    leftView.ylCornerRadius = leftViewHeight / 2;
    leftView.backgroundColor = [UIColor whiteColor];
    [self.navigation_View addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH - 36 - 20 - 12, leftViewHeight));
        make.top.offset(navHeight);
        make.left.offset(12);
    }];
    
    UIImageView *leftImage = [UIImageView getUIImageView:@"angleEarthyCostly"];
    [leftView addSubview:leftImage];
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(leftView);
        make.left.offset(10);
    }];
    
    self.textField = [UITextField new];
    self.textField.font = [UIFont getUIFontSize:16 IsBold:NO];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"大家都在搜：鞋子" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"],NSFontAttributeName:self.textField.font}];
    self.textField.attributedPlaceholder = attrString;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.delegate = self;
    [leftView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(leftView);
        make.left.equalTo(leftImage.mas_right).offset(10);
        make.right.offset(-10);
    }];
    
    UILabel *cancel = [UILabel getUILabelText:@"取消" TextColor:[UIColor whiteColor] TextFont:[UIFont getUIFontSize:16 IsBold:YES] TextNumberOfLines:0];
    cancel.textAlignment = NSTextAlignmentCenter;
    cancel.userInteractionEnabled = YES;
    [cancel bk_whenTapped:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.navigation_View addSubview:cancel];
    [cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(leftView);
        make.right.offset(-12);
    }];
    
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigation_View.mas_bottom).offset(0);
        make.bottom.offset(-KBottomHeight);
        make.left.right.equalTo(self.view);
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString *Identifier = @"DLbbry_HF1Cell";
        DLbbry_HF1Cell *cell = [[DLbbry_HF1Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setDataArr:self.searchTipsArr];
        
        cell.block = ^(NSString * _Nonnull strName) {
            [self.textField resignFirstResponder];
            
            self.textField.text = strName;
            [self loadData];
        };
        return cell;
    }
    else{
       
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [cell.contentView addSubview:self.collectionview];
        [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(DEVICE_WIDTH);
            make.height.offset(10 * 220 + 55);
            make.top.offset(0);
            make.left.offset(0);
            make.bottom.offset(0);
        }];
        
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = self.dataHotArr[indexPath.row];
    
    BCiynw_PIController *VC = [BCiynw_PIController new];
    
    VC.tao_id = data[@"tao_id"];
    
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.searchTipsArr = [NSMutableArray arrayWithObjects:@"圣诞节礼物",@"苹果",@"玩偶",@"礼物",@"年货",@"坚果",@"项链", nil];
    
    self.page = 1;
    [self propellentHemostatDedicationBarrier];
    
    [self.textField becomeFirstResponder];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


#pragma mark - UICollectionViewDataSource

- (UIView *)navigation_View{
    if (!_navigation_View) {
        _navigation_View = [UIView new];
    }
    return _navigation_View;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 100;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0;
        }
    }
    return _tableView;
}


#pragma mark - UICollectionViewDelegate

- (UICollectionView *)collectionview{
    if (!_collectionview) {
        
        CGFloat W = (DEVICE_WIDTH - 15) / 2;
        
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.itemSize = CGSizeMake(W,220);
        
        _collectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionview.backgroundColor = [UIColor whiteColor];
        _collectionview.showsVerticalScrollIndicator = NO;
        
        [self.collectionview registerNib:[UINib nibWithNibName:@"ULJZrxdd_ECell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        _collectionview.scrollEnabled = NO;
        
        @weakify(self);
        _collectionview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            weak_self.page = 1;
            [weak_self loadData];
            [weak_self.collectionview.mj_header endRefreshing];
           }];
        _collectionview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            weak_self.page ++;
            [weak_self loadData];
            [weak_self.collectionview.mj_footer endRefreshing];
        }];
    }
    return _collectionview;
}


#pragma 懒加载

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


- (UIImageView *)top_imageView{
    if (!_top_imageView) {
        _top_imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"designationBasinFlexible"]];
    }
    return _top_imageView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cell";
    ULJZrxdd_ECell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    
    NSDictionary *data = self.dataHotArr[indexPath.row];
    
    [cell.top_image sd_setImageWithURL:data[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    
    cell.title_lab.text = data[@"title"];
    
    
    NSString *priceStr = [NSString stringWithFormat:@"¥%@",data[@"size"]];
    
    NSString *salesStr = [NSString stringWithFormat:@"%@",data[@"volume"]];
    
    cell.content_lab.attributedText =  [UILabel setupAttributeString:[NSString stringWithFormat:@"%@ %@人付款",priceStr,salesStr] rangeText:priceStr textColor:[UIColor colorWithHexString:@"#FF8100"] textFont:[UIFont getUIFontSize:18 IsBold:NO]];
    
   
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataHotArr.count;
}


- (void)loadData{
    if (self.textField.text.length > 0) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:@(self.page) forKey:@"page"];
        [params setObject:@"14" forKey:@"page_size"];
        [params setObject:self.textField.text forKey:@"q"];
        @weakify(self);
        [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/api/getGood/search" Params:params success:^(id  _Nonnull responseObject) {
            if ([responseObject[@"status"] intValue] == 200) {
                NSArray *array = responseObject[@"content"];
                if (weak_self.page == 1) {
                    weak_self.dataHotArr = [NSMutableArray arrayWithArray:array];
                    [self.collectionview.mj_footer endRefreshing];
                }else {
                    
                    if (![array count]) {
                        [self.collectionview.mj_footer endRefreshingWithNoMoreData];
                    }
                    [weak_self.dataHotArr addObjectsFromArray:array];
                }
                [self.collectionview reloadData];
            }
        } failure:^(NSString * _Nonnull error) {

        }];
    }
}

@end
