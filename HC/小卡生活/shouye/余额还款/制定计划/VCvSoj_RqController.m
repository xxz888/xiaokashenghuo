
#import "VCvSoj_RqController.h"

@interface VCvSoj_RqController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *icon_image;

@property (weak, nonatomic) IBOutlet UILabel *name_lab;
@property (weak, nonatomic) IBOutlet UILabel *number_lab;
@property (weak, nonatomic) IBOutlet UILabel *editor_lab;


@property (weak, nonatomic) IBOutlet UIView *content_view;
@property (weak, nonatomic) IBOutlet UITextField *zongjine_textfield;
@property (weak, nonatomic) IBOutlet UITextField *yue_textfield;
@property (weak, nonatomic) IBOutlet UITextField *NumberPay_textfield;
@property (weak, nonatomic) IBOutlet UIButton *point_left_btn;
@property (weak, nonatomic) IBOutlet UIButton *point_right_btn;
@property (weak, nonatomic) IBOutlet UITextField *address_lab;

@property (weak, nonatomic) IBOutlet UIButton *customDates_left_btn;
@property (weak, nonatomic) IBOutlet UIButton *customDates_right_btn;
@property (weak, nonatomic) IBOutlet UILabel *customDates_lab;

@property (weak, nonatomic) IBOutlet UILabel *zxfl_lab;
@property (weak, nonatomic) IBOutlet UILabel *zxfl_left;
@property (weak, nonatomic) IBOutlet UITextField *zxfl_right;
@property (weak, nonatomic) IBOutlet UIView *zxfl_view;

@property (weak, nonatomic) IBOutlet UIButton *custom_btn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bg_view_H;

@property (nonatomic , strong) NSMutableDictionary *params;

@property (nonatomic , strong) NSMutableArray * TheCustomArr;

@property (nonatomic , strong) NSString *provinceAddress;
@property (nonatomic , strong) NSString *cityAddress;

@end

@implementation VCvSoj_RqController


- (void)flailLitreRecorder:(NSString *)province City:(NSString *)city{
    
    [self getAddressThan:province City:city isThan:^(NSString * _Nonnull provinceCode, NSString * _Nonnull cityCode, BOOL isThan) {
        if (isThan) {
            [self.params setValue:provinceCode forKey:@"provinceCode"];
            [self.params setValue:cityCode forKey:@"cityCode"];
        }else{
            self.address_lab.text = @"";
        }
    }];
}



- (IBAction)ThePlanDetailsAction:(id)sender {
    

    
    NSDictionary *UserData = [self loadUserData];
    
    if([UserData[@"id"] stringValue].length == 0){
        [ZIONf_d showBottomWithText:@"用户ID不能为空"];
        return;
    }
    if([self.cardData[@"cardNo"] stringValue].length == 0){
        [ZIONf_d showBottomWithText:@"信用卡号不能为空"];
        return;
    }
    if(self.zongjine_textfield.text.length == 0){
        [ZIONf_d showBottomWithText:@"还款金额不能为空"];
        return;
    }
    if(self.yue_textfield.text.length == 0){
        [ZIONf_d showBottomWithText:@"卡余额不能为空"];
        return;
    }
    
    if([self.params[@"dayRepaymentCount"] stringValue] == 0){
        [ZIONf_d showBottomWithText:@"每日还款次数不能为空"];
        return;
    }
    
    if([self.params[@"provinceCode"] stringValue] == 0){
        [ZIONf_d showBottomWithText:@"消费地区不能为空"];
        return;
    }
    if([self.params[@"cityCode"] stringValue] == 0){
        [ZIONf_d showBottomWithText:@"消费地区不能为空"];
        return;
    }
    
    [self.params setValue:UserData[@"id"] forKey:@"userId"];
    [self.params setValue:brandId forKey:@"brandId"];
    
    [self.params setValue:self.cardData[@"cardNo"] forKey:@"creditCardNumber"];
    [self.params setValue:self.zongjine_textfield.text forKey:@"amount"];
    [self.params setValue:self.yue_textfield.text forKey:@"reservedAmount"];
    
    
    if(self.point_left_btn.selected){
        [self.params setValue:@"true" forKey:@"notPoint"];
    }else{
        [self.params setValue:@"false" forKey:@"notPoint"];
    }
    
    
    if(self.customDates_left_btn.selected){
    }else{
        if (self.TheCustomArr.count == 0) {
            [ZIONf_d showBottomWithText:@"请选择定制日期"];
            return;
        }
        [self.params setValue:self.TheCustomArr forKey:@"executeDate"];
    }
    
    if (self.empowerToken.length > 0) {
        
        [self.params setObject:self.empowerToken forKey:@"empowerToken"];
        
        
        [self.params setObject:self.zxfl_right.text forKey:@"addRate"];
        
        
        [self reconstituteTimorousPotentiate];
        
    }else{
        
        [self NetWorkingPostWithAddressURL:self hiddenHUD:YES url:@"/api/user/debit/card/def" Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
            if ([responseObject[@"code"] intValue] == 0) {
                [self reconstituteTimorousPotentiate];
            }else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"制定计划需要添加储蓄卡" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
                [alert addAction:[UIAlertAction actionWithTitle:@"去添加" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self.xp_rootNavigationController pushViewController:[DCht_SXController new] animated:YES];
                }]];
                [self presentViewController:alert animated:YES completion:nil];
            }
        } failure:^(NSString * _Nonnull error) {
            
        }];
    }
}

