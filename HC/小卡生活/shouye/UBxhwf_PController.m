
#import "UBxhwf_PController.h"
#import "YMNsr_oView.h"
#import "OBGcr_MQController.h"
#import "CPQj_aController.h"
#import "TWAcmdeUy_KJController.h"
#import "DKAYfYli_aView.h"
#import "NYLk_DfTView.h"
#import "MKCQlvth_NiController.h"
#import "JJgkxpLom_PController.h"

@interface UBxhwf_PController ()<HHBannerViewDelegate>


@property(strong, nonatomic) UIScrollView *scrollView;

@property(strong, nonatomic) UIImageView *top_imageView;
@property(strong, nonatomic) UIImageView *top_icon;
@property(strong, nonatomic) UILabel *top_title;
@property(strong, nonatomic) UILabel *top_content;
@property(strong, nonatomic) UIView *Views;

@property(strong, nonatomic) NSArray *TitleArr;
@property(strong, nonatomic) UIView *Barner_view;
@property(strong, nonatomic) UIView *gg_view;
@property(strong, nonatomic) UIImageView *gg_icon;
@property(strong, nonatomic) UILabel *gg_title;
@property(strong, nonatomic) UILabel *gg_content;
@property(strong, nonatomic) UILabel *gg_more;
@property(strong, nonatomic) UIImageView *bjfw_icon;
@property(strong, nonatomic) UILabel *bjfw_title;
@property(strong, nonatomic) UIImageView *bjfw_left_img;
@property(strong, nonatomic) UIImageView *bjfw_right_img;
@property(strong, nonatomic) UIImageView *bjfw_bottom_img;

@property (nonatomic, strong) DKAYfYli_aView *labelScroll;

@end

@implementation UBxhwf_PController


- (UIImageView *)bjfw_left_img{
    if (!_bjfw_left_img) {
        _bjfw_left_img = [UIImageView getUIImageView:@"playwrightHen"];
        _bjfw_left_img.userInteractionEnabled = YES;
        [_bjfw_left_img bk_whenTapped:^{
 
            MKCQlvth_NiController * vc = [[MKCQlvth_NiController alloc]init];
            vc.url = @"http://kakasuhuanh5.jfgj777.com";
            [self.xp_rootNavigationController pushViewController:vc animated:YES];
            
        }];
    }
    return _bjfw_left_img;
}

#pragma 获取首页图片信息

- (UILabel *)gg_more{
    if (!_gg_more) {
        _gg_more = [UILabel new];
        _gg_more.text = @"丨 更多";
        _gg_more.font = [UIFont getUIFontSize:15 IsBold:YES];
        _gg_more.textAlignment = NSTextAlignmentRight;
        _gg_more.textColor = [UIColor colorWithHexString:@"#969696"];
    }
    return _gg_more;
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.hidesBottomBarWhenPushed = NO;
    self.tabBarController.tabBar.hidden = NO;
    
    
    id traget = self.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:traget action:nil];
    [self.view addGestureRecognizer:pan];
    
    
    [self gardenerFrugalityForeSurvivor];
}

#pragma 获取版本信息 个人信息

- (UIImageView *)top_icon{
    if (!_top_icon) {
        _top_icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digressivePetrology"]];
        
    }
    return _top_icon;
}

#pragma 获取最新消息

- (void)balloonMassacre{
    NSMutableArray *barnerArr = [NSMutableArray array];
    [self NetWorkingPostWithAddressURL:self hiddenHUD:YES url:@"/api/user/advert/get" Params:@{@"title":@"首页轮播图"} success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            NSArray *arr = [NSArray arrayWithArray:responseObject[@"data"]];
            if (arr.count > 0) {
                for (int i = 0; i < arr.count; i++) {
                    [barnerArr addObject:arr[i][@"imgUrl"]];
                }
            }
            [self conferenceCrayon:barnerArr];
        }
    } failure:^(NSString * _Nonnull error) {

    }];

}


- (UILabel *)gg_content{
    if (!_gg_content) {
        _gg_content = [UILabel new];
        _gg_content.text = @"暂无公告";
        _gg_content.font = [UIFont getUIFontSize:15 IsBold:YES];
        _gg_content.textColor = [UIColor blackColor];
    }
    return _gg_content;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.labelScroll showNext];
}

#pragma 弹出版本升级

