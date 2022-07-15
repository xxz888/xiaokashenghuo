
#import "BCiynw_PIController.h"
#import "FWblf_Cf4View.h"
#import "UXOUagtuSskwp_npController.h"
@interface BCiynw_PIController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong, nonatomic) UIScrollView *scrollView;

@property (strong , nonatomic) UIImageView *goods_image;
@property (strong , nonatomic) UIView *goods_view;
@property (strong , nonatomic) UILabel *goods_name;
@property (strong , nonatomic) UILabel *goods_Introduction;
@property (strong , nonatomic) UILabel *goods_score;
@property (strong , nonatomic) UILabel *goods_InSales;
@property (strong , nonatomic) UILabel *goods_price;
@property (strong , nonatomic) UILabel *goods_vouchersxxxAfter_price;
@property (strong , nonatomic) UIView *goods_vouchersxxxAfter_view;
@property (strong , nonatomic) UILabel *goods_vouchersxxxAfter_vip;
@property (strong , nonatomic) UILabel *goods_StoreActivity;
@property (strong , nonatomic) UILabel *goods_vouchersxxx;
@property (strong , nonatomic) UILabel *goods_collection;
@property (strong , nonatomic) UILabel *goods_evaluation;

@property (strong , nonatomic) UIButton *leftBtn;
@property (strong , nonatomic) UIButton *finishBtn;

@property (strong , nonatomic) UIView *goods_line;
@property (strong , nonatomic) UILabel *goods_line_title;

@property (strong , nonatomic) UICollectionView *collectionview;

@property (strong , nonatomic) NSArray *dataSimilarArr;

@property (strong , nonatomic) NSDictionary *goodsDic;

@end

@implementation BCiynw_PIController


- (UIImageView *)goods_image{
    if (!_goods_image) {
        _goods_image = [UIImageView getUIImageView:@"introspectionPregnancy"];
        _goods_image.contentMode = UIViewContentModeScaleToFill;
    }
    return _goods_image;
}
#pragma 商品详情

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
#pragma 相识商品

- (UILabel *)goods_price{
    if (!_goods_price) {
        _goods_price = [UILabel getUILabelText:@"￥0.00" TextColor:[UIColor colorWithHexString:@"#1A1A4B"] TextFont:[UIFont getUIFontSize:24 IsBold:NO] TextNumberOfLines:0];
    }
    return _goods_price;
}
#pragma 立即购买

- (UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton new];
        [_leftBtn setBackgroundColor:[UIColor colorWithHexString:@"#B9B9B9"]];
        [_leftBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _leftBtn.titleLabel.font = [UIFont getUIFontSize:13 IsBold:YES];
        _leftBtn.ylCornerRadius = 8;
        [_leftBtn bk_whenTapped:^{
            [self shoddyHaggleSteak];
        }];
    }
    return _leftBtn;
}

#pragma 购物车

- (void)willingEntertainmentAnnotateOmnivorous{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"1" forKey:@"page"];
    [params setObject:@"14" forKey:@"page_size"];
    [params setObject:self.tao_id forKey:@"item_id"];

    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/shop/api/getGood/similarity" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"status"] intValue] == 200) {
            
            self.dataSimilarArr = [NSArray arrayWithArray:responseObject[@"content"]];
            [self.collectionview reloadData];
            [self solitudeDisloyaltyCaterUntutored];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}

#pragma 收藏