- (void)intertwinePlanetDisbarExamination{
    [self.NumberPay_textfield bk_whenTapped:^{
        
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        
        DEig_IZView *dateView = [[DEig_IZView alloc]initWithDateStyle:DateStyleShowOtherString CompleteBlock:^(NSDate *Data, NSString *Str, id OtherString) {
            
            self.NumberPay_textfield.text = Str;
            [self.params setValue:[Str stringByReplacingOccurrencesOfString:@"次" withString:@""] forKey:@"dayRepaymentCount"];
            
        }];
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObject:@"1次"];
        [arr addObject:@"2次"];
        [arr addObject:@"3次"];
        [arr addObject:@"4次"];
        [arr addObject:@"5次"];
        
        dateView.showYearViewMax = @"每日";
        dateView.MyearArray = arr;
        [dateView show];
    }];
}


- (void)reconstituteTimorousPotentiate{
    NSLog(@"制定计划参数：%@",self.params);
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/credit/create/plan/new" Params:self.params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            ZPXXxocm_CController *VC = [ZPXXxocm_CController new];
            VC.cardData = self.cardData;
            VC.MakePlanData = responseObject[@"data"];
            
            VC.empowerToken = self.empowerToken;
            VC.customer_Name = self.customer_Name;
            [self.xp_rootNavigationController pushViewController:VC animated:YES];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}



- (IBAction)TheDecimalPointAction:(UIButton *)sender {
    
    if (sender.tag == 100) {
        self.point_left_btn.selected = YES;
        self.point_right_btn.selected = NO;
    }else{
        self.point_left_btn.selected = NO;
        self.point_right_btn.selected = YES;
    }
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"制定计划";
    self.params = [NSMutableDictionary dictionary];
    [self.params setValue:@"2" forKey:@"dayRepaymentCount"];
    
    self.TheCustomArr = [NSMutableArray array];
    self.provinceAddress = @"";
    self.cityAddress = @"";
    [self shingleFoilIcy];
    [self blackballCatholicThankful];
}
- (NSString *)得到当前日期到传入日期区间:(NSInteger)days{
    NSDate *date = [NSDate new];
    NSInteger day =  [date day];
    NSInteger month = [date month];
    
    
    NSString *Str1 = [NSString stringWithFormat:@"%li/%li",month,day];
    NSString *Str2;
    
    if (day == days) {
        Str2 = [NSString stringWithFormat:@"%li/%li",month,day];
    }else if (day < days){
        Str2 =  [NSString stringWithFormat:@"%li/%li",month,days];
    }else{
        if (month == 12) {
            Str2 =  [NSString stringWithFormat:@"1/%li",days];
        }else{
            Str2 =  [NSString stringWithFormat:@"%li/%li",month+1,days];
        }
    }
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    
    [formatter1 setDateFormat:@"MM/dd"];
    
    NSDate *date1 = [formatter1 dateFromString:Str1];
    NSDate *date2 = [formatter1 dateFromString:Str2];
    
    NSString *dateString = [NSString stringWithFormat:@"%@-%@",[formatter1 stringFromDate:date1],[formatter1 stringFromDate:date2]];
    
    return dateString;
}