- (void)gardenerFrugalityForeSurvivor{
    
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/user/app/config/get" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            NSDictionary * data= responseObject[@"data"];
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            
            NSString  *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            NSString * versionStr = [app_Version stringByReplacingOccurrencesOfString:@"." withString:@""];
            NSString * version = [[data[@"iosVersion"] stringValue] stringByReplacingOccurrencesOfString:@"." withString:@""];
            if (![[data[@"iosVersion"] stringValue] isEqualToString:app_Version] && [versionStr integerValue] < [version integerValue]) {
                [self hereticalDegenerateMapleExit:data];
            }
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
    NSDictionary *UserData = [self loadUserData];
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:[NSString stringWithFormat:@"/api/user/get/%@",UserData[@"id"]] Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            [self updateUserData:responseObject[@"data"]];
        }
        
        [self RealNameAuthentication];
    } failure:^(NSString * _Nonnull error) {
        
    }];
}

#pragma 点击事件

- (UILabel *)bjfw_title{
    if (!_bjfw_title) {
        _bjfw_title = [UILabel new];
        _bjfw_title.text = @"便捷服务";
        _bjfw_title.font = [UIFont getUIFontSize:18 IsBold:YES];
        _bjfw_title.textColor = [UIColor blackColor];
    }
    return _bjfw_title;
}


- (void)cerebralSkipDisquisition:(NSInteger)index{
    
    if(index == 0){
        if ([self RealNameAuthentication]) {
            [self.xp_rootNavigationController pushViewController:[KFszPp_mxXController new] animated:YES];
        }
    }
    
    else if(index == 1){
        if ([self RealNameAuthentication]) {
            [self.xp_rootNavigationController pushViewController:[ZDObr_eController new] animated:YES];
        }
    }
    
    else if(index == 2){
        if ([self RealNameAuthentication]) {
            [self.xp_rootNavigationController pushViewController:[UYRYeYrwuz_2Controller new] animated:YES];
        }
       
    }
    
    else if(index == 3){
        [self.xp_rootNavigationController pushViewController:[GTRMuq_ZController new] animated:YES];
    }
    
    else if(index == 4){
        if ([self RealNameAuthentication]) {
            [self.xp_rootNavigationController pushViewController:[ANpdQuz_3fController new] animated:YES];
        }
    }
    
    else if (index == 5){
        [self.xp_rootNavigationController pushViewController:[PXl_3jController new] animated:YES];
    }
    
    
}

- (void)garbageCrescendoBrotherinlawDifficulty{
    @weakify(self);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"1" forKey:@"currentPage"];
    [params setObject:@"3" forKey:@"pageSize"];
    [params setObject:@"0" forKey:@"type"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/user/msg/get" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            NSArray * array = responseObject[@"data"];
            if (array.count > 0) {
                
                NSMutableArray *data = [NSMutableArray array];
                for (NSDictionary *dic in array) {
                    [data addObject:dic[@"title"]];
                }
                [self.gg_content layoutIfNeeded];
                [self.gg_content setNeedsLayout];
                self.labelScroll = [[DKAYfYli_aView alloc] initWithFrame:self.gg_content.frame];
                [self.gg_view addSubview:self.labelScroll];
                self.labelScroll.dataSource = data;
                self.labelScroll.block = ^(NSString *str) {
                    for (NSDictionary *dic in array) {
                        if ([dic[@"title"] isEqualToString:str]) {
                            XPCupuzDxlbf_JController *VC = [XPCupuzDxlbf_JController new];
                            VC.dataDic = dic;
                            [weak_self.xp_rootNavigationController pushViewController:VC animated:YES];
                        }
                    }
                };
                
                NSDictionary *newDic = [NSDictionary dictionaryWithDictionary:array[0]];
                
                NSMutableDictionary *userMsgDic = [NSMutableDictionary dictionaryWithDictionary:[self getToObtainTheSpecified:@"userMsg"]];
                if (userMsgDic.count == 0) {
                    [userMsgDic setObject:newDic[@"id"] forKey:@"id"];
                    [userMsgDic setObject:@"1" forKey:@"number"];
                    [self updateToObtainTheSpecified:@"userMsg" Data:userMsgDic];
                    [self forceBankingDisinfectJudicial:newDic];
                }
                else{
                    
                    int number = [userMsgDic[@"number"] intValue];
                    
                    NSString *idStr = [NSString stringWithFormat:@"%@",userMsgDic[@"id"]];
                    if([[newDic[@"id"] stringValue] isEqualToString:idStr]){
                        if (number < 3 ) {
                            number++;
                            [userMsgDic setObject:[NSString stringWithFormat:@"%i",number] forKey:@"number"];
                            
                            [self updateToObtainTheSpecified:@"userMsg" Data:userMsgDic];
                            [self forceBankingDisinfectJudicial:newDic];
                            
                        }
                    }else{
                        [userMsgDic setObject:newDic[@"id"] forKey:@"id"];
                        [userMsgDic setObject:@"1" forKey:@"number"];
                        [self updateToObtainTheSpecified:@"userMsg" Data:userMsgDic];
                        [self forceBankingDisinfectJudicial:newDic];
                    }
                }
            }
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}

