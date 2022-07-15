
#import "NAHlInimc_TController.h"
#import "IDoXkynm_6FController.h"
#define ZhengMian @"身份证正面"
#define FanMian   @"身份证反面"
@interface NAHlInimc_TController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    BOOL isSFZz;
    BOOL isSFZf;
}
@property (weak, nonatomic) IBOutlet UIImageView *left_IdCard;
@property (weak, nonatomic) IBOutlet UIImageView *right_IdCard;
@property (weak, nonatomic) IBOutlet UITextField *Customer_name;
@property (weak, nonatomic) IBOutlet UITextField *Customer_IdCard;
@property (weak, nonatomic) IBOutlet UITextField *Customer_CashCard;
@property (weak, nonatomic) IBOutlet UITextField *Customer_WhereItIs;
@property (weak, nonatomic) IBOutlet UITextField *Customer_phoneNumber;

@property (assign , nonatomic) NSString* zhengmianfanmian;

@property (strong, nonatomic) NPYCly_J *cardNoFormatter;

@property (nonatomic , strong) NSString *provinceAddress;
@property (nonatomic , strong) NSString *cityAddress;

@end

@implementation NAHlInimc_TController


- (void)kinFourth{
    @weakify(self);
    [self addLocationManager:^(NSString * _Nonnull province, NSString * _Nonnull city) {
        weak_self.provinceAddress = province;
        weak_self.cityAddress = city;
        weak_self.Customer_WhereItIs.text = [NSString stringWithFormat:@"%@-%@",province,city];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"客户信息";
    self.view.backgroundColor = [UIColor whiteColor];
    
    isSFZz = NO;
    isSFZf = NO;
    self.provinceAddress = @"";
    self.cityAddress = @"";
    [self firebrandEncipherPenumbra];
    [self kinFourth];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.tag == 400) {
        return NO;
    }
    return YES;
}


- (NPYCly_J *)cardNoFormatter {
    if(_cardNoFormatter == nil) {
        _cardNoFormatter = [[NPYCly_J alloc] init];
    }
    return _cardNoFormatter;
}
#pragma mark Delegate

-(void)fabricateCongeal:(UIImage *)img{
    @weakify(self);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:img forKey:@"file"];
    [params setValue:self.empowerToken forKey:@"empowerToken"];
    [self NetWorkingPostWithImageURL:self hiddenHUD:NO url:@"/api/user/ocr/front/upload" Params:params success:^(id  _Nonnull responseObject) {
        NSDictionary *data = responseObject[@"data"];
        
        if ([responseObject[@"code"] intValue] == 0) {
            self->isSFZz = YES;
            weak_self.Customer_name.text = data[@"name"];
            weak_self.Customer_IdCard.text = data[@"number"];
            weak_self.left_IdCard.image = img;
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        [ZIONf_d showBottomWithText:error];
    }];
    
    
}

-(void)germicideEmptinessClog:(NSString *)zhengfan{
    self.zhengmianfanmian = zhengfan;
    
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
#pragma mark -----------点击上传身份证正面照片---------------

-(void)surveyorDigest{
    [self germicideEmptinessClog:FanMian];
}
#pragma mark -----------向服务器上传身份证正面---------------

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        if ([self.zhengmianfanmian isEqualToString:ZhengMian]) {
            
            [self fabricateCongeal:image];
        }else{
            
            [self tragedienneGripeSolid:image];
        }
    }
}
#pragma mark -----------点击上传身份证反面照片---------------

-(void)tragedienneGripeSolid:(UIImage *)img{
    @weakify(self);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:img forKey:@"file"];
    [params setValue:self.empowerToken forKey:@"empowerToken"];
    [self NetWorkingPostWithImageURL:self hiddenHUD:YES url:@"/api/user/ocr/back/upload" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            self->isSFZf = YES;
            weak_self.right_IdCard.image = img;
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        [ZIONf_d showBottomWithText:error];
    }];
    

}
#pragma mark -----------向服务器上传身份证反面---------------

-(void)regretfullyEighthUnanimous{
    [self germicideEmptinessClog:ZhengMian];
}
#pragma 调起地址选择