- (void)shingleFoilIcy{
    
    
    if (self.empowerToken.length > 0) {
        
        UIView *rightView = [[UIView alloc] init];
        rightView.width = 5;
        self.zxfl_right.rightViewMode = UITextFieldViewModeAlways;
        self.zxfl_right.rightView = rightView;
        
        [self.zxfl_left getPartOfTheCornerRadius:CGRectMake(0, 0, 60, 28) CornerRadius:2 UIRectCorner:UIRectCornerTopLeft | UIRectCornerBottomLeft];
        
        [self.zxfl_right getPartOfTheCornerRadius:CGRectMake(0, 0, 166, 28) CornerRadius:2 UIRectCorner:UIRectCornerTopRight | UIRectCornerBottomRight];
        
        self.zxfl_left.layer.masksToBounds = YES;
        self.zxfl_left.layer.borderColor = [UIColor colorWithHexString:@"#BEBEBE"].CGColor;
        self.zxfl_left.layer.borderWidth = 1.0f;
        
        self.zxfl_right.layer.masksToBounds = YES;
        self.zxfl_right.layer.borderColor = [UIColor colorWithHexString:@"#BEBEBE"].CGColor;
        self.zxfl_right.layer.borderWidth = 1.0f;
        self.zxfl_right.keyboardType = UIKeyboardTypeASCIICapableNumberPad;

        self.zxfl_right.delegate = self;

    }else{

        [self.zxfl_lab setHidden:YES];
        [self.zxfl_left setHidden:YES];
        [self.zxfl_right setHidden:YES];
        [self.zxfl_view setHidden:YES];
        self.bg_view_H.constant = 400;
    }
    
    if (self.cardData.count > 0) {
        self.name_lab.text = [NSString stringWithFormat:@"%@(%@)",self.cardData[@"bankName"],getAfterFour([self.cardData[@"cardNo"] stringValue])];
        self.icon_image.image = [UIImage imageNamed:getBankLogo(self.cardData[@"bankAcronym"])];
        self.number_lab.text = [NSString stringWithFormat:@"账单日 每月%@日丨还款日 每月%@日",self.cardData[@"billDay"],self.cardData[@"repaymentDay"]];
        
        self.customDates_lab.text = [self 得到当前日期到传入日期区间:[self.cardData[@"repaymentDay"] integerValue]];
        
    }
    
    self.zongjine_textfield.keyboardType = UIKeyboardTypeDecimalPad;
    self.yue_textfield.keyboardType = UIKeyboardTypeDecimalPad;
    
    self.point_left_btn.selected = YES;
    self.customDates_left_btn.selected = YES;
    
    self.content_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.content_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.content_view.layer.shadowOpacity = 0.2;
    self.content_view.layer.shadowRadius = 3;
    self.content_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.content_view.layer.cornerRadius = 10;
    
    [self.editor_lab bk_whenTapped:^{
        [self displayImplicate];
    }];
    
    [self novaComponentialDiscern];
    [self intertwinePlanetDisbarExamination];
    
}
#pragma 是否去除小数点

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length > 0 && [textField.text doubleValue] > 70) {
        textField.text = @"";
        [ZIONf_d showBottomWithText:@"输入的执行费率不能大于70，请重新输入"];
    }
}
#pragma 定制日期还款

- (void)blackballCatholicThankful{
    @weakify(self);
    [self addLocationManager:^(NSString * _Nonnull province, NSString * _Nonnull city) {
        weak_self.provinceAddress = province;
        weak_self.cityAddress = city;
        [weak_self flailLitreRecorder:province City:city];
        weak_self.address_lab.text = [NSString stringWithFormat:@"%@-%@",province,city];
    }];
}
#pragma 选择消费地区

- (void)novaComponentialDiscern{
    [self.address_lab bk_whenTapped:^{
        
        ZZCEkpLfibp_WvjView *PickerView = [[ZZCEkpLfibp_WvjView alloc]init];
        PickerView.provinceAddress = self.provinceAddress;
        PickerView.cityAddress = self.cityAddress;
        
        PickerView.Block = ^(NSDictionary *startDic, NSDictionary *endDic) {
            if ([startDic allKeys].count > 0 && [endDic allKeys].count > 0) {
                
                if(![[self.params[@"provinceCode"] stringValue] isEqualToString:[startDic[@"id"] stringValue]]){
                    [self.TheCustomArr removeAllObjects];
                    self.customDates_lab.text = @"";
                }
                
                [self.params setValue:startDic[@"id"] forKey:@"provinceCode"];
                [self.params setValue:endDic[@"id"] forKey:@"cityCode"];
                self.address_lab.text = [NSString stringWithFormat:@"%@-%@",startDic[@"name"],endDic[@"name"]];
        
            }
        };
        [PickerView show];
    }];
}
#pragma 获取定位地址