#pragma 懒加载

- (UIImageView *)bjfw_icon{
    if (!_bjfw_icon) {
        _bjfw_icon = [UIImageView getUIImageView:@"supernovaNestlingCuff"];
    }
    return _bjfw_icon;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self prodigyLabyrinthine];
    [self balloonMassacre];
    [self garbageCrescendoBrotherinlawDifficulty];
}

- (void)hhBannerView:(YMNsr_oView *)bannerView didSelectItemAtIndex:(NSInteger)index{
    

    
}


- (void)prodigyLabyrinthine{
    
    
    self.TitleArr = [NSArray arrayWithObjects:
                     @{@"name":@"在线收款",@"image":@"peculiarViewerConsequent"},
                     @{@"name":@"余额还款",@"image":@"profuseDrizzlyAbrogate"},
                     @{@"name":@"助力还款",@"image":@"marrySpite"},
                     @{@"name":@"邀请好友",@"image":@"inviolableAggressiveFlint"},
                     @{@"name":@"会员中心",@"image":@"commerceForbiddingCutter"},
                     @{@"name":@"使用说明",@"image":@"temperaturePaw"}, nil];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, DEVICE_HEIGHT));
        make.left.top.offset(0);
    }];
    
    
    [self.scrollView addSubview:self.top_imageView];
    [self.top_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 63 + kTopHeight));
        make.top.right.left.offset(0);
    }];
    [self.scrollView addSubview:self.top_icon];
    [self.top_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.top.equalTo(self.top_imageView.mas_top).offset(kTopHeight - 20);
        make.height.mas_equalTo(0);

    }];
    [self.scrollView addSubview:self.top_title];
    [self.top_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top_icon.mas_top).offset(10);
        
        make.centerX.equalTo(self.scrollView);
    }];
    
    [self.scrollView addSubview:self.top_content];
    [self.top_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top_title.mas_bottom).offset(10);
        make.centerX.equalTo(self.scrollView);

    }];
    

    UIButton *kfBtn = [UIButton new];
    [kfBtn setImage:[UIImage imageNamed:@"zoneNobilityChristian"] forState:UIControlStateNormal];
    [kfBtn bk_whenTapped:^{
        [self.xp_rootNavigationController pushViewController:[VFBTtRyb_7lController new] animated:YES];
    }];
    [self.scrollView addSubview:kfBtn];
    [kfBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top_imageView.mas_top).offset(kTopHeight-18);
        make.right.offset(-20.5);
        make.height.mas_equalTo(0);

    }];

    
    _Barner_view = [[UIView alloc]initWithFrame:CGRectMake(5, 63 + kTopHeight +5, DEVICE_WIDTH-10, 140)];
    
    [self.scrollView addSubview:self.Barner_view];
    
    
    
    
    
    
    
    self.gg_view = [[UIView alloc] init];
    self.gg_view.frame = CGRectMake(15,CGRectGetMaxY(_Barner_view.frame)+10,DEVICE_WIDTH-30,35.5);
    self.gg_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.gg_view.layer.shadowColor = [UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:0.15].CGColor;
    self.gg_view.layer.shadowOffset = CGSizeMake(0,2);
    self.gg_view.layer.shadowOpacity = 1;
    self.gg_view.layer.shadowRadius = 5;
    [self.scrollView addSubview:self.gg_view];
    
    
    [self.gg_view bk_whenTapped:^{
        [self.xp_rootNavigationController pushViewController:[EIjkdKnerl_vowController new] animated:YES];
    }];
    
    
    [self.gg_view addSubview:self.gg_icon];
    [self.gg_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.centerY.equalTo(self.gg_view);
        make.left.offset(13);
    }];
    [self.gg_view addSubview:self.gg_title];
    [self.gg_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(40);
        make.centerY.equalTo(self.gg_view);
        make.left.equalTo(self.gg_icon.mas_right).offset(8);
    }];
    [self.gg_view addSubview:self.gg_more];
    [self.gg_more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(55);
        make.centerY.equalTo(self.gg_view);
        make.right.offset(-13);
    }];
    [self.gg_view addSubview:self.gg_content];
    [self.gg_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.gg_view);
        make.height.offset(34);
        make.left.equalTo(self.gg_title.mas_right).offset(8);
        make.right.equalTo(self.gg_more.mas_left).offset(-8);
    }];
    
    [self.scrollView addSubview:self.Views];
    [self.Views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.top.equalTo(self.gg_view.mas_bottom).offset(10);
        make.left.offset(0);
    }];
    
    [self.scrollView addSubview:self.bjfw_icon];
    [self.bjfw_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(23);
        make.top.equalTo(self.Views.mas_bottom).offset(20);
    }];
    
    [self.scrollView addSubview:self.bjfw_title];
    [self.bjfw_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bjfw_icon);
        make.left.equalTo(self.bjfw_icon.mas_right).offset(8);
    }];
    
    [self.scrollView addSubview:self.bjfw_left_img];
    [self.bjfw_left_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((DEVICE_WIDTH-33)/2, Ratio(74.5)));
        make.top.equalTo(self.bjfw_icon.mas_bottom).offset(15);
        make.left.offset(11);
    }];
    [self.scrollView addSubview:self.bjfw_right_img];
    [self.bjfw_right_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((DEVICE_WIDTH-33)/2, Ratio(74.5)));
        make.top.equalTo(self.bjfw_icon.mas_bottom).offset(15);
        make.right.offset(-11);
    }];
    
    [self.scrollView addSubview:self.bjfw_bottom_img];
    [self.bjfw_bottom_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, Ratio(107)));
        make.top.equalTo(self.bjfw_left_img.mas_bottom).offset(10);
        make.left.offset(15);
    }];
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    _scrollView.contentSize = CGSizeMake(DEVICE_WIDTH, CGRectGetMaxY(self.bjfw_bottom_img.frame)+kTopHeight);
    
    
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