- (void)firebrandEncipherPenumbra{
    
    if (DEVICE_WIDTH > 375) {
        self.left_with.constant = 30;
        self.right_with.constant = 30;
    }
    [self.left_IdCard bk_whenTapped:^{
        [self regretfullyEighthUnanimous];
    }];
    [self.right_IdCard bk_whenTapped:^{
        [self surveyorDigest];
    }];
    [self.Customer_WhereItIs bk_whenTapped:^{
        [self rectificationWheneverUndeservedPint];
    }];
    self.Customer_phoneNumber.delegate = self;
    self.Customer_phoneNumber.tag = 500;
    self.Customer_CashCard.delegate = self;
    self.Customer_CashCard.tag = 300;
    self.Customer_WhereItIs.delegate = self;
    self.Customer_WhereItIs.tag = 400;
    self.Customer_IdCard.delegate = self;
    self.Customer_IdCard.tag = 200;
    
    self.Customer_IdCard.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
    self.Customer_CashCard.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
    self.Customer_phoneNumber.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
    
    
}
#pragma 获取定位地址

- (void)misconstrueBeg{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.Customer_name.text forKey:@"fullname"];
    [params setValue:[self.Customer_CashCard.text RemoveTheBlankSpace:self.Customer_CashCard.text] forKey:@"bankcard"];
    [params setValue:self.Customer_WhereItIs.text forKey:@"provinceCity"];
    [params setValue:self.Customer_phoneNumber.text forKey:@"phone"];
    [params setValue:self.empowerToken forKey:@"empowerToken"];
    
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/bind/debit/card" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
            
            NSNotification *LoseResponse = [NSNotification notificationWithName:@"RefreshCustomerTable" object:nil];
            [[NSNotificationCenter defaultCenter] postNotification:LoseResponse];
            
            [self.xp_rootNavigationController popViewControllerAnimated:YES];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        [ZIONf_d showBottomWithText:error];
    }];
}
- (IBAction)确认添加:(id)sender {
    
    
    if (!isSFZz) {
        [ZIONf_d showBottomWithText:@"请上传身份证正面照"];
        return;
    }
    
    if (!isSFZf) {
        [ZIONf_d showBottomWithText:@"请上传身份证反面照"];
        return;
    }
    
    if ([self.Customer_name.text isEqualToString:@""]) {
        [ZIONf_d showBottomWithText:@"请输入正确的姓名"];
        return;
    }
    
    if ([self.Customer_IdCard.text isEqualToString:@""] || [self.Customer_IdCard.text length] != 18) {
        [ZIONf_d showBottomWithText:@"请输入正确的身份证号"];
        return;
    }
    if([NSString isBlankString:self.Customer_name.text]){
        [ZIONf_d showBottomWithText:@"姓名不能为空"];
        return;
    }
    if([NSString isBlankString:self.Customer_IdCard.text]){
        [ZIONf_d showBottomWithText:@"身份证号不能为空"];
        return;
    }
    if([NSString isBlankString:self.Customer_CashCard.text]){
        [ZIONf_d showBottomWithText:@"储蓄卡号不能为空"];
        return;
    }
    if([NSString isBlankString:self.Customer_WhereItIs.text]){
        [ZIONf_d showBottomWithText:@"开卡户地不能为空"];
        return;
    }
    if([NSString isBlankString:self.Customer_phoneNumber.text]){
        [ZIONf_d showBottomWithText:@"手机号不能为空"];
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.Customer_name.text forKey:@"fullname"];
    [params setValue:self.Customer_IdCard.text forKey:@"idcard"];
    [params setValue:self.empowerToken forKey:@"empowerToken"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/user/idcard/update" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            [self misconstrueBeg];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        [ZIONf_d showBottomWithText:error];
    }];
    
}


- (void)rectificationWheneverUndeservedPint{
    
    ZZCEkpLfibp_WvjView *PickerView = [[ZZCEkpLfibp_WvjView alloc]init];
    PickerView.provinceAddress = self.provinceAddress;
    PickerView.cityAddress = self.cityAddress;
    
    PickerView.Block = ^(NSDictionary *startDic, NSDictionary *endDic) {
        self.Customer_WhereItIs.text = [NSString stringWithFormat:@"%@-%@",startDic[@"name"],endDic[@"name"]];
    };
    [PickerView show];
}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField.tag == 500 && textField.text.length > 10 && ![string isEqualToString:@""]){
        return NO;
    }
    else if(textField.tag == 200 && textField.text.length > 17 && ![string isEqualToString:@""]){
        return NO;
    }
    else if (textField.tag == 300){
        [self.cardNoFormatter bankNoField:textField shouldChangeCharactersInRange:range replacementString:string];
        return NO;
    }
    return YES;
}

@end
