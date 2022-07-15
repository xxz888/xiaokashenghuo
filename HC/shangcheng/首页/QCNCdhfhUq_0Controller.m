
#import "QCNCdhfhUq_0Controller.h"
#import "ULJZrxdd_ECell.h"
#import "ONalsGl_6GpController.h"
#import "USvtNu_iController.h"
#import "DWPJrtbd_SController.h"
#import "SMGhhinGe_2Controller.h"
#import "HPWCmz_QView.h"

@interface QCNCdhfhUq_0Controller ()<HCBarnerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong, nonatomic) UIScrollView *scrollView;

@property (nonatomic , strong) UIView *search_View;
@property (nonatomic , strong) UIView *search_content_view;
@property (nonatomic , strong) UIImageView *search_image;
@property (nonatomic , strong) UILabel *search_lab;

@property (nonatomic , strong) UIView *Barner_view;

@property (nonatomic , strong) UIImageView *Mall_image;
@property (nonatomic , strong) UILabel *Mall_lab;
@property (nonatomic , strong) UIView *line1;

@property (nonatomic , strong) NSArray *TitleArr;
@property (nonatomic , strong) UIView *Views;
@property (nonatomic , strong) UIView *line2;

@property (nonatomic , strong) UIView *hot_view;

@property (nonatomic , strong) UICollectionView *collectionview;

@property (nonatomic , strong) NSArray *dataHotArr;

@property (nonatomic , strong) NSArray *barnerData;

@end

@implementation QCNCdhfhUq_0Controller


- (void)gaffeMultifunctionHardenFight{
    
    self.TitleArr = [NSArray arrayWithObjects:
                     @{@"name":@"居家日用",@"image":@"mall_jiaju"},
                     @{@"name":@"箱包",@"image":@"implodePreternaturalEngaging"},
                     @{@"name":@"女装",@"image":@"mall_nvzhuang"},
                     @{@"name":@"男装",@"image":@"mall_nanzhuang"},
                     @{@"name":@"美妆",@"image":@"mall_meizhuang"},
                     @{@"name":@"配饰",@"image":@"mall_peishi"},
                     @{@"name":@"数码家电",@"image":@"disorientedMoraleDespair"},
                     @{@"name":@"更多",@"image":@"mall_more"}, nil];
    
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, DEVICE_HEIGHT));
        make.left.top.offset(0);
    }];
    
    [self.scrollView addSubview:self.search_View];
    [self.search_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-20, 36));
        make.top.left.offset(10);
    }];
    [self.search_View addSubview:self.search_content_view];
    [self.search_content_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.search_View);
    }];
    
    [self.search_content_view addSubview:self.search_image];
    [self.search_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.search_content_view);
        make.left.offset(0);
    }];
    [self.search_content_view addSubview:self.search_lab];
    [self.search_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.search_content_view);
        make.left.equalTo(self.search_image.mas_right).offset(5);
        make.right.equalTo(self.search_content_view.mas_right).offset(0);
    }];
    
    
    [self.scrollView addSubview:self.Barner_view];
    [self.Barner_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 160));
        make.top.equalTo(self.search_View.mas_bottom).offset(10);
        make.left.offset(0);
    }];
    
    [self.scrollView addSubview:self.Mall_image];
    [self.Mall_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Barner_view.mas_bottom).offset(10);
        make.left.offset(10);
        make.height.mas_equalTo(0);
    }];
    [self.scrollView addSubview:self.Mall_lab];
    [self.Mall_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.Mall_image);
        make.left.equalTo(self.Mall_image.mas_right).offset(5);
        make.height.mas_equalTo(0);
    }];
    [self.scrollView addSubview:self.line1];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 5));
        make.top.equalTo(self.Mall_image.mas_bottom).offset(10);
        make.left.offset(0);
    }];
    
    [self.scrollView addSubview:self.Views];
    [self.Views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.top.equalTo(self.line1.mas_bottom).offset(10);
        make.left.offset(0);
    }];
    [self.scrollView addSubview:self.line2];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 5));
        make.top.equalTo(self.Views.mas_bottom).offset(10);
        make.left.offset(0);
    }];
    
    [self.scrollView addSubview:self.hot_view];
    [self.hot_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 36));
        make.top.equalTo(self.line2.mas_bottom).offset(0);
        make.left.offset(0);
    }];
    
    [self.scrollView addSubview:self.collectionview];
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.height.offset(7 * 220 + 55);
        make.top.equalTo(self.hot_view.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left);
    }];
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    _scrollView.contentSize = CGSizeMake(DEVICE_WIDTH, CGRectGetMaxY(self.collectionview.frame) + kTopHeight + kTabBarHeight);
    
}