- (void)flaccidCanoe{
    
    
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.height.offset(DEVICE_HEIGHT);
        make.left.top.offset(0);
    }];
    
    [self.scrollView addSubview:self.goods_image];
    [self.goods_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 340));
        make.left.top.offset(0);
    }];
    
    [self.scrollView addSubview:self.goods_view];
    [self.goods_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH - 20);
        make.left.offset(10);
        make.top.equalTo(self.goods_image.mas_bottom).offset(15);
    }];
    
    double view_left_w = 15.0f;
    
    [self.goods_view addSubview:self.goods_name];
    [self.goods_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(view_left_w);
        make.right.offset(-15);
        make.top.offset(15);
    }];
    [self.goods_view addSubview:self.goods_Introduction];
    [self.goods_Introduction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(view_left_w);
        make.right.offset(-15);
        make.top.equalTo(self.goods_name.mas_bottom).offset(10);
    }];
    [self.goods_view addSubview:self.goods_score];
    [self.goods_score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(view_left_w);
        make.top.equalTo(self.goods_Introduction.mas_bottom).offset(10);
    }];
    [self.goods_view addSubview:self.goods_InSales];
    [self.goods_InSales mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(self.goods_score);
    }];
    
    [self.goods_view addSubview:self.goods_price];
    [self.goods_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(view_left_w);
        make.top.equalTo(self.goods_score.mas_bottom).offset(10);
    }];
    
    
    [self.goods_view addSubview:self.goods_vouchersxxxAfter_view];
    [self.goods_vouchersxxxAfter_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(view_left_w);
        make.bottom.equalTo(self.goods_price.mas_bottom).offset(-5);
        make.left.equalTo(self.goods_price.mas_right).offset(10);
    }];
    
    [self.goods_vouchersxxxAfter_view addSubview:self.goods_vouchersxxxAfter_vip];
    [self.goods_vouchersxxxAfter_vip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.goods_vouchersxxxAfter_view);
        make.left.offset(5);
    }];
    [self.goods_vouchersxxxAfter_view addSubview:self.goods_vouchersxxxAfter_price];
    [self.goods_vouchersxxxAfter_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(13);
        make.centerY.equalTo(self.goods_vouchersxxxAfter_view);
        make.left.equalTo(self.goods_vouchersxxxAfter_vip.mas_right).offset(5);
        make.right.offset(-1);
    }];
    
    
    
    [self.goods_view addSubview:self.goods_vouchersxxx];
    [self.goods_vouchersxxx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 24));
        make.right.offset(0);
        make.centerY.equalTo(self.goods_vouchersxxxAfter_price);
    }];
    
    [self.goods_view addSubview:self.goods_collection];
    [self.goods_collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(18);
        make.left.offset(view_left_w);
        make.top.equalTo(self.goods_price.mas_bottom).offset(10);
        make.bottom.offset(-15);
    }];
    
    [self.goods_view addSubview:self.goods_evaluation];
    [self.goods_evaluation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goods_collection.mas_right).offset(view_left_w);
        make.centerY.equalTo(self.goods_collection);
    }];
    
    
    [self.scrollView addSubview:self.goods_line];
    [self.goods_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(120, 0.5));
        make.centerX.equalTo(self.scrollView);
        make.top.equalTo(self.goods_view.mas_bottom).offset(30);
    }];
    
    [self.scrollView addSubview:self.goods_line_title];
    [self.goods_line_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 18));
        make.center.equalTo(self.goods_line);
    }];
    
    
    [self.scrollView addSubview:self.collectionview];
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.top.equalTo(self.goods_line.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left);
        make.height.offset(7 * 220 + 55);
    }];
    
    
    
    
    
    [self.view addSubview:self.leftBtn];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 46));
        make.left.offset(15);
        make.bottom.offset(-15-KBottomHeight);
    }];
    
    [self.view addSubview:self.finishBtn];
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-15-130, 46));
        make.left.offset(130);
        make.bottom.offset(-15-KBottomHeight);
    }];
    
    [self solitudeDisloyaltyCaterUntutored];
    
}

#pragma mark - UICollectionViewDataSource

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
        _collectionview.backgroundColor = [UIColor colorWithHexString:@"F0F2F5"];
        _collectionview.showsVerticalScrollIndicator = NO;
        
        [self.collectionview registerNib:[UINib nibWithNibName:@"ULJZrxdd_ECell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        _collectionview.scrollEnabled = NO;
    }
    return _collectionview;
}

- (UILabel *)goods_Introduction{
    if (!_goods_Introduction) {
        _goods_Introduction = [UILabel getUILabelText:@"商品详情" TextColor:[UIColor colorWithHexString:@"#999999"] TextFont:[UIFont getUIFontSize:12 IsBold:NO] TextNumberOfLines:5];
    }
    return _goods_Introduction;
}

