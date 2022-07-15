
#import "VJFwoMliyr_pLqController.h"
#import "WTHg_bqCell.h"
#import "DHSDpnz_x3.h"
#import "LBqzg_LczView.h"
@interface VJFwoMliyr_pLqController ()<UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic , strong) UIImageView *top_imageView;
@property (nonatomic , strong) UILabel *top_lab;

@property (nonatomic , strong) UIView *top_view;
@property (nonatomic , strong) UITableView *top_TableView;
@property (nonatomic , strong) NSMutableArray *top_dataArr;

@property (nonatomic , strong) UIView *bottom_view;
@property (nonatomic , strong) UITableView *bottom_TableView;
@property (nonatomic , strong) NSMutableArray *bottom_dataArr;

@property (nonatomic , strong) UILabel *tishi_lab;
@property (strong, nonatomic)  UIButton *finishBtn;
@property (nonatomic , strong) NSDictionary *creditCard;
@end

@implementation VJFwoMliyr_pLqController


-(UILabel *)tishi_lab{
    if(!_tishi_lab){
        _tishi_lab = [UILabel new];
        _tishi_lab.text = @"注: 1.同一张卡每天只能绑定五次，如有失败请第二天尝试\n       2.暂不支持借贷合—卡制定还款计划  ";
        _tishi_lab.numberOfLines = 2;
        [UILabel getToChangeTheLabel:_tishi_lab TextColor:[UIColor colorWithHexString:@"#999999"] TextFont:[UIFont getUIFontSize:12 IsBold:NO]];

        _tishi_lab.attributedText = [UILabel setupAttributeString:_tishi_lab.text rangeText:@"注:" textColor:[UIColor colorWithHexString:@"#1A1A4B"] textFont:[UIFont getUIFontSize:15 IsBold:YES]];
        
        
    }
    return _tishi_lab;
}
#pragma 首绑红包弹窗

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"添加信用卡";
    self.top_dataArr = [NSMutableArray array];
    self.bottom_dataArr = [NSMutableArray array];
    [self chortleProfitableDwelling];
    
    
}
#pragma 添加信用卡

- (void)marxismSore:(UIImage *)image{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:image forKey:@"file"];
    
    [self NetWorkingPostWithImageURL:self hiddenHUD:NO url:@"/api/user/ocr/bankcard" Params:params success:^(id  _Nonnull responseObject){
        if ([responseObject[@"code"] intValue] == 0) {
            NSDictionary *data = responseObject[@"data"];
            if ([[data allKeys] containsObject:@"card_type"]) {
                if ([data[@"card_type"] isEqualToString:@"贷记卡"]) {
                    self.creditCard = [NSDictionary dictionaryWithDictionary:data];
                    [self bibliographyMiddling];
                }else{
                    [ZIONf_d showBottomWithText:@"请用信用卡识别"];
                }
            }else{
                [ZIONf_d showBottomWithText:@"识别错误，请重试！"];
            }
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        [ZIONf_d showBottomWithText:error];
    }];
    
}
#pragma 判断数据为空

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
#pragma 识别信用卡图片

-(UILabel *)top_lab{
    if(!_top_lab){
        _top_lab = [UILabel new];
        _top_lab.text = @"信息加密处理，仅用于银行验证，请验证您本人的银行卡";
        _top_lab.textAlignment = NSTextAlignmentCenter;
        _top_lab.numberOfLines = 2;
        [UILabel getToChangeTheLabel:_top_lab TextColor:[UIColor blackColor] TextFont:[UIFont getUIFontSize:12 IsBold:NO]];
    }
    return _top_lab;
}
#pragma 得到信用卡数据

- (BOOL)slakePen:(NSArray *)arr{
    for (int i = 0 ; i < arr.count; i++) {
        DHSDpnz_x3 *model = arr[i];
        
        if (model.content.length == 0) {
            [ZIONf_d showBottomWithText:[NSString stringWithFormat:@"%@不能为空",model.name]];
            return NO;
        }
        if ([model.name isEqualToString:@"有效期"]) {
            NSString *str = [model.content substringToIndex:2];
            if([str integerValue] > 12){
                [ZIONf_d showBottomWithText:@"有效期格式错误"];
                return NO;
            }
        }
    }
    return YES;
}



- (void)bibliographyMiddling{
    
    DHSDpnz_x3 *model1 = self.top_dataArr[1];
    model1.content = self.creditCard[@"card_number"];
    [self.top_TableView reloadData];
}
#pragma mark Delegate

