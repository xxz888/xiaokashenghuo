
#import "WLRXqdcx_SscCell.h"
#import "LPLerfbVailm_hCell.h"
#import "HDe_sWnController.h"
@interface WLRXqdcx_SscCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , strong) UILabel *content_Label;

@property (nonatomic , strong) UIImageView *images;

@property (nonatomic , strong) UILabel *shouqi_lab;

@property (nonatomic , strong) UICollectionViewFlowLayout *layout;

@property (nonatomic , strong) UICollectionView *collectionview;

@property (nonatomic , strong) NSArray *dataArray;

@property (nonatomic , strong) UILabel *time_lab;

@property (nonatomic , strong) UIButton *left_btn;

@property (nonatomic , strong) UIButton *right_btn;

@property (nonatomic , strong) UIView *line;

@end

@implementation WLRXqdcx_SscCell



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"Cell";
    LPLerfbVailm_hCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    [cell.Materrial_image sd_setImageWithURL:[NSURL URLWithString:self.dataArray[indexPath.row][@"content"]] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    
    [cell.Materrial_image bk_whenTapped:^{
        [self 跳转下载图片];
    }];
    
    
    return cell;

}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)quadrangleVillaRhythmCheckered{
    
    [self.content_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.offset(10);
        make.right.offset(-10);
    }];
    [self.shouqi_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.content_Label.mas_bottom).offset(10);
        make.right.offset(-20);
    }];
    [self.images mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(18, 18));
        make.centerY.equalTo(self.shouqi_lab);
        make.right.equalTo(self.shouqi_lab.mas_left).offset(-2);
    }];
    
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(220);
        make.width.offset(DEVICE_WIDTH);
        make.top.equalTo(self.shouqi_lab.mas_bottom).offset(0);
        make.left.offset(0);
    }];
    
    [self.time_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(36);
        make.top.equalTo(self.collectionview.mas_bottom).offset(0);
        make.left.offset(10);
    }];
    
    
    [self.right_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.right.offset(-10);
        make.centerY.equalTo(self.time_lab);
    }];
    [self.left_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.right.equalTo(self.right_btn.mas_left).offset(-10);
        make.centerY.equalTo(self.time_lab);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 0.5));
        make.top.equalTo(self.time_lab.mas_bottom).offset(10);
        make.left.offset(0);
        make.bottom.offset(0);
    }];
    [self erstwhileCheckHandlingTerminate];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma 跳转下载图片
- (void)跳转下载图片{
    
    HDe_sWnController *VC = [HDe_sWnController new];
    VC.imageArr = self.dataArray;
    
    
    [self.viewController_cell.xp_rootNavigationController pushViewController:VC animated:YES];
}


#pragma 展开收起

- (UILabel *)time_lab{
    if (!_time_lab) {
        _time_lab = [UILabel getUILabelText:@"2022-01-07" TextColor:[UIColor colorWithHexString:@"#333333"] TextFont:[UIFont getUIFontSize:14 IsBold:NO] TextNumberOfLines:0];
    }
    return _time_lab;
}

- (UIButton *)right_btn{
    if (!_right_btn) {
        _right_btn = [UIButton new];
        [_right_btn setTitle:@"下载图片" forState:UIControlStateNormal];
        [_right_btn setTitleColor:FontThemeColor forState:UIControlStateNormal];
        _right_btn.titleLabel.font = [UIFont getUIFontSize:14 IsBold:NO];
        _right_btn.ylCornerRadius = 17;
        _right_btn.layer.borderColor = FontThemeColor.CGColor;
        _right_btn.layer.borderWidth = 1.0;
    }
    return _right_btn;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setData:(NSDictionary *)data{
    
    self.content_Label.text = data[@"content"];
    
    self.dataArray = [NSArray arrayWithArray:data[@"children"]];
    
    self.time_lab.text = data[@"createTime"];
    
    if(self.dataArray.count == 1){
        self.layout.itemSize = CGSizeMake(220, 220);
        [self.collectionview mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(220+20);
            make.width.offset(220+20);
            make.top.equalTo(self.shouqi_lab.mas_bottom).offset(0);
            make.left.offset(0);
        }];
    }else{
        CGFloat H = (DEVICE_WIDTH - 40) / 3;
        if (self.dataArray.count == 4 || self.dataArray.count == 5 || self.dataArray.count == 6) {
            H = H + H + 30;
        }else if(self.dataArray.count > 6){
            H = H + H + H + 40;
        }else{
            H = H + 20;
        }
        [self.collectionview mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(H);
            make.width.offset(DEVICE_WIDTH);
            make.top.equalTo(self.shouqi_lab.mas_bottom).offset(0);
            make.left.offset(0);
        }];
    }
    [self.collectionview reloadData];
}

