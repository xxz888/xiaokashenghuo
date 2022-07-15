
#import "TSQTyHmvd_cKController.h"
#import "LGRhv_bFKController.h"

@interface TSQTyHmvd_cKController ()

@property(strong , nonatomic) UIView *navigation_View;
@property(strong , nonatomic) UIButton *nav_back;

@end

@implementation TSQTyHmvd_cKController


-(void)clickUserXieYiLbl:(id)sender{
    LGRhv_bFKController * vc = [LGRhv_bFKController new];
    vc.whereCome = @"2";
    [self.xp_rootNavigationController pushViewController:vc animated:YES];
}

- (void)serviceableTame:(UIView *)views{
    views.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    views.layer.shadowColor = [UIColor colorWithRed:61/255.0 green:46/255.0 blue:35/255.0 alpha:0.05].CGColor;
    views.layer.shadowOffset = CGSizeMake(0,4);
    views.layer.shadowOpacity = 1;
    views.layer.shadowRadius = 6;
    views.layer.cornerRadius = 23;
}

- (void)backfanhuiAction{
    [self.xp_rootNavigationController popViewControllerAnimated:YES];
}

- (IBAction)agreeAction:(id)sender {
    
    [self.xp_rootNavigationController pushViewController:[EDlgPhy_rTController new] animated:YES];
    
}

#pragma mark ---------选择勾选的按钮---------

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ruinousShopSecretaryCharacterization];
}
#pragma mark ---------同意到下一步的按钮---------

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
#pragma 给view添加同意样式

- (IBAction)selectAction:(id)sender {
    [self.selectBtn setSelected:!self.selectBtn.selected];
    [self.agreeBtn setBackgroundImage:self.selectBtn.selected ?
    [UIImage imageNamed:@"balloonOstentatious"] : [UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [self.agreeBtn setBackgroundColor:self.selectBtn.selected ?
    [UIColor whiteColor] : [UIColor colorWithHexString:@"CDCDCD"]];
    
    
    self.agreeBtn.userInteractionEnabled = self.selectBtn.selected;
}



-(void)ruinousShopSecretaryCharacterization{
    
    
    [self.selectBtn setImage:[UIImage imageNamed:@"squintJawDeduce"] forState:UIControlStateNormal];
    [self.selectBtn setImage:[UIImage imageNamed:@"legendaryProve"] forState:UIControlStateSelected];

    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.userXieYiLbl.text];
    NSRange range1 = [[str string] rangeOfString:@"《用户信息授权协议》"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#666666"] range:range1];
    self.userXieYiLbl.attributedText = str;
    
    
    self.userXieYiLbl.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickUserXieYiLbl:)];
    
    [self.userXieYiLbl addGestureRecognizer:tap];
    
    self.agreeBtn.selected = NO;
    
    [self serviceableTame:self.center_view];
    
    if (kStatusBarHeight != 20) {
        self.top_view_hight.constant = Ratio(200);
    }
    
    self.navigation_View = [[UIView alloc] init];
    [self.view addSubview:self.navigation_View];
    
    [self.navigation_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 44));
        make.top.equalTo(self.view.mas_top).offset(kStatusBarHeight);
        make.left.equalTo(self.view);
    }];
    self.nav_back = [[UIButton alloc]init];
    [self.nav_back setBackgroundImage:[UIImage imageNamed:@"nihilismSlur"] forState:UIControlStateNormal];
    [self.nav_back addTarget:self action:@selector(backfanhuiAction) forControlEvents:UIControlEventTouchUpInside];
    [self.navigation_View addSubview:self.nav_back];
    [self.nav_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.centerY.equalTo(self.navigation_View);
    }];
    
}

@end
