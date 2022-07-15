
#import "UXOUagtuSskwp_npController.h"

@interface UXOUagtuSskwp_npController ()

@property (nonatomic , strong) NSDictionary *addressArr;
@property (nonatomic , strong) UILabel *lab;

@end

@implementation UXOUagtuSskwp_npController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单确认";
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addressTypeXiaoka) name:@"addressTypeXiaoka" object:nil];
    [self herdsmanScurvyThirteen];
    [self eggWan];
    
}


- (NSString *)generateTradeNOXiaoka
{
    static int kNumber = 11;
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
#pragma 接受地址为空的通知

- (void)addressTypeXiaoka{
    self.addressArr = nil;
    [self 地址赋值];
}
- (void)地址赋值{
    if (self.addressArr.count > 0) {
        [self.TheConsignee_lab setHidden:NO];
        [self.TheAddress_lab setHidden:NO];
        self.TheConsignee_lab.text = [NSString stringWithFormat:@"收货人：%@  %@",self.addressArr[@"name"],[NSString getSecrectStringWithPhoneNumber:self.addressArr[@"phone"]]];
        self.TheAddress_lab.text = [NSString stringWithFormat:@"收货地址：%@",self.addressArr[@"myAddress"]] ;
        [self.lab setHidden:YES];
    }else{
        
        [self.TheConsignee_lab setHidden:YES];
        [self.TheAddress_lab setHidden:YES];
        [self.lab setHidden:NO];
    }
}

- (IBAction)立即支付:(UIButton *)sender {

    if (![self toLogin]) return;
    if(self.addressArr.count == 0){
        
        [ZIONf_d showBottomWithText:@"请选择收货地址"];
        
        return;
    }

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSString stringWithFormat:@"%.2f",[self.goodsDic[@"size"] doubleValue] * self.number - [self.goodsDic[@"coupon_info_money"] doubleValue]] forKey:@"amount"];
    [dic setObject:@"0" forKey:@"type"];

    [self NetWorkingPostWithAddressURL:self hiddenHUD:YES url:@"/api/payment/invest/shop/temp" Params:dic success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            
            
            NSString *appScheme = @"HCAlipay";
            
            NSString *orderString = responseObject[@"data"];
            
            [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                NSLog(@"reslut = %@",resultDic);
                if([resultDic[@"resultStatus"] integerValue] == 4000){
                    [ZIONf_d showBottomWithText:@"调取支付宝支付失败，请检查是否安装支付宝"];
                }
            }];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
    
}

#pragma mark 生成随机数

- (void)herdsmanScurvyThirteen{
    self.goods_note.ylCornerRadius = 3.0f;
    self.goods_note.layer.borderColor = [UIColor colorWithHexString:@"#CDCDCD"].CGColor;
    self.goods_note.layer.borderWidth = 0.5;
    
    
    [self.address_view bk_whenTapped:^{
        RFc_RController *VC = [RFc_RController new];
        
        VC.block = ^(NSDictionary * _Nullable dataDic) {
            self.addressArr = [NSDictionary dictionaryWithDictionary:dataDic];
            [self 地址赋值];
        };
        [self.xp_rootNavigationController pushViewController:VC  animated:YES];
    }];
    
    self.lab = [UILabel getUILabelText:@"暂无收货地址，请选择地址" TextColor:[UIColor colorWithHexString:@"#333333"] TextFont:[UIFont getUIFontSize:16 IsBold:YES] TextNumberOfLines:0];
    [self.address_view addSubview:self.lab];
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.address_view);
        make.left.offset(45);
    }];
    
}



- (void)eggWan{
    
    [self.goods_image sd_setImageWithURL:self.goodsDic[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    
    self.goods_name.text = self.goodsDic[@"title"];
    
    self.goods_number.text = [NSString stringWithFormat:@"*%li",self.number];
    
    self.goods_TheTotalPrice.text = [NSString stringWithFormat:@"￥%.2f",[self.goodsDic[@"size"] doubleValue] * self.number];
    
    self.goods_coupons.text = [NSString stringWithFormat:@"-￥%@",self.goodsDic[@"coupon_info_money"]];
    
    self.goods_ACombined.text = [NSString stringWithFormat:@"合计：￥%.2f",[self.goodsDic[@"size"] doubleValue] * self.number - [self.goodsDic[@"coupon_info_money"] doubleValue]];
    
    NSDictionary *UserDic = [self loadUserData];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:UserDic[@"username"] forKey:@"phone"];
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/shop/getMyAddress" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 200) {
           self.addressArr  = [NSDictionary dictionaryWithDictionary:[responseObject[@"data"] firstObject]];
            [self 地址赋值];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
}


@end