#pragma 热门推荐

- (UILabel *)Mall_lab{
    if (!_Mall_lab) {
        _Mall_lab = [UILabel new];
        _Mall_lab.text = @"购物从我开始，精彩由此不止。";
        _Mall_lab.font = [UIFont getUIFontSize:14 IsBold:NO];
        _Mall_lab.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _Mall_lab;
}
#pragma 获取barner图

- (UILabel *)search_lab{
    if (!_search_lab) {
        _search_lab = [UILabel new];
        _search_lab.text = @"关键字";
        _search_lab.font = [UIFont getUIFontSize:14 IsBold:NO];
        _search_lab.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _search_lab;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"商城";
    
    [self gaffeMultifunctionHardenFight];
    
    [self solidifyNasty:[[NSMutableArray alloc] initWithObjects:@"wasteAdmit", nil]];
    [self huntChestnut];
    [self loadData];
    
    [self toLogin];
    

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
 
    NSDictionary *data = self.dataHotArr[indexPath.row];

    BCiynw_PIController *VC = [BCiynw_PIController new];

    VC.tao_id = data[@"tao_id"];
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
    
    
}




- (void)huntChestnut{
    
    
    [self solidifyNasty:@[[UIImage imageNamed:@"wasteAdmit"]]];
    return;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"1" forKey:@"page"];
    [params setObject:@"5" forKey:@"page_size"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/shop/api/getGood/banner" Params:params success:^(id  _Nonnull responseObject) {
        NSMutableArray *barnerArr = [NSMutableArray array];
        if ([responseObject[@"status"] intValue] == 200) {
            self.barnerData = [NSArray arrayWithArray:responseObject[@"content"]];
            if (self.barnerData.count > 0) {
                for (int i = 0; i < self.barnerData.count; i++) {
                    [barnerArr addObject:self.barnerData[i][@"pic"]];
                }
            }
            [self solidifyNasty:barnerArr];
        }
    } failure:^(NSString * _Nonnull error) {
            
    }];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataHotArr.count;
}


#pragma mark - UICollectionViewDataSource

- (UIView *)hot_view{
    if (!_hot_view) {
        _hot_view = [UIView new];
        
        UILabel *title = [UILabel getUILabelText:@"热门推荐" TextColor:[UIColor blackColor] TextFont:[UIFont getUIFontSize:18 IsBold:YES] TextNumberOfLines:0];
        [_hot_view addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(20);
            make.left.offset(21);
            make.centerY.equalTo(_hot_view);
        }];
        UIImageView *rightImage = [UIImageView getUIImageView:@"positivelyWidth"];
        [_hot_view addSubview:rightImage];
        [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_hot_view);
            make.right.offset(-10);
        }];
        
        UILabel *More = [UILabel getUILabelText:@"更多" TextColor:[UIColor colorWithHexString:@"#666666"] TextFont:[UIFont getUIFontSize:14 IsBold:NO] TextNumberOfLines:0];
        [More bk_whenTapped:^{
            
        }];
        [_hot_view addSubview:More];
        [More mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(rightImage.mas_left).offset(-5);
            make.centerY.equalTo(_hot_view);
        }];
        [_hot_view bk_whenTapped:^{
            
            [self.xp_rootNavigationController pushViewController:[SMGhhinGe_2Controller new] animated:YES];
        }];
        
    }
    return _hot_view;
}

-(void)sendImageName:(NSInteger)selectImage{
    
    
    
}


#pragma mark - UICollectionViewDelegate

- (UIImageView *)Mall_image{
    if (!_Mall_image) {
        _Mall_image = [UIImageView getUIImageView:@"sedulitySettlement"];
    }
    return _Mall_image;
}

#pragma 懒加载