- (UIView *)Views{
    if (!_Views) {
        _Views = [UIView new];
        CGFloat X = 20;
        CGFloat Y = 8;
        for (int i = 0; i < _TitleArr.count; i++) {
            if (i%3 == 0 && i > 0) {
                X = 20;
                Y += 75;
            }
            
            NSDictionary *dic = _TitleArr[i];
            
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor whiteColor];
            view.userInteractionEnabled = YES;
            [view bk_whenTapped:^{
                [self cerebralSkipDisquisition:i];
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
            title.textColor = [UIColor blackColor];
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
            
            X = X + 20 + ((DEVICE_WIDTH-80)/3);

        }
    }
    return _Views;
}

- (void)conferenceCrayon:(NSMutableArray *)barnerArr{
    
    YMNsr_oView * BarnerView = [[YMNsr_oView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH-10, 140) WithBannerSource:NinaBannerStyleOnlyWebSource WithBannerArray:barnerArr];
    BarnerView.timeInterval = 2;
    BarnerView.showPageControl = YES;
    BarnerView.delegate = self;
    BarnerView.layer.shadowRadius = 5;
    [self.Barner_view addSubview: BarnerView];
    
}


- (void)forceBankingDisinfectJudicial:(NSDictionary *)msgDic{
    NYLk_DfTView *trading = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NYLk_DfTView class]) owner:nil options:nil] lastObject];
    trading.width = DEVICE_WIDTH - 40;
    trading.msgtitle_lab.text = [NSString stringWithFormat:@"%@",msgDic[@"title"]];
    trading.msg_lab.text = [msgDic[@"msg"] stringByReplacingOccurrencesOfString:@"&" withString:@"\n"];
    trading.height = 350;
    
    LSTPopView *popView = [LSTPopView initWithCustomView:trading
                                                  popStyle:LSTPopStyleSpringFromTop
                                              dismissStyle:LSTDismissStyleSmoothToTop];
    LSTPopViewWK(popView)
    [trading.clean_btn bk_whenTapped:^{
        [wk_popView dismiss];
    }];
    [popView pop];
}


