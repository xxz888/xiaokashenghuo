
#import "VFBTtRyb_7lController.h"
#import "GLdtpBwz_vbKCell.h"
#import "QOkhoiZbw_OLwController.h"
@interface VFBTtRyb_7lController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong, nonatomic) UIImageView *top_imageView;
@property(strong, nonatomic) UILabel *top_tishi1_lab;
@property(strong, nonatomic) UILabel *top_tishi2_lab;

@property(strong, nonatomic) UIView *content_Views;
@property(strong, nonatomic) UIImageView *content_bg_image;
@property(strong, nonatomic) UIImageView *content_HeadPortrait;
@property(strong, nonatomic) UILabel *content_title;
@property(strong, nonatomic) UILabel *content_members;
@property(strong, nonatomic) UILabel *content_recommended;

@property (nonatomic , strong) UICollectionView *collectionview;
@property(strong, nonatomic) NSArray *TitleArr;

@property(strong, nonatomic) UILabel *tishi_lab;

@property(strong, nonatomic) NSDictionary *UserData;
@end

@implementation VFBTtRyb_7lController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"客服中心"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self chiromancyProceedsMop];
}


- (UIView *)content_Views{
    if (!_content_Views) {
        _content_Views = [UIView new];
        self.content_Views.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.content_Views.layer.shadowOffset = CGSizeMake(0, 0.3);
        self.content_Views.layer.shadowOpacity = 0.2;
        self.content_Views.layer.shadowRadius = 3;
        self.content_Views.layer.shadowColor = [UIColor blackColor].CGColor;
        self.content_Views.layer.cornerRadius = 10;
    }
    return _content_Views;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cell";
    GLdtpBwz_vbKCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    cell.name_lab.text = self.TitleArr[indexPath.row][@"name"];
    cell.top_image.image = [UIImage imageNamed:self.TitleArr[indexPath.row][@"image"]];
    
    if (indexPath.row == 1) {
        cell.content_lab.text = [NSString stringWithFormat:@"手机号：%@",[NSString getSecrectStringWithPhoneNumber:self.UserData[@"preUserPhone"]]];
    }else{
        cell.content_lab.text = self.TitleArr[indexPath.row][@"content"];
    }
    return cell;
}


- (UICollectionView *)collectionview{
    if (!_collectionview) {
        
        CGFloat W = (DEVICE_WIDTH - 15) / 2;
        
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.itemSize = CGSizeMake(W,120);
        
        _collectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionview.backgroundColor = [UIColor whiteColor];
        _collectionview.showsVerticalScrollIndicator = NO;
        
        [self.collectionview registerNib:[UINib nibWithNibName:@"GLdtpBwz_vbKCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        
    }
    return _collectionview;
}

#pragma mark - UICollectionViewDataSource

- (UIImageView *)top_imageView{
    if (!_top_imageView) {
        _top_imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"anticlimaxBlasphemy"]];
    }
    return _top_imageView;
}

- (void)tenthBankruptPrudePrimeval{
    
    
    self.UserData = [self loadUserData];
    
    self.content_title.text = [self.UserData[@"fullname"] length] == 0 ? @"未实名" : self.UserData[@"fullname"];
    
    if ([self.UserData[@"vipLevel"] intValue] == 0) {
        self.content_members.text = @"普通";
        [self.content_members mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(30);
        }];
    }else{
        self.content_members.text = [NSString stringWithFormat:@"V%@",self.UserData[@"vipLevel"]];
        [self.content_members mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(20);
        }];
    }
    
    self.content_recommended.text = [NSString stringWithFormat:@"推荐码：%@",self.UserData[@"username"]];
    
    
    [self.collectionview reloadData];
}

#pragma mark - UICollectionViewDelegate

- (UIImageView *)content_HeadPortrait{
    if (!_content_HeadPortrait) {
        _content_HeadPortrait = [UIImageView getUIImageView:@"accidentStrictlySincerely"];
    }
    return _content_HeadPortrait;
}

#pragma mark - 懒加载

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *identifyAction = [UIAlertAction actionWithTitle:@"打开微信并复制客服微信号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = @"kakasuhuan001";
            
            NSURL * url = [NSURL URLWithString:@"weixin://"];
            BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
            
            if (canOpen){
                
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }else {
                [ZIONf_d showBottomWithText:@"您的设备未安装微信APP"];
            }
            
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:identifyAction];
        [alert addAction:cancelAction];

        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (indexPath.row == 1){
        if ([self.UserData[@"preUserPhone"] stringValue].length > 0) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.UserData[@"preUserPhone"]]] options:@{} completionHandler:nil];
        }
    }else{
        [ZIONf_d showBottomWithText:@"暂未开放"];
    }
}


- (UILabel *)top_tishi1_lab{
    if (!_top_tishi1_lab) {
        _top_tishi1_lab = [UILabel new];
        _top_tishi1_lab.text = [NSString stringWithFormat:@"安全无风险"];
        _top_tishi1_lab.font = [UIFont getUIFontSize:18 IsBold:YES];
        _top_tishi1_lab.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    }
    return _top_tishi1_lab;
}

- (UILabel *)top_tishi2_lab{
    if (!_top_tishi2_lab) {
        _top_tishi2_lab = [UILabel new];
        _top_tishi2_lab.text = [NSString stringWithFormat:@"一站式信用卡还款平台"];
        _top_tishi2_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
        _top_tishi2_lab.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    }
    return _top_tishi2_lab;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self tenthBankruptPrudePrimeval];
}