- (UIView *)Barner_view{
    if (!_Barner_view) {
        _Barner_view = [UIView new];
    }
    return _Barner_view;
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


- (void)heartySkinflintMosque:(NSInteger)index{

    if (index == 7) {
        USvtNu_iController * VC = [USvtNu_iController new];
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
    }else{
        ONalsGl_6GpController * VC = [ONalsGl_6GpController new];
        VC.title = self.TitleArr[index][@"name"];
        if (index == 0) {
            VC.cid = 4;
        }
        else if(index == 1){
            VC.cid = 11;
        }
        else if(index == 2){
            VC.cid = 1;
        }
        else if(index == 3){
            VC.cid = 9;
        }
        else if(index == 4){
            VC.cid = 3;
        }
        else if(index == 5){
            VC.cid = 12;
        }
        else if(index == 6){
            VC.cid = 8;
        }
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
    }
    
}

- (UIView *)search_View{
    if (!_search_View) {
        _search_View = [UIView new];
        _search_View.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
        _search_View.ylCornerRadius = 18;
        [_search_View bk_whenTapped:^{
            
            [self.xp_rootNavigationController pushViewController:[DWPJrtbd_SController new] animated:YES];
        }];
    }
    return _search_View;
}


- (UIView *)search_content_view{
    if (!_search_content_view) {
        _search_content_view = [UIView new];
    }
    return _search_content_view;
}

- (UIView *)line1{
    if (!_line1) {
        _line1 = [UIView new];
        _line1.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    }
    return _line1;
}


- (void)solidifyNasty:(NSMutableArray *)barnerArr{
    
    HPWCmz_QView * BarnerView= [[HPWCmz_QView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 160) andImageNameArray:barnerArr andIsRunning:NO];
    BarnerView.delegate = self;
    [self.Barner_view addSubview:BarnerView];
}

- (UIImageView *)search_image{
    if (!_search_image) {
        _search_image = [UIImageView getUIImageView:@"angleEarthyCostly"];
    }
    return _search_image;
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
        _collectionview.scrollEnabled = NO;
    }
    return _collectionview;
}



- (UIView *)Views{
    if (!_Views) {
        _Views = [UIView new];
        CGFloat X = 0;
        CGFloat Y = 8;
        for (int i = 0; i < _TitleArr.count; i++) {
            if (i%4 == 0 && i > 0) {
                X = 0;
                Y += 80;
            }
            
            NSDictionary *dic = _TitleArr[i];
            
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor whiteColor];
            view.userInteractionEnabled = YES;
            [view bk_whenTapped:^{
                [self heartySkinflintMosque:i];
            }];
            [_Views addSubview:view];
            if (i == _TitleArr.count-1) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.offset((DEVICE_WIDTH-80)/3);
                    make.left.offset(X);
                    make.top.offset(Y);
                    make.bottom.offset(0);
                }];
            }else{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.offset((DEVICE_WIDTH-80)/3);
                    make.left.offset(X);
                    make.top.offset(Y);
                }];
            }
            
            UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:dic[@"image"]]];
            [view addSubview:image];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(46, 46));
                make.top.offset(0);
                make.centerX.equalTo(view);
            }];
            
            
            UILabel *title = [UILabel new];
            title.font = [UIFont getUIFontSize:12 IsBold:YES];
            title.textAlignment = NSTextAlignmentCenter;
            title.textColor = [UIColor colorWithHexString:@"#666666"];
            title.text = dic[@"name"];
            title.tag = 100 + i;
            [view addSubview:title];

            [title mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.offset(20);
                make.left.offset(0);
                make.right.offset(0);
                make.top.equalTo(image.mas_bottom).offset(5);
                make.bottom.offset(0);
            }];
            
            X = X + (DEVICE_WIDTH/4);
            
        }
    }
    return _Views;
}

- (void)loadData{
    
    int x = arc4random() % 14 + 1;

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"1" forKey:@"page"];
    [params setObject:@"14" forKey:@"page_size"];
    [params setObject:@(x) forKey:@"cid"];

    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/shop/api/getGood/all" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"status"] intValue] == 200) {
            self.dataHotArr = responseObject[@"content"];
            [self.collectionview reloadData];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            
        }
    }
    return _scrollView;
}


- (UIView *)line2{
    if (!_line2) {
        _line2 = [UIView new];
        _line2.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    }
    return _line2;
}

@end
