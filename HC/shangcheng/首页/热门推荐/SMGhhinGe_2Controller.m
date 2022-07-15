
#import "SMGhhinGe_2Controller.h"

@interface SMGhhinGe_2Controller ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , assign) int page;

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *hotDataArr;

@property (nonatomic , strong) UICollectionView *collectionview;

@property (nonatomic , strong) NSMutableArray *dataHotArr;

@property (nonatomic , assign) int cid;

@end

@implementation SMGhhinGe_2Controller


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = self.dataHotArr[indexPath.row];
    
    BCiynw_PIController *VC = [BCiynw_PIController new];
    
    VC.tao_id = data[@"tao_id"];
    
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}
#pragma 热门推荐

- (void)loadData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@(self.page) forKey:@"page"];
    [params setObject:@"14" forKey:@"page_size"];
    [params setObject:@(self.cid) forKey:@"cid"];
    @weakify(self);
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/api/getGood/all" Params:params success:^(id  _Nonnull responseObject) {
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

#pragma mark - UICollectionViewDataSource

- (void)shovelPondIndustrializationMotor{
    [self.view addSubview:self.collectionview];
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.top.offset(0);
        make.left.equalTo(self.view.mas_left);
        make.bottom.offset(-KBottomHeight);
    }];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataHotArr.count;
}


#pragma mark - UICollectionViewDelegate

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

#pragma 懒加载

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"热门推荐";
    self.view.backgroundColor = [UIColor whiteColor];
    self.page = 1;
    self.cid = arc4random() % 14 + 1;
    
    [self shovelPondIndustrializationMotor];
    [self loadData];
}

@end