- (UILabel *)tishi_lab{
    if (!_tishi_lab) {
        _tishi_lab = [UILabel new];
        _tishi_lab.text = [NSString stringWithFormat:@"温馨提示:\n为了更快速的解答您的问题,建议优先点击“在线客服”，同时把您的注册手机号姓名和相关问题及时发送，谢谢。"];
        _tishi_lab.font = [UIFont getUIFontSize:10 IsBold:YES];
        _tishi_lab.textColor = [UIColor colorWithHexString:@"#666666"];
        _tishi_lab.numberOfLines = 5;
    }
    return _tishi_lab;
}


- (UILabel *)content_recommended{
    if (!_content_recommended) {
        _content_recommended = [UILabel new];
        _content_recommended.text = @"推荐码：";
        _content_recommended.font = [UIFont getUIFontSize:12 IsBold:YES];
        _content_recommended.textColor = [UIColor colorWithHexString:@"#1A1A4B"];;
        _content_recommended.textAlignment = NSTextAlignmentRight;
    }
    return _content_recommended;
}

- (void)chiromancyProceedsMop{
    
    
    self.TitleArr = [NSArray arrayWithObjects:
                     @{@"name":@"客服微信",@"image":@"criticalPerfidy",@"content":@"kakasuhuan001\n时间：09:00-18:00"},
                     @{@"name":@"推荐人",@"image":@"execrableAvowDance",@"content":[NSString stringWithFormat:@"手机号：%@",[NSString getSecrectStringWithPhoneNumber:self.UserData[@"preUserPhone"]]]},
                     @{@"name":@"官方留言",@"image":@"asiaInexplicable",@"content":@"非工作时间\n请选择在线留言"}, nil];
    
    [self.view addSubview:self.content_bg_image];
    [self.content_bg_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.offset(0);
        make.height.offset(0.5);
    }];
    
    [self.view addSubview:self.top_imageView];
    [self.top_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, Ratio(116.5)));
        make.top.offset(0.5);
        make.right.left.offset(0);
    }];
    
    [self.view addSubview:self.top_tishi1_lab];
    [self.top_tishi1_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top_imageView.mas_top).offset(Ratio(22.5));
        make.left.offset(72.5);
    }];

    [self.view addSubview:self.top_tishi2_lab];
    [self.top_tishi2_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top_tishi1_lab.mas_bottom).offset(6.5);
        make.left.offset(72.5);
    }];
    
    
    [self.view addSubview:self.content_Views];
    [self.content_Views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 72));
        make.left.offset(15);
        make.top.equalTo(self.top_imageView.mas_bottom).offset(-36);
    }];
    
    

    
    
    self.content_HeadPortrait.layer.masksToBounds = YES;
    self.content_HeadPortrait.layer.cornerRadius = 24;
    [self.content_Views addSubview:self.content_HeadPortrait];
    [self.content_HeadPortrait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(48, 48));
        make.left.equalTo(self.content_Views.mas_left).offset(13);
        make.centerY.equalTo(self.content_Views);
    }];
    
    
    [self.content_Views addSubview:self.content_title];
    [self.content_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.content_HeadPortrait.mas_right).offset(13);
        make.centerY.equalTo(self.content_HeadPortrait);
    }];


    self.content_members.layer.masksToBounds = YES;
    self.content_members.layer.cornerRadius = 10;
    [self.content_Views addSubview:self.content_members];
    [self.content_members mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(20);
        make.left.equalTo(self.content_title.mas_right).offset(2);
        make.centerY.equalTo(self.content_title);
    }];
    
    [self.content_Views addSubview:self.content_recommended];
    [self.content_recommended mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.content_Views.mas_right).offset(-13);
        make.centerY.equalTo(self.content_HeadPortrait);
    }];
    
    [self.view addSubview:self.collectionview];
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.height.offset(260);
        make.top.equalTo(self.content_Views.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left);
    }];
    
    [self.view addSubview:self.tishi_lab];
    [self.tishi_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH-30);
        make.height.offset(60);
        make.top.equalTo(self.collectionview.mas_bottom).offset(0);
        make.centerX.equalTo(self.view);
    }];
    
    
    
    
}

- (UIImageView *)content_bg_image{
    if (!_content_bg_image) {
        _content_bg_image = [[UIImageView alloc]init];
        _content_bg_image.backgroundColor = [UIColor colorWithHexString:@"#f9bb00"];
    }
    return _content_bg_image;
}


- (UILabel *)content_members{
    if (!_content_members) {
        _content_members = [UILabel new];
        _content_members.text = @"V1";
        _content_members.textAlignment = NSTextAlignmentCenter;
        _content_members.font = [UIFont getUIFontSize:10 IsBold:YES];
        _content_members.backgroundColor = [UIColor colorWithHexString:@"#F9D8AE"];
        _content_members.textColor = [UIColor colorWithHexString:@"#1A1A4B"];
    }
    return _content_members;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}


- (UILabel *)content_title{
    if (!_content_title) {
        _content_title = [UILabel new];
        _content_title.text = @"熊威";
        _content_title.font = [UIFont getUIFontSize:18 IsBold:YES];
        _content_title.textColor =  [UIColor colorWithHexString:@"#1A1A4B"];
    }
    return _content_title;
}


@end