- (UIImageView *)top_imageView{
    if (!_top_imageView) {
        _top_imageView = [UIImageView getUIImageView:@"amendmentCaissonOvoid"];
    }
    return _top_imageView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"WTHg_bqCell";
    WTHg_bqCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"WTHg_bqCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.index = indexPath;
    
    
    cell.model = tableView.tag == 100 ? self.top_dataArr[indexPath.row] : self.bottom_dataArr[indexPath.row];
    
  
    if ([cell.model.name containsString:@"日"]) {
        
        
        [cell.content_textfield bk_whenTapped:^{
            
            [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
            
            DEig_IZView *dateView = [[DEig_IZView alloc]initWithDateStyle:DateStyleShowOtherString CompleteBlock:^(NSDate *Data, NSString *Str, id OtherString) {
                cell.content_textfield.text = Str;
                cell.model.content = Str;
            }];
            NSMutableArray *arr = [NSMutableArray array];
            for (int i = 0; i < 31; i++) {
                [arr addObject:[NSString stringWithFormat:@"%i",i+1]];
            }
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy"];
            NSString *strDate = [dateFormatter stringFromDate:[NSDate new]];
            
            dateView.showYearViewMax = strDate;
            dateView.MyearArray = arr;
            [dateView show];
        }];
    }
    
    
    
    [cell.right_btn bk_whenTapped:^{
        [self dieselDailyAcquittalYet];
    }];
    
    return cell;
}
#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)chortleProfitableDwelling{
    
    NSArray *data = [NSMutableArray arrayWithObjects:@"持卡人",@"卡号",@"预留手机号", nil];
    for (int i = 0; i < data.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data[i];
        model.placeholder = [NSString stringWithFormat:@"请输入%@",data[i]];
        
        if ([data[i] isEqualToString:@"持卡人"]) {
            
            if (self.empowerToken.length > 0) {
                model.content = self.customer_Name;
            }else{
                
                NSDictionary *UserData = [self loadUserData];
                model.content = [NSString stringWithFormat:@"%@",UserData[@"fullname"]];
            }
        }
        
        
        [self.top_dataArr addObject:model];
    }
    
    NSArray *data1 = [NSMutableArray arrayWithObjects:@"有效期",@"安全码",@"账单日",@"还款日", nil];
    for (int i = 0; i < data1.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data1[i];
        if ([data1[i] isEqualToString:@"有效期"]) {
            model.placeholder = @"请输入有效期(如09/22输入0922)";
        }else if ([data1[i] isEqualToString:@"安全码"]){
            model.placeholder = @"请输入安全码后三位数";
        }else{
            model.placeholder = [NSString stringWithFormat:@"请选择%@",data1[i]];
        }
        
        [self.bottom_dataArr addObject:model];
    }
    
    
    
    [self.view addSubview:self.top_imageView];
    [self.top_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 46));
        make.top.left.offset(0);
    }];
    [self.view addSubview:self.top_lab];
    [self.top_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 40));
        make.center.equalTo(self.top_imageView);
    }];
    
    
    [self.view addSubview:self.top_view];
    [self.top_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.equalTo(self.top_imageView.mas_bottom).offset(15);
        make.height.offset(self.top_dataArr.count * 50);
    }];
    
    self.top_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.top_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.top_view.layer.shadowOpacity = 0.2;
    self.top_view.layer.shadowRadius = 3;
    self.top_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.top_view.layer.cornerRadius = 10;
    
    self.top_TableView.layer.cornerRadius = 10;
    [self.top_view addSubview:self.top_TableView];
    [self.top_TableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
    
    [self.view addSubview:self.bottom_view];
    [self.bottom_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.equalTo(self.top_view.mas_bottom).offset(15);
        make.height.offset(self.bottom_dataArr.count * 50);
    }];
    
    self.bottom_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.bottom_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.bottom_view.layer.shadowOpacity = 0.2;
    self.bottom_view.layer.shadowRadius = 3;
    self.bottom_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bottom_view.layer.cornerRadius = 10;
    
    self.bottom_TableView.layer.cornerRadius = 10;
    [self.bottom_view addSubview:self.bottom_TableView];
    [self.bottom_TableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
    
    [self.view addSubview:self.tishi_lab];
    [self.tishi_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-40, 46));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.bottom_view.mas_bottom).offset(8);
    }];
    
    [self.view addSubview:self.finishBtn];
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 46));
        make.left.offset(15);
        make.top.equalTo(self.tishi_lab.mas_bottom).offset(40);
    }];
    
    
}

- (UIView *)top_view{
    if (!_top_view) {
        _top_view = [UIView new];
    }
    return _top_view;
}

