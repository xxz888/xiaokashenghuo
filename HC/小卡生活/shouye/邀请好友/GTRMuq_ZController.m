
#import "GTRMuq_ZController.h"

@interface GTRMuq_ZController ()

@end

@implementation GTRMuq_ZController


- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (!error) {
        [ZIONf_d showBottomWithText:@"保存成功"];
    }
}


#pragma 获取版本信息

- (void)saveAction:(id)tap{
        [self.content_image setNeedsLayout];
        [self.content_image layoutIfNeeded];
        UIImage *image = [self.view captureImageFromView:self.content_view];
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum: didFinishSavingWithError: contextInfo:), nil);
}



- (void)siliconStrawWalrusTaxi{

    
    [self.bg_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.offset(-KBottomHeight);
    }];
    [self.navigation_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 44));
        make.top.equalTo(self.bg_image.mas_top).offset(kStatusBarHeight);
        make.left.equalTo(self.view);
    }];
    [self.nav_back setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
    [self.nav_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.centerY.equalTo(self.navigation_View);
    }];
    [self.nav_back bk_whenTapped:^{
        [self.xp_rootNavigationController popViewControllerAnimated:YES];
    }];
    
    [self.content_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.offset(-KBottomHeight);
    }];
    [self.content_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);

    }];

    
    [self.QrCode_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 150));
        make.top.equalTo(self.content_image.mas_top).offset(RatioH(480));
        make.left.equalTo(self.view).offset(20);

    }];
    
    
    
    [self.baocun_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(260, 40));
        make.top.equalTo(self.content_image.mas_bottom).offset(200);
        make.centerX.equalTo(self.content_image);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(saveAction:)];

    [self.QrCode_img addGestureRecognizer:tap];
    
}

- (void)memorialIndebtednessScienceAbility{
    
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/user/app/config/get" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            NSDictionary * data= responseObject[@"data"];
            
            NSDictionary *UserData = [self loadUserData];
            NSString *str = [NSString stringWithFormat:@"%@?brandId=%@&userId=%@",data[@"shareUrl"],brandId,UserData[@"id"]];
            
            self.QrCode_img.image = [UIImage createQRCodeWithTargetString:str logoImage:nil];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self siliconStrawWalrusTaxi];
    [self memorialIndebtednessScienceAbility];
}

@end
