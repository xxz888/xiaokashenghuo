
#import "ONalsGl_6GpController.h"
#import "GRHzYcp_lCell.h"
@interface ONalsGl_6GpController ()<RPTaggedNavViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) HNWQdoe_hView * taggedNavView;

@property (nonatomic , strong) UICollectionView *collectionview;
@property (nonatomic , assign) int page;

@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , assign) int tagged;

@end

@implementation ONalsGl_6GpController


- (void)footlightsEdict:(NSInteger)index{
    if (index == 0) {
        self.dataArr = [NSMutableArray arrayWithArray:[NSArray getRandomArrFrome:self.dataArr]];
    }
    else if (index == 1){
        [self setBubbleSortArray:self.dataArr FieldString:@"volume"];
    }
    else if (index == 2){
        [self setBubbleSortArray:self.dataArr FieldString:@"coupon_info_money"];
    }
    else if (index == 3){
        [self setBubbleSortArray:self.dataArr FieldString:@"size"];
    }
    self.tagged = (int)index;
    [self.collectionview reloadData];
}
#pragma 实时人气榜

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cell";
    GRHzYcp_lCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    NSDictionary *data = self.dataArr[indexPath.row];
    
    [cell.top_image sd_setImageWithURL:data[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    
    cell.title_lab.text = data[@"title"];
    
    cell.baoyou_lab.text = [NSString stringWithFormat:@"销量:%@+",data[@"volume"]];
    
    cell.xiaoliang_lab.text = [NSString stringWithFormat:@"%@",data[@"shop_dsr"]];
    
    cell.yuanjia_lab.text = [NSString stringWithFormat:@"￥%@",data[@"size"]];
    
    cell.vip_right_lab.text = [NSString stringWithFormat:@"￥%@",data[@"quanhou_jiage"]];
    
    
    return cell;
}

- (UICollectionView *)collectionview{
    if (!_collectionview) {
        
        CGFloat W = (DEVICE_WIDTH - 30) / 2;
        
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.itemSize = CGSizeMake(W,270);
        
        _collectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionview.backgroundColor = [UIColor whiteColor];
        _collectionview.showsVerticalScrollIndicator = NO;
        
        [self.collectionview registerNib:[UINib nibWithNibName:@"GRHzYcp_lCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
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
#pragma mark -- taggedNavViewDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F0F2F5"];
    self.page = 1;
    self.tagged = 0;
    [self lissomeNonconformity];
    [self loadData];
}


#pragma mark - UICollectionViewDataSource

- (void)lissomeNonconformity{

    
    self.taggedNavView = [[HNWQdoe_hView alloc]initWithFrame:CGRectMake(0, 1, DEVICE_WIDTH, 44)];
    self.taggedNavView.delegate = self;
    self.taggedNavView.dataArr = [NSArray arrayWithObjects:@"综合",@"销量",@"优惠",@"价格", nil];
    self.taggedNavView.tagTextColor_normal = [UIColor colorWithHexString:@"999999"];
    self.taggedNavView.tagTextColor_selected = [UIColor colorWithHexString:@"#000000"];
    self.taggedNavView.tagTextFont_normal = 14;
    self.taggedNavView.tagTextFont_selected = 16;
    self.taggedNavView.sliderColor = [UIColor colorWithHexString:@"#000000"];
    self.taggedNavView.sliderW = 30;
    self.taggedNavView.sliderH = 2;
    [self.view addSubview:self.taggedNavView];
    
    [self.view addSubview:self.collectionview];
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.top.equalTo(self.taggedNavView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left);
        make.bottom.offset(-KBottomHeight);
    }];
   
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}


#pragma mark - UICollectionViewDelegate

- (void)loadData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@(self.page) forKey:@"page"];
    [params setObject:@"14" forKey:@"page_size"];
    [params setObject:@(self.cid) forKey:@"cid"];
    @weakify(self);
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/api/getGood/popularity" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"status"] intValue] == 200) {
            NSArray *array = responseObject[@"content"];
            if (weak_self.page == 1) {
                weak_self.dataArr = [NSMutableArray arrayWithArray:array];
                [self.collectionview.mj_footer endRefreshing];
            }else {
                
                if (![array count]) {
                    [self.collectionview.mj_footer endRefreshingWithNoMoreData];
                }
                [weak_self.dataArr addObjectsFromArray:array];
            }
            if (self.tagged > 0) {
                [self footlightsEdict:self.tagged];
            }else{
                [self.collectionview reloadData];
            }
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}


#pragma 懒加载

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = self.dataArr[indexPath.row];
    
    BCiynw_PIController *VC = [BCiynw_PIController new];
    
    VC.tao_id = data[@"tao_id"];
    
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}

@end