#pragma mark - UICollectionViewDelegate

- (void)solitudeDisloyaltyCaterUntutored{
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    _scrollView.contentSize = CGSizeMake(DEVICE_WIDTH, CGRectGetMaxY(self.collectionview.frame) + KBottomHeight + 76 + 65);
}

- (UIView *)goods_line{
    if (!_goods_line) {
        _goods_line = [UIView new];
        _goods_line.backgroundColor = [UIColor colorWithHexString:@"#1A1A4B"];
    }
    return _goods_line;
}


- (void)prowessBelittleFragranceSpace{
    
    FWblf_Cf4View *BuyNowView = [[FWblf_Cf4View alloc] init];
    BuyNowView.top_H = 280.0;
    
    [BuyNowView.goods_image sd_setImageWithURL:self.goodsDic[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    BuyNowView.goods_name.text = self.goodsDic[@"title"];
    
    BuyNowView.goods_vouchersxxxAfter_price.text = [NSString stringWithFormat:@"￥%@",self.goodsDic[@"quanhou_jiage"]];
    [BuyNowView.finishBtn bk_whenTapped:^{
        if (![self toLogin]) return;
        [BuyNowView disMissView];
        
        UXOUagtuSskwp_npController *VC = [UXOUagtuSskwp_npController new];
        VC.goodsDic = self.goodsDic;
        VC.number = [BuyNowView.BuyNow_number.text integerValue];
        [self.xp_rootNavigationController pushViewController:VC animated:YES];
    }];
    
    
    [BuyNowView ShowView];
}


#pragma 懒加载

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F0F2F5"];
    self.navigationItem.title = @"商品详情";
    [self flaccidCanoe];
    [self hoofPhotostaticInnocence];
    [self willingEntertainmentAnnotateOmnivorous];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cell";
    ULJZrxdd_ECell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    NSDictionary *data = self.dataSimilarArr[indexPath.row];
    
    [cell.top_image sd_setImageWithURL:data[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    
    cell.title_lab.text = data[@"title"];
    
    
    NSString *priceStr = [NSString stringWithFormat:@"¥%@",data[@"size"]];
    
    NSString *salesStr = [NSString stringWithFormat:@"%@",data[@"volume"]];
    
    cell.content_lab.attributedText =  [UILabel setupAttributeString:[NSString stringWithFormat:@"%@ %@人付款",priceStr,salesStr] rangeText:priceStr textColor:[UIColor colorWithHexString:@"#FF8100"] textFont:[UIFont getUIFontSize:18 IsBold:NO]];
    
    
    
    return cell;
}

- (UILabel *)goods_line_title{
    if (!_goods_line_title) {
        _goods_line_title = [UILabel getUILabelText:@"看了又看" TextColor:[UIColor colorWithHexString:@"#1A1A4B"] TextFont:[UIFont getUIFontSize:15 IsBold:NO] TextNumberOfLines:0];
        _goods_line_title.backgroundColor = [UIColor colorWithHexString:@"F0F2F5"];
        _goods_line_title.textAlignment = NSTextAlignmentCenter;
    }
    return _goods_line_title;
}

- (UILabel *)goods_StoreActivity{
    if (!_goods_StoreActivity) {
        _goods_StoreActivity = [UILabel getUILabelText:@"  折扣活动  " TextColor:[UIColor colorWithHexString:@"#FF8100"] TextFont:[UIFont getUIFontSize:12 IsBold:NO] TextNumberOfLines:0];
        _goods_StoreActivity.layer.masksToBounds = YES;
        _goods_StoreActivity.layer.cornerRadius = 3;
        _goods_StoreActivity.layer.borderColor = [UIColor colorWithHexString:@"#FF8100"].CGColor;
        _goods_StoreActivity.layer.borderWidth = 0.5;
    }
    return _goods_StoreActivity;
}

- (UILabel *)goods_vouchersxxxAfter_vip{
    if (!_goods_vouchersxxxAfter_vip) {
        _goods_vouchersxxxAfter_vip = [UILabel getUILabelText:@"优惠" TextColor:[UIColor whiteColor] TextFont:[UIFont getUIFontSize:12 IsBold:NO] TextNumberOfLines:0];
    }
    return _goods_vouchersxxxAfter_vip;
}

- (void)sedentaryBegetRoastWidth{
    if (![self toLogin]) return;
    if ([self.goods_vouchersxxx.text isEqualToString:@"已收藏"]){
        [ZIONf_d showBottomWithText:@"您已收藏过此商品！"];
        return;
    }
    NSDictionary *UserDic = [self loadUserData];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:UserDic[@"username"] forKey:@"phone"];
    [params setObject:[NSDate GetCurrentDateType:DateTypeYMD] forKey:@"time"];
    [params setObject:self.tao_id forKey:@"tao_id"];

    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/addCollect" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 200) {
            self.goods_vouchersxxx.text = @"已收藏";
            [ZIONf_d showBottomWithText:@"收藏成功"];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
}

- (UILabel *)goods_evaluation{
    if (!_goods_evaluation) {
        _goods_evaluation = [UILabel getUILabelText:@"大家评论：0+" TextColor:[UIColor colorWithHexString:@"#999999"] TextFont:[UIFont getUIFontSize:12 IsBold:NO] TextNumberOfLines:0];
    }
    return _goods_evaluation;
}

- (UIView *)goods_vouchersxxxAfter_view{
    if (!_goods_vouchersxxxAfter_view) {
        _goods_vouchersxxxAfter_view = [UIView new];
        _goods_vouchersxxxAfter_view.backgroundColor = [UIColor colorWithHexString:@"#1A1A4B"];
    }
    return _goods_vouchersxxxAfter_view;
}

- (void)hoofPhotostaticInnocence{
    @weakify(self);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.tao_id forKey:@"tao_id"];

    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/api/getGood/tid" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"status"] intValue] == 200) {
            
            self.goodsDic = [responseObject[@"content"] firstObject];
            
            [weak_self.goods_image sd_setImageWithURL:self.goodsDic[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
            weak_self.goods_name.text = self.goodsDic[@"title"];
            weak_self.goods_Introduction.text = self.goodsDic[@"jianjie"];
            weak_self.goods_score.text = [NSString stringWithFormat:@"分数:%@",self.goodsDic[@"shop_dsr"]];
            weak_self.goods_InSales.text = [NSString stringWithFormat:@"季销量:%@",self.goodsDic[@"volume"]];
            weak_self.goods_price.text = [NSString stringWithFormat:@"￥%@",self.goodsDic[@"size"]];
            weak_self.goods_vouchersxxxAfter_price.text = [NSString stringWithFormat:@"￥%@",self.goodsDic[@"quanhou_jiage"]];
            weak_self.goods_StoreActivity.text = self.goodsDic[@"biaoqian"];
            weak_self.goods_collection.text = [NSString stringWithFormat:@"收藏:%@+",self.goodsDic[@"favcount"]];
            weak_self.goods_evaluation.text = [NSString stringWithFormat:@"宝贝评论:%@+",self.goodsDic[@"commentCount"]];
            [self solitudeDisloyaltyCaterUntutored];
        }else if ([responseObject[@"status"] intValue] == 301){
            [ZIONf_d showBottomWithText:responseObject[@"content"]];
            [self.xp_rootNavigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSimilarArr.count;
}

- (UILabel *)goods_score{
    if (!_goods_score) {
        _goods_score = [UILabel getUILabelText:@"分数：" TextColor:[UIColor colorWithHexString:@"#999999"] TextFont:[UIFont getUIFontSize:12 IsBold:NO] TextNumberOfLines:0];
    }
    return _goods_score;
}

- (void)shoddyHaggleSteak{
    if (![self toLogin]) return;
    if ([self.leftBtn.titleLabel.text isEqualToString:@"已加入购物车"]){
        [ZIONf_d showBottomWithText:@"商品已在购物车！"];
        return;
    }
    NSDictionary *UserDic = [self loadUserData];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:UserDic[@"username"] forKey:@"phone"];
    [params setObject:[NSDate GetCurrentDateType:DateTypeYMD] forKey:@"time"];
    [params setObject:self.tao_id forKey:@"tao_id"];
    @weakify(self);
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/addShoppingCart" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 200) {
            [weak_self.leftBtn setTitle:@"已加入购物车" forState:UIControlStateNormal];
            [ZIONf_d showBottomWithText:@"加入购物车成功"];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
}

- (UILabel *)goods_vouchersxxxAfter_price{
    if (!_goods_vouchersxxxAfter_price) {
        _goods_vouchersxxxAfter_price = [UILabel getUILabelText:@"￥0.00" TextColor:[UIColor colorWithHexString:@"#1A1A4B"] TextFont:[UIFont getUIFontSize:12 IsBold:NO] TextNumberOfLines:0];
        _goods_vouchersxxxAfter_price.backgroundColor = [UIColor whiteColor];
    }
    return _goods_vouchersxxxAfter_price;
}

- (UILabel *)goods_name{
    if (!_goods_name) {
        _goods_name = [UILabel new];
        _goods_name.text = @"商品";
        _goods_name.font = [UIFont getUIFontSize:18 IsBold:YES];
        _goods_name.textColor = [UIColor colorWithHexString:@"#000000"];
        _goods_name.numberOfLines = 3;
    }
    return _goods_name;
}

- (UILabel *)goods_collection{
    if (!_goods_collection) {
        _goods_collection = [UILabel getUILabelText:@"收藏：0+" TextColor:[UIColor colorWithHexString:@"#999999"] TextFont:[UIFont getUIFontSize:12 IsBold:NO] TextNumberOfLines:0];
    }
    return _goods_collection;
}

- (UIView *)goods_view{
    if (!_goods_view) {
        _goods_view = [UIView new];
        _goods_view.backgroundColor = [UIColor whiteColor];
        _goods_view.ylCornerRadius = 10;
    }
    return _goods_view;
}

- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"balloonOstentatious"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont getUIFontSize:13 IsBold:YES];
        _finishBtn.ylCornerRadius = 8;
        [_finishBtn bk_whenTapped:^{
            [self prowessBelittleFragranceSpace];
        }];
    }
    return _finishBtn;
}

