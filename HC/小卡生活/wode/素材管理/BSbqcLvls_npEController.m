
#import "BSbqcLvls_npEController.h"

@interface BSbqcLvls_npEController ()<UIGestureRecognizerDelegate>

@end

@implementation BSbqcLvls_npEController


- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (!error) {
        [ZIONf_d showBottomWithText:@"保存成功"];
    }
}


#pragma 获取版本信息

- (void)blightedSartorialWiggle{
    
    
    UILongPressGestureRecognizer *gesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressGestures:)];
    gesture.minimumPressDuration = 1.f;
    gesture.numberOfTouchesRequired = 1;
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
    
    [self.bg_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
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
    
    [self.bottom_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bg_image.mas_bottom);
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
    }];
    
    [self.bottom_left_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(15);
        make.bottom.offset(-15);
    }];
    [self.bottom_left_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
    }];
    
    [self.bottom_left_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottom_left_icon.mas_bottom).offset(5);
        make.centerX.equalTo(self.bottom_left_icon);
        make.bottom.offset(0);
    }];
    
    [self.bottom_center_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(123);
        make.centerY.equalTo(self.bottom_view);
        make.left.equalTo(self.bottom_left_view.mas_right).offset(28);
    }];
    
    [self.bottom_right_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(62, 62));
        make.centerY.equalTo(self.bottom_view);
        make.right.offset(-25);
    }];
    
    [self.bottom_right_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(42);
        make.centerY.equalTo(self.bottom_view);
        make.right.equalTo(self.bottom_right_image.mas_left).offset(-25);
    }];
    
}
- (void) handleLongPressGestures:(UILongPressGestureRecognizer *)paramSender{
    if (paramSender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始长按");
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"保存到相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self.navigation_View setHidden:YES];
            UIImage *image = [self.view captureImageFromView:self.view];
            
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum: didFinishSavingWithError: contextInfo:), nil);
        }];
        UIAlertAction *identifyAction = [UIAlertAction actionWithTitle:@"识别二维码" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            CIContext *context = [[CIContext alloc] init];
            
            CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy: CIDetectorAccuracyLow}];
            
            CIImage *imageCI = [[CIImage alloc] initWithImage:self.bottom_right_image.image];
            NSArray *features = [detector featuresInImage:imageCI];
            CIQRCodeFeature *codef = (CIQRCodeFeature *)features.firstObject;
            if (codef.messageString.length > 0) {
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:codef.messageString] options:@{} completionHandler:nil];
            }
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:saveAction];
        [alert addAction:identifyAction];
        [alert addAction:cancelAction];

        [self presentViewController:alert animated:YES completion:nil];
    }else if (paramSender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"结束长按");
    } else if (paramSender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"长按发生改变");
    }
}

- (void)shackCropCircumstanceBit{
    
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/user/app/config/get" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            NSDictionary * data= responseObject[@"data"];
            
            NSDictionary *UserData = [self loadUserData];
            NSString *str = [NSString stringWithFormat:@"%@?brandId=%@&userId=%@",data[@"shareUrl"],brandId,UserData[@"id"]];
            
            self.bottom_right_image.image = [UIImage createQRCodeWithTargetString:str logoImage:nil];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self blightedSartorialWiggle];
    [self shackCropCircumstanceBit];
    

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

@end