- (void)larvaInsectSmearVignette{
    if ([self.shouqi_lab.text isEqualToString:@"展开"]) {
        self.content_Label.numberOfLines = 200;
        _images.transform = CGAffineTransformMakeRotation(M_PI);
        self.shouqi_lab.text = @"收起";
    }else{
        self.content_Label.numberOfLines = 3;
        _images.transform = CGAffineTransformIdentity;
        self.shouqi_lab.text = @"展开";
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.content_Label];
        [self.contentView addSubview:self.images];
        [self.contentView addSubview:self.shouqi_lab];
        [self.contentView addSubview:self.collectionview];
        [self.contentView addSubview:self.time_lab];
        [self.contentView addSubview:self.left_btn];
        [self.contentView addSubview:self.right_btn];
        [self.contentView addSubview:self.line];
        [self quadrangleVillaRhythmCheckered];
    }
    return self;
}
#pragma mark - UICollectionViewDelegate

- (void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark - 懒加载

- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor colorWithHexString:@"#CACACA"];
    }
    return _line;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (void)erstwhileCheckHandlingTerminate{
    
    [_images bk_whenTapped:^{
        [self larvaInsectSmearVignette];
    }];
    [_shouqi_lab bk_whenTapped:^{
        [self larvaInsectSmearVignette];
    }];
    
    [self.left_btn bk_whenTapped:^{
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = self.content_Label.text;
        [ZIONf_d showBottomWithText:@"复制成功" duration:1.0];
    }];
    
    [self.right_btn bk_whenTapped:^{
        [self 跳转下载图片];
    }];
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


- (UIButton *)left_btn{
    if (!_left_btn) {
        _left_btn = [UIButton new];
        [_left_btn setTitle:@"复制文案" forState:UIControlStateNormal];
        [_left_btn setTitleColor:FontThemeColor forState:UIControlStateNormal];
        _left_btn.titleLabel.font = [UIFont getUIFontSize:14 IsBold:NO];
        _left_btn.ylCornerRadius = 17;
        _left_btn.layer.borderColor = FontThemeColor.CGColor;
        _left_btn.layer.borderWidth = 1.0;
    }
    return _left_btn;
}


- (UILabel *)shouqi_lab{
    if (!_shouqi_lab) {
        _shouqi_lab = [UILabel getUILabelText:@"展开" TextColor:[UIColor colorWithHexString:@"#333333"] TextFont:[UIFont getUIFontSize:14 IsBold:NO] TextNumberOfLines:0];
        _shouqi_lab.userInteractionEnabled = YES;
    }
    return _shouqi_lab;
}

- (UICollectionView *)collectionview{
    if (!_collectionview) {
        
        CGFloat W = (DEVICE_WIDTH - 40 - 4) / 3;
        
        
        self.layout = [UICollectionViewFlowLayout new];
        self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.layout.minimumInteritemSpacing = 10;
        self.layout.minimumLineSpacing = 10;
        self.layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.layout.itemSize = CGSizeMake(W, W);
        
        _collectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionview.backgroundColor = [UIColor whiteColor];
        _collectionview.showsVerticalScrollIndicator = NO;
        
        [self.collectionview registerNib:[UINib nibWithNibName:@"LPLerfbVailm_hCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        _collectionview.scrollEnabled = YES;
        
    }
    return _collectionview;
}

- (UIImageView *)images{
    if (!_images) {
        _images = [UIImageView getUIImageView:@"impalePrecipice"];
        _images.userInteractionEnabled = YES;
    }
    return _images;
}


- (UILabel *)content_Label{
    if (!_content_Label) {
        _content_Label = [UILabel getUILabelText:@"" TextColor:[UIColor colorWithHexString:@"#333333"] TextFont:[UIFont getUIFontSize:14 IsBold:NO] TextNumberOfLines:3];
        
    }
    return _content_Label;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}




@end
