
#import "MVv_GController.h"

@interface MVv_GController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *icon_image;

@property (weak, nonatomic) IBOutlet UILabel *name_lab;
@property (weak, nonatomic) IBOutlet UILabel *number_lab;
@property (weak, nonatomic) IBOutlet UILabel *editor_lab;


@property (weak, nonatomic) IBOutlet UIView *content_view;
@property (weak, nonatomic) IBOutlet UITextField *zongjine_textfield;
@property (weak, nonatomic) IBOutlet UITextField *yue_textfield;
@property (weak, nonatomic) IBOutlet UITextField *NumberPay_textfield;
@property (weak, nonatomic) IBOutlet UITextField *address_lab;

@property (weak, nonatomic) IBOutlet UIButton *custom_btn;

@property (nonatomic , strong) NSMutableDictionary *params;

@property (nonatomic , strong) NSMutableArray * TheCustomArr;

@property (nonatomic , strong) NSString *provinceAddress;
@property (nonatomic , strong) NSString *cityAddress;


@end

@implementation MVv_GController


- (void)pawBeachAnalytical{
    
    [self.NumberPay_textfield bk_whenTapped:^{
        [self fritterFolly];
    }];
    
    [self.address_lab bk_whenTapped:^{
        [self doggedStalkDishonorableDisjointed];
    }];
    
    
}


- (void)fritterFolly{
        
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    DEig_IZView *dateView = [[DEig_IZView alloc]initWithDateStyle:DateStyleShowOtherString CompleteBlock:^(NSDate *Data, NSString *Str, id OtherString) {
        
        self.NumberPay_textfield.text = Str;
        [self.params setValue:[Str substringToIndex:1] forKey:@"dayRepaymentCount"];
        
    }];
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:@"1次"];
    [arr addObject:@"2次"];
    [arr addObject:@"3次"];
    [arr addObject:@"4次"];
    
    dateView.showYearViewMax = @"每日";
    dateView.MyearArray = arr;
    [dateView show];

}
#pragma 选择消费地区

- (void)copiousOutfox{
    @weakify(self);
    [self addLocationManager:^(NSString * _Nonnull province, NSString * _Nonnull city) {
        weak_self.provinceAddress = province;
        weak_self.cityAddress = city;
        [weak_self aircraftConcisePush:province City:city];
        weak_self.address_lab.text = [NSString stringWithFormat:@"%@-%@",province,city];
    }];
}
#pragma 获取定位地址

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"制定计划";
    
    [self.content_view setViewTypeshadow];
    self.zongjine_textfield.delegate = self;
    self.zongjine_textfield.keyboardType = UIKeyboardTypeDecimalPad;
    [self copiousOutfox];
    [self pawBeachAnalytical];
    
}
#pragma 匹配定位地址的准确性

- (void)doggedStalkDishonorableDisjointed{
    
    ZZCEkpLfibp_WvjView *PickerView = [[ZZCEkpLfibp_WvjView alloc]init];
    PickerView.provinceAddress = self.provinceAddress;
    PickerView.cityAddress = self.cityAddress;
    
    PickerView.Block = ^(NSDictionary *startDic, NSDictionary *endDic) {
        if ([startDic allKeys].count > 0 && [endDic allKeys].count > 0) {
            
            [self.params setValue:startDic[@"id"] forKey:@"provinceCode"];
            [self.params setValue:endDic[@"id"] forKey:@"cityCode"];
            self.address_lab.text = [NSString stringWithFormat:@"%@-%@",startDic[@"name"],endDic[@"name"]];
    
        }
    };
    [PickerView show];
}
#pragma 每次还款次数

- (void)aircraftConcisePush:(NSString *)province City:(NSString *)city{
    
    [self getAddressThan:province City:city isThan:^(NSString * _Nonnull provinceCode, NSString * _Nonnull cityCode, BOOL isThan) {
        if (isThan) {
            [self.params setValue:provinceCode forKey:@"provinceCode"];
            [self.params setValue:cityCode forKey:@"cityCode"];
        }else{
            self.address_lab.text = @"";
        }
    }];
}

- (BOOL)ashamedPrefatory:(NSString*)number {
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


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
   return [self ashamedPrefatory:string];
}
@end