- (void)hereticalDegenerateMapleExit:(NSDictionary *)data{
    EYrxYlf_LWView *trading = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([EYrxYlf_LWView class]) owner:nil options:nil] lastObject];
    trading.width = DEVICE_WIDTH - 40;
    trading.title_lab.text = [NSString stringWithFormat:@"V%@",data[@"iosVersion"]];
    
    double H = 0;
    if ([data[@"iosContent"] length] > 0) {
        trading.content_lab.text =  [data[@"iosContent"] stringByReplacingOccurrencesOfString:@"&" withString:@"\n"];
        H = [trading.content_lab.text heightWithFontSize:12 width:DEVICE_WIDTH - 205];
    }else{
        trading.content_lab.text = @"1、新版本修复了一些BUG 2、优化了一部分功能";
    }
    
    trading.height = 350 + H;
    
    
    
    LSTPopView *popView = [LSTPopView initWithCustomView:trading
                                                  popStyle:LSTPopStyleSpringFromTop
                                              dismissStyle:LSTDismissStyleSmoothToTop];
    LSTPopViewWK(popView)
    [trading.upgrade_btn bk_whenTapped:^{
        [wk_popView dismiss];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:data[@"iosUrl"]] options:@{} completionHandler:nil];
    }];
    [popView pop];
    
}


- (UIImageView *)bjfw_right_img{
    if (!_bjfw_right_img) {
        _bjfw_right_img = [UIImageView getUIImageView:@"vestEviscerate"];
        _bjfw_right_img.userInteractionEnabled = YES;
        [_bjfw_right_img bk_whenTapped:^{
            MKCQlvth_NiController * vc = [[MKCQlvth_NiController alloc]init];
            vc.url = @"http://h5.bjyoushengkj.com/wechat/pages/wailian/wailian.html?merCode=aa9db42d3372495897ee5a4f8a117a16";
            vc.navTitle = @"在线办卡";
            [self.xp_rootNavigationController pushViewController:vc animated:YES];
        
        }];
    }
    return _bjfw_right_img;
}

- (UIView *)Barner_view{
    if (!_Barner_view) {
        _Barner_view = [UIView new];
    }
    return _Barner_view;
}

- (UIImageView *)top_imageView{
    if (!_top_imageView) {
        _top_imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"endangerJoyful"]];
        _top_imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _top_imageView;
}

- (UIImageView *)gg_icon{
    if (!_gg_icon) {
        _gg_icon = [UIImageView getUIImageView:@"barelyBreach"];
    }
    return _gg_icon;
}

- (UILabel *)gg_title{
    if (!_gg_title) {
        _gg_title = [UILabel new];
        _gg_title.textColor = [UIColor colorWithRed:254/255.0 green:146/255.0 blue:19/255.0 alpha:1.0];
        _gg_title.text = @"公告";
        _gg_title.font = [UIFont getUIFontSize:15 IsBold:YES];
        _gg_title.textColor = [UIColor colorWithHexString:@"#1A1A4B"];
        _gg_title.numberOfLines = 0;
        
    }
    return _gg_title;
}

- (UIImageView *)bjfw_bottom_img{
    if (!_bjfw_bottom_img) {
        _bjfw_bottom_img = [UIImageView getUIImageView:@"nineteenExtracurricularAccomplish"];
        _bjfw_bottom_img.layer.cornerRadius = 5;
        _bjfw_bottom_img.userInteractionEnabled = YES;
        [_bjfw_bottom_img bk_whenTapped:^{
            
            JJgkxpLom_PController * vc = [[JJgkxpLom_PController alloc]init];
            vc.img = [UIImage imageNamed:@"multiplicitySexuality"];
            vc.navTitle = @"停息挂帐";
            [self.xp_rootNavigationController pushViewController:vc animated:YES];

        }];
    }
    return _bjfw_bottom_img;
}

- (UILabel *)top_content{
    if (!_top_content) {
        _top_content = [UILabel new];
        _top_content.text = @"您的智能管家";
        _top_content.textAlignment = NSTextAlignmentLeft;
        _top_content.font = [UIFont getUIFontSize:16 IsBold:YES];
        _top_content.textColor = [UIColor whiteColor];
    }
    return _top_content;
}


- (UILabel *)top_title{
    if (!_top_title) {
        _top_title = [UILabel new];
        _top_title.text = @"小卡生活";
        _top_title.font = [UIFont getUIFontSize:18 IsBold:YES];
        _top_title.textColor = [UIColor whiteColor];
    }
    return _top_title;
}

@end