- (void)aggregateStageDefection{
    @weakify(self);
    
    NSMutableDictionary *dicData = [NSMutableDictionary dictionary];
    
    [dicData setValue:self.zongjine_textfield.text forKey:@"amount"];
    [dicData setValue:self.yue_textfield.text forKey:@"reservedAmount"];
    [dicData setValue:self.params[@"dayRepaymentCount"] forKey:@"dayRepaymentCount"];
    [dicData setValue:self.cardData[@"cardNo"] forKey:@"creditCardNumber"];
    
    [dicData setValue:brandId forKey:@"brandId"];
    [dicData setValue:self.params[@"provinceCode"] forKey:@"provinceCode"];
    [dicData setValue:self.params[@"cityCode"] forKey:@"cityCode"];
    
    
    [self NetWorkingPostWithURL:[UIViewController currentViewController] hiddenHUD:NO url:@"/api/credit/budget/day" Params:dicData success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            
            
            PDdf_9View *calendarView = [[PDdf_9View alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT)];
            
            calendarView.minDay = [responseObject[@"data"] intValue];
            
            [self.view addSubview:calendarView];
            
            calendarView.complete = ^(NSArray *result) {
                if (result) {
                    [weak_self.TheCustomArr removeAllObjects];
                    self.customDates_lab.text = @"";
                    for (int i = 0 ; i < result.count ; i++) {
                        
                        NSNumber *interval = [result objectAtIndex:i];
                        NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval.doubleValue];
                        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
                        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                        
                        [weak_self.TheCustomArr addObject:[dateFormatter stringFromDate:date]];
                        self.customDates_lab.text =  [NSString stringWithFormat:@"%@%@",self.customDates_lab.text.length == 0 ? @"" : [NSString stringWithFormat:@"%@ ",self.customDates_lab.text],[dateFormatter stringFromDate:date]];
                    }
                }
            };
            
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
    
}
#pragma 匹配定位地址的准确性

- (void)displayImplicate{
    @weakify(self)
    VPGMomkiIc_hTfController *VC = [VPGMomkiIc_hTfController new];
    VC.CardID = self.cardData[@"id"];
    VC.empowerToken = self.empowerToken;
    
    VC.block = ^(NSString * _Nonnull zdStr, NSString * _Nonnull hkStr) {
        if (zdStr.length > 0) {
            [weak_self.cardData setValue:zdStr forKey:@"billDay"];
        }
        if (hkStr.length > 0) {
            [weak_self.cardData setValue:hkStr forKey:@"repaymentDay"];
        }
        weak_self.number_lab.text = [NSString stringWithFormat:@"账单日 每月%@日丨还款日 每月%@日",weak_self.cardData[@"billDay"],weak_self.cardData[@"repaymentDay"]];
        self.customDates_lab.text = [self 得到当前日期到传入日期区间:[self.cardData[@"repaymentDay"] integerValue]];
    };
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}
#pragma 日期选择

- (BOOL)tribunalHeadstrongReproach:(NSString*)number {
   BOOL res = YES;
   NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
   int i = 0;
   while (i < number.length) {
       NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
       NSRange range = [string rangeOfCharacterFromSet:tmpSet];
       if (range.length == 0) {
           res = NO;
           break;
       }
       i++;
   }
   return res;
}

#pragma 制定计划

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
   return [self tribunalHeadstrongReproach:string];
}
#pragma 制定计划

- (IBAction)TheCustomDates:(UIButton *)sender {
    if (sender.tag == 300) {
        self.customDates_left_btn.selected = YES;
        self.customDates_right_btn.selected = NO;
        self.customDates_lab.text = @"";
    }else{
        if([self.cardData[@"cardNo"] stringValue].length == 0){
            [ZIONf_d showBottomWithText:@"信用卡号不能为空"];
            return;
        }
        if(self.zongjine_textfield.text.length == 0){
            [ZIONf_d showBottomWithText:@"还款金额不能为空"];
            return;
        }
        if(self.yue_textfield.text.length == 0){
            [ZIONf_d showBottomWithText:@"卡余额不能为空"];
            return;
        }
        if([self.params[@"dayRepaymentCount"] stringValue] == 0){
            [ZIONf_d showBottomWithText:@"每日还款次数不能为空"];
            return;
        }
        self.customDates_left_btn.selected = NO;
        self.customDates_right_btn.selected = YES;
        
        [self aggregateStageDefection];
    }
    
}

@end