- (UIView *)bottom_view{
    if (!_bottom_view) {
        _bottom_view = [UIView new];
    }
    return _bottom_view;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {}


- (void)transshipAwardPreclude{
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.top_dataArr];
    [arr addObjectsFromArray:self.bottom_dataArr];
    if (![self slakePen:arr]) {
        return;
    }

    DHSDpnz_x3 *model0 = self.top_dataArr[0];
    DHSDpnz_x3 *model1 = self.top_dataArr[1];
    DHSDpnz_x3 *model2 = self.top_dataArr[2];
    DHSDpnz_x3 *model3 = self.bottom_dataArr[0];
    DHSDpnz_x3 *model4 = self.bottom_dataArr[1];
    DHSDpnz_x3 *model5 = self.bottom_dataArr[2];
    DHSDpnz_x3 *model6 = self.bottom_dataArr[3];


    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:isCardName([self.creditCard[@"bank_name"] stringValue]) forKey:@"bankName"];
    [params setValue:model0.content forKey:@"fullname"];
    [params setValue:[model1.content RemoveTheBlankSpace:model1.content] forKey:@"bankcard"];
    [params setValue:model2.content forKey:@"phone"];
    [params setValue:model3.content forKey:@"expiredTime"];
    [params setValue:model4.content forKey:@"securityCode"];
    [params setValue:model5.content forKey:@"billDay"];
    [params setValue:model6.content forKey:@"repaymentDay"];
    
    if (self.empowerToken.length > 0) {
        [params setValue:self.empowerToken forKey:@"empowerToken"];
    }
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/bind/credit/card" Params:params success:^(id  _Nonnull responseObject){
        if ([responseObject[@"code"] intValue] == 0) {
            if([responseObject[@"message"] isEqualToString:@"first"] && [NSString isBlankString:self.empowerToken]){
                [self stayTechnical];
            }else{
                if (self.empowerToken.length > 0) {
                    
                    
                    NSNotification *LoseResponse = [NSNotification notificationWithName:@"RefreshCustomerCardTable" object:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:LoseResponse];
                }else{
                    
                    NSNotification *LoseResponse = [NSNotification notificationWithName:@"RefreshCardTable" object:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:LoseResponse];
                }
                
                [self.xp_rootNavigationController popViewControllerAnimated:YES];
                [ZIONf_d showBottomWithText:responseObject[@"message"]];
            }
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        [ZIONf_d showBottomWithText:error];
    }];

}
#pragma 懒加载

- (void)stayTechnical{
    
    LBqzg_LczView *trading = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LBqzg_LczView class]) owner:nil options:nil] lastObject];
    
    LSTPopView *popView = [LSTPopView initWithCustomView:trading
                                                  popStyle:LSTPopStyleSpringFromTop
                                              dismissStyle:LSTDismissStyleSmoothToTop];
    LSTPopViewWK(popView)
    popView.bgClickBlock = ^{
        
        NSNotification *LoseResponse = [NSNotification notificationWithName:@"RefreshCardTable" object:nil];
        [[NSNotificationCenter defaultCenter] postNotification:LoseResponse];
        [self.xp_rootNavigationController popViewControllerAnimated:YES];
        [wk_popView dismiss];
    };
    [popView pop];
}

- (UITableView *)bottom_TableView{
    if (!_bottom_TableView) {
        _bottom_TableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _bottom_TableView.delegate = self;
        _bottom_TableView.dataSource = self;
        _bottom_TableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _bottom_TableView.backgroundColor = [UIColor whiteColor];
        [_bottom_TableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _bottom_TableView.showsVerticalScrollIndicator = NO;
        _bottom_TableView.scrollEnabled = NO;
        _bottom_TableView.tag = 200;
    }
    return _bottom_TableView;
}


- (void)dieselDailyAcquittalYet{

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        [self presentViewController:imagePickerController animated:YES completion:nil];
        if(![self CameraPermissions]) return;
    }];
    UIAlertAction *picture = [UIAlertAction actionWithTitle:@"选择照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        }
        pickerImage.delegate = self;
        pickerImage.allowsEditing = NO;
        [self presentViewController:pickerImage animated:YES completion:nil];
    }];
    [alertVc addAction:cancle];
    [alertVc addAction:camera];
    [alertVc addAction:picture];
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        [self marxismSore:image];
    }
}


- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"balloonOstentatious"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"确定添加" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_finishBtn bk_whenTapped:^{
            [self transshipAwardPreclude];
        }];
    }
    return _finishBtn;
}


- (UITableView *)top_TableView{
    if (!_top_TableView) {
        _top_TableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _top_TableView.delegate = self;
        _top_TableView.dataSource = self;
        _top_TableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _top_TableView.backgroundColor = [UIColor whiteColor];
        [_top_TableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _top_TableView.showsVerticalScrollIndicator = NO;
        _top_TableView.scrollEnabled = NO;
        _top_TableView.tag = 100;
    }
    return _top_TableView;
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 100) {
        return self.top_dataArr.count;
    }else{
        return self.bottom_dataArr.count;
    }
    
}


@end
