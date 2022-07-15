
#import "IFmy_zoMController.h"
#import "QAjq_7G9Cell.h"
#import "ADftxw_YzController.h"
#import "GUffWnov_oController.h"
#import "CLArcgw_mEController.h"
#import "ORLDfxr_jController.h"
#import "JPbt_qLxController.h"
#import "XONPchbpAr_VController.h"
@interface IFmy_zoMController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , strong) UIButton *type_btn;

@property (nonatomic , strong) UICollectionView *collectionview;

@property (nonatomic , strong) NSArray *TitleArr;

@end

@implementation IFmy_zoMController


- (UICollectionView *)collectionview{
    if (!_collectionview) {
        
        CGFloat W = (DEVICE_WIDTH - 60) / 4;
        
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 12;
        layout.minimumLineSpacing = 12;
        layout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
        layout.itemSize = CGSizeMake(W,80);
        
        _collectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionview.backgroundColor = [UIColor whiteColor];
        _collectionview.showsVerticalScrollIndicator = NO;
        
        [self.collectionview registerNib:[UINib nibWithNibName:@"QAjq_7G9Cell" bundle:nil] forCellWithReuseIdentifier:@"HCReturnsDetailed"];
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        
        
    }
    return _collectionview;
}
#pragma mark - 创建UI

- (UIButton *)type_btn{
    if (!_type_btn) {
        _type_btn = [[UIButton alloc]init];
        [_type_btn setTitle:@"收益类型" forState:UIControlStateNormal];
        [_type_btn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _type_btn.titleLabel.font = [UIFont getUIFontSize:18 IsBold:YES];
        [_type_btn setImage:[UIImage imageNamed:@"vowProletarianKind"] forState:UIControlStateNormal];
        [_type_btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
        
    }
    return _type_btn;
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        [self.xp_rootNavigationController pushViewController:[ADftxw_YzController new] animated:YES];
    }
    else if (indexPath.row == 1){
        [self.xp_rootNavigationController pushViewController:[GUffWnov_oController new] animated:YES];
    }
    else if (indexPath.row == 2){
        [self.xp_rootNavigationController pushViewController:[CLArcgw_mEController new] animated:YES];
    }
    else if (indexPath.row == 3){
        [ZIONf_d showBottomWithText:@"暂未开放"];
    }
    else if (indexPath.row == 4){
        [ZIONf_d showBottomWithText:@"暂未开放"];
    }
    else if (indexPath.row == 5){
        [self.xp_rootNavigationController pushViewController:[ORLDfxr_jController new] animated:YES];
    }
    else if (indexPath.row == 6){
        [self.xp_rootNavigationController pushViewController:[JPbt_qLxController new] animated:YES];
    }
    else if (indexPath.row == 7){
        [self.xp_rootNavigationController pushViewController:[XONPchbpAr_VController new] animated:YES];
    }

}


#pragma mark - UICollectionViewDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"收益明细"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self maltreatClientele];
}

#pragma mark - 懒加载

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"HCReturnsDetailed";
    QAjq_7G9Cell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    cell.name.text = self.TitleArr[indexPath.row][@"name"];
    cell.image.image = [UIImage imageNamed:self.TitleArr[indexPath.row][@"image"]];
    
    return cell;
}

- (void)maltreatClientele{

    
    self.TitleArr = [NSArray arrayWithObjects:
                     @{@"name":@"招商收益",@"image":@"satelliteHull"},
                     @{@"name":@"刷卡分润",@"image":@"wealthyLumpAutocrat"},
                     @{@"name":@"还款分润",@"image":@"smeltMausoleum"},
                     @{@"name":@"空卡分润",@"image":@"abstentiousGinger"},
                     @{@"name":@"中介分润",@"image":@"disappearanceRevive"},
                     @{@"name":@"管理分润",@"image":@"crimeAcrimony"},
                     @{@"name":@"自用返现",@"image":@"executorLabile"},
                     @{@"name":@"其他收入",@"image":@"nomenclatureVerdigrisSalt"},nil];
    
    [self.view addSubview:self.type_btn];
    [self.type_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(30);
        make.left.equalTo(self.view.mas_left).offset(30);
    }];
    
    [self.view addSubview:self.collectionview];
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.top.equalTo(self.type_btn.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-KBottomHeight);
    }];

    
}


@end