- (UILabel *)goods_InSales{
    if (!_goods_InSales) {
        _goods_InSales = [UILabel getUILabelText:@"月出售：" TextColor:[UIColor colorWithHexString:@"#999999"] TextFont:[UIFont getUIFontSize:12 IsBold:NO] TextNumberOfLines:0];
    }
    return _goods_InSales;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *data = self.dataSimilarArr[indexPath.row];
    
    BCiynw_PIController *VC = [BCiynw_PIController new];
    
    VC.tao_id = data[@"tao_id"];
    
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}

- (UILabel *)goods_vouchersxxx{
    if (!_goods_vouchersxxx) {
        _goods_vouchersxxx = [UILabel getUILabelText:@"+收藏" TextColor:[UIColor whiteColor] TextFont:[UIFont getUIFontSize:13 IsBold:NO] TextNumberOfLines:0];
        _goods_vouchersxxx.backgroundColor = [UIColor colorWithHexString:@"#1A1A4B"];
        [ _goods_vouchersxxx getPartOfTheCornerRadius:CGRectMake(0, 0, 50, 24) CornerRadius:12 UIRectCorner:UIRectCornerTopLeft | UIRectCornerBottomLeft];
        _goods_vouchersxxx.userInteractionEnabled = YES;
        _goods_vouchersxxx.textAlignment = NSTextAlignmentCenter;
        [_goods_vouchersxxx bk_whenTapped:^{
            [self sedentaryBegetRoastWidth];
        }];
        
    }
    return _goods_vouchersxxx;
}
@end
