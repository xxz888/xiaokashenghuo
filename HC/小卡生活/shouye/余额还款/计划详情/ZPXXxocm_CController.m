
#import "ZPXXxocm_CController.h"
#import "QGCuxvq_dbCell.h"
#import "KGCmKchry_vController.h"
#import "IWdqpb_wLwView.h"
@interface ZPXXxocm_CController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UIView *top_view;
@property (nonatomic , strong) UIImageView *top_image;
@property (nonatomic , strong) UIImageView *top_log_image;
@property (nonatomic , strong) UILabel *top_title_lab;
@property (nonatomic , strong) UILabel *top_content_lab;
@property (nonatomic , strong) UILabel *content_left1_lab;
@property (nonatomic , strong) UILabel *content_left2_lab;
@property (nonatomic , strong) UILabel *content_left3_lab;
@property (nonatomic , strong) UILabel *content_right1_lab;
@property (nonatomic , strong) UILabel *content_right2_lab;
@property (nonatomic , strong) UILabel *content_right3_lab;


@property (nonatomic , strong) UIView *content_view;
@property (nonatomic , strong) UIView *table_header_view;


@property (nonatomic , strong) UITableView *tableView;


@property (nonatomic , strong) UIButton *finishBtn;

@property (nonatomic , strong) NSMutableArray *detailDataArr;

@property (nonatomic , strong) NSString *PlanRate;

@end

@implementation ZPXXxocm_CController


- (void)beforehandUnwieldyUlcerateRemorse{
    
    [self.view addSubview:self.top_view];
    [self.top_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.offset(15);
        make.height.offset(200);
    }];
    self.top_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.top_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.top_view.layer.shadowOpacity = 0.2;
    self.top_view.layer.shadowRadius = 3;
    self.top_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.top_view.layer.cornerRadius = 10;
    
    [self.top_view addSubview:self.top_image];
    [self.top_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 80));
        make.left.top.offset(0);
    }];
    
    [self.top_view addSubview:self.top_log_image];
    [self.top_log_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.left.offset(32);
        make.centerY.equalTo(self.top_image);
    }];
    
    [self.top_view addSubview:self.top_title_lab];
    [self.top_title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.top_log_image.mas_right).offset(16);
        make.top.equalTo(self.top_image.mas_top).offset(25);
    }];
    
    [self.top_view addSubview:self.top_content_lab];
    [self.top_content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.top_log_image.mas_right).offset(16);
        make.top.equalTo(self.top_title_lab.mas_bottom).offset(8);
    }];
    
    
    double lab_W = (DEVICE_WIDTH - 60)/2;
    
    [self.top_view addSubview:self.content_left1_lab];
    [self.content_left1_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.left.offset(10);
        make.top.equalTo(self.top_image.mas_bottom).offset(20);
    }];
    
    [self.top_view addSubview:self.content_left2_lab];
    [self.content_left2_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.left.offset(10);
        make.top.equalTo(self.content_left1_lab.mas_bottom).offset(20);
    }];
    
    [self.top_view addSubview:self.content_left3_lab];
    [self.content_left3_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.left.offset(10);
        make.top.equalTo(self.content_left2_lab.mas_bottom).offset(20);
    }];
    
    [self.top_view addSubview:self.content_right1_lab];
    [self.content_right1_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.right.offset(-10);
        make.top.equalTo(self.top_image.mas_bottom).offset(20);
    }];
    
    [self.top_view addSubview:self.content_right2_lab];
    [self.content_right2_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.right.offset(-10);
        make.top.equalTo(self.content_right1_lab.mas_bottom).offset(20);
    }];
    
    [self.top_view addSubview:self.content_right3_lab];
    [self.content_right3_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.right.offset(-10);
        make.top.equalTo(self.content_right2_lab.mas_bottom).offset(20);
    }];
    

    [self.view addSubview:self.content_view];
    [self.content_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.equalTo(self.top_view.mas_bottom).offset(15);
        make.bottom.offset(0);
    }];
    self.content_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.content_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.content_view.layer.shadowOpacity = 0.2;
    self.content_view.layer.shadowRadius = 3;
    self.content_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.content_view.layer.cornerRadius = 10;
    
    [self.content_view addSubview:self.table_header_view];
    [self.table_header_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(0);
        make.height.offset(50);
    }];
    UILabel *time_lab = [self unctuousResponsibilitySoap:@"时间"];
    [_table_header_view addSubview:time_lab];
    double lab_WW = (DEVICE_WIDTH - 30 - 32 )/5;
    [time_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_WW*2);
        make.centerY.equalTo(self.table_header_view);
        make.left.offset(32);
    }];
    UILabel *type_lab = [self unctuousResponsibilitySoap:@"类型"];
    [_table_header_view addSubview:type_lab];
    
    [type_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_WW);
        make.centerY.equalTo(self.table_header_view);
        make.left.equalTo(time_lab.mas_right);
    }];
    UILabel *money_lab = [self unctuousResponsibilitySoap:@"金额"];
    [_table_header_view addSubview:money_lab];
    [money_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_WW);
        make.centerY.equalTo(self.table_header_view);
        make.left.equalTo(type_lab.mas_right);
    }];
    UILabel *plan_type_lab = [self unctuousResponsibilitySoap:@"状态"];
    [_table_header_view addSubview:plan_type_lab];
    [plan_type_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_WW);
        make.centerY.equalTo(self.table_header_view);
        make.left.equalTo(money_lab.mas_right);
    }];
    
    self.tableView.layer.cornerRadius = 10;
    [self.content_view addSubview:self.tableView];
    
    
    [self.finishBtn setHidden:YES];
    [self commentatorConsortCat];
}

#pragma 获取计划详情

- (void)arabExpediencyFiatWednesday{
    @weakify(self);
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:self.planIDStr forKey:@"id"];
    if (self.empowerToken.length > 0) {
        [params setObject:self.empowerToken forKey:@"empowerToken"];
    }
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit/get/plan/has/item" Params:params success:^(id  _Nonnull responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
            
            double rate = [dic[@"rate"] doubleValue];
            double addRate = [dic[@"addRate"] doubleValue];
            
            self.PlanRate = [NSString stringWithFormat:@"%.2f",(rate + addRate)*100];
            
            weak_self.content_left1_lab.text = [NSString stringWithFormat:@"还款总次数：%@",dic[@"taskCount"]];
            weak_self.content_left2_lab.text = [NSString stringWithFormat:@"还款总金额：%@",dic[@"taskAmount"]];
            weak_self.content_left3_lab.text = [NSString stringWithFormat:@"预计手续费：%@",dic[@"totalServiceCharge"]];
            weak_self.content_right1_lab.text = [NSString stringWithFormat:@"已还次数：%@",dic[@"completedCount"]];
            weak_self.content_right2_lab.text = [NSString stringWithFormat:@"已还金额：%@",dic[@"repaymentedAmount"]];
            weak_self.content_right3_lab.text = [NSString stringWithFormat:@"已扣手续费：%@",dic[@"usedServiceCharge"]];
            weak_self.detailDataArr = [NSMutableArray arrayWithArray:dic[@"planItems"]];
            NSInteger status = [dic[@"status"] integerValue];
            
            [weak_self 计划状态判断:status];
            [weak_self.tableView reloadData];
            
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}

#pragma 启动,终止计划点击事件

- (UILabel *)top_title_lab{
    if (!_top_title_lab) {
        _top_title_lab = [UILabel new];
        _top_title_lab.text = @"";
        _top_title_lab.textColor = [UIColor colorWithHexString:@"#FCD6A7"];
        _top_title_lab.font = [UIFont getUIFontSize:15 IsBold:YES];
    }
    return _top_title_lab;
}

- (BOOL)计划日期与还款日的判断{
    
    NSString *beginStr = self.detailDataArr[0][@"executeTime"];
    NSArray *beginArr = [beginStr componentsSeparatedByString:@" "];
    NSDate *beginDate = [NSDate dateFromString:beginArr[0] WithFormat:@"yyyy-MM-dd"];
    
    NSString *endStr = self.detailDataArr[self.detailDataArr.count-1][@"executeTime"];
    NSArray *endArr = [endStr componentsSeparatedByString:@" "];
    NSDate *endDate = [NSDate dateFromString:endArr[0] WithFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [NSDate date]; 
    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    [forMatter setDateFormat:@"yyyy-MM"];
    NSString *dateStr = [forMatter stringFromDate:date];
    
    NSString *day = self.cardData[@"repaymentDay"];
    NSString *dayStr = [NSString stringWithFormat:@"%@-%@",dateStr,day];
    
    NSDate *dayDate = [NSDate dateFromString:dayStr  WithFormat:@"yyyy-MM-dd"];
    
    NSDate *newDayDate = [self understatedStudiedApprenticePepper:dayDate withMonth:1];
    
    BOOL dayBool = [self date:dayDate isBetweenDate:beginDate andDate:endDate];
    BOOL newDayBool = [self date:newDayDate isBetweenDate:beginDate andDate:endDate];
    
    if(!dayBool && !newDayBool){
        [self 启动计划];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"还款计划的最后执行时间超过了银行卡的还款日，确定要继续吗？" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self 启动计划];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    return YES;
}
#pragma 判断某一日期是否在一日期区间

- (UIImageView *)top_image{
    if (!_top_image) {
        _top_image = [UIImageView getUIImageView:@"takeDashingSilky"];
    }
    return _top_image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"计划详情";
    self.PlanRate = @"0.80";
    [self beforehandUnwieldyUlcerateRemorse];
}
#pragma 启动计划
- (void)启动计划{
    
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:self.cardData[@"cardNo"] forKey:@"cardNo"];
    if (self.empowerToken.length > 0) {
        [params setObject:self.empowerToken forKey:@"empowerToken"];
    }
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit/save/new/plan" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            if (self.empowerToken.length > 0) {
                [self 返回中介还款界面];
            }else{
                [self 返回余额还款界面];
            }

            [ZIONf_d showBottomWithText:@"计划启动成功" duration:2.0];
        }
        else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}
- (void)返回中介还款界面{
    
    [self backToAppointedController:[RNtycrQl_HUController new]];
    
    NSNotification *LoseResponse = [NSNotification notificationWithName:@"RefreshCustomerCardTable" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:LoseResponse];
}
- (void)返回余额还款界面{
    
    [self backToAppointedController:[ZDObr_eController new]];
    
    NSNotification *LoseResponse = [NSNotification notificationWithName:@"RefreshTable" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:LoseResponse];
}


#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = self.detailDataArr[indexPath.row];

    
    
    IWdqpb_wLwView *trading = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([IWdqpb_wLwView class]) owner:nil options:nil] lastObject];
    trading.width = DEVICE_WIDTH - 40;
    
    
    trading.order_lab.text = [NSString stringWithFormat:@"订单号：%@",[[data allKeys] containsObject:@"orderCode"] ? data[@"orderCode"] : @""];
    trading.jine_lab.text = [NSString stringWithFormat:@"计划金额：%@",data[@"amount"]];
    trading.feilv_lab.text = [NSString stringWithFormat:@"计划费率：%@%@",self.PlanRate,@"%"];
    
    trading.shijian_lab.text = [NSString stringWithFormat:@"计划执行时间：%@",data[@"executeTime"]];
    
    
    
    if ([data[@"type"] intValue] == 1) {
        trading.leixing_lab.text = @"计划类型：消费";
        trading.miaoshu_lab.text = [NSString stringWithFormat:@"计划描述：消费计划"];
        trading.shouxufei_lab.text = [NSString stringWithFormat:@"计划手续费：%.2f",[data[@"amount"] doubleValue] * 0.8 / 100];
    }else{
        trading.leixing_lab.text = @"计划类型：还款";
        trading.miaoshu_lab.text = [NSString stringWithFormat:@"计划描述：还款计划"];
        trading.shouxufei_lab.text = [NSString stringWithFormat:@"计划手续费：1"];
    }
    
    if ([data[@"status"] intValue] == 4){
        trading.zhuangtai_lab.text = @"计划状态：已失败";
        trading.zhuangtai_lab.textColor = [UIColor colorWithHexString:@"#FF3600"];
    }else if ([data[@"status"] intValue] == 5){
        trading.zhuangtai_lab.text = @"计划状态：已取消";
        trading.zhuangtai_lab.textColor = [UIColor colorWithHexString:@"#FFCC00"];
    }else if ([data[@"status"] intValue] == 3){
        trading.zhuangtai_lab.text = @"计划状态：已完成";
        trading.zhuangtai_lab.textColor = [UIColor colorWithHexString:@"#5FD400"];
    }else{
        [trading.zhuangtai_lab setHidden:YES];
    }
    
    double H = 0;
    if ([data[@"message"] length] > 0 && [data[@"status"] intValue] == 4) {
        trading.shibai_lab.text = [NSString stringWithFormat:@"计划失败原因：%@",data[@"message"]];
        H = [trading.shibai_lab.text heightWithFontSize:12 width:DEVICE_WIDTH - 125];
    }else{
        trading.shibai_lab.text = @"";
    }
    
    trading.height = 350 + H;
    
    
    
    LSTPopView *popView = [LSTPopView initWithCustomView:trading
                                                  popStyle:LSTPopStyleSpringFromTop
                                              dismissStyle:LSTDismissStyleSmoothToTop];
    LSTPopViewWK(popView)
    [trading.clean_btn bk_whenTapped:^{
        [wk_popView dismiss];
    }];
    [popView pop];
    
}

- (UILabel *)unctuousResponsibilitySoap:(NSString *)title{
    UILabel *lab = [UILabel new];
    lab.text = title;
    lab.textColor = [UIColor blackColor];
    lab.font = [UIFont getUIFontSize:15 IsBold:YES];
    lab.textAlignment = NSTextAlignmentCenter;
    return lab;
}

- (void)commentatorConsortCat{
    
    if (self.cardData.count > 0) {
        self.top_title_lab.text = [NSString stringWithFormat:@"%@(%@)",self.cardData[@"bankName"],getAfterFour([self.cardData[@"cardNo"] stringValue])];
        
        self.top_log_image.image = [UIImage imageNamed:getBankLogo(self.cardData[@"bankAcronym"])];
        
        self.top_content_lab.text = [NSString stringWithFormat:@"账单日 每月%@日丨还款日 每月%@日",self.cardData[@"billDay"],self.cardData[@"repaymentDay"]];
    }
    
    if(self.MakePlanData.count > 0){
        double rate = [self.MakePlanData[@"rate"] doubleValue];
        double addRate = [self.MakePlanData[@"addRate"] doubleValue];
        self.PlanRate = [NSString stringWithFormat:@"%.2f",(rate + addRate)*100];
        
        self.content_left1_lab.text = [NSString stringWithFormat:@"还款总次数：%@",self.MakePlanData[@"taskCount"]];
        self.content_left2_lab.text = [NSString stringWithFormat:@"还款总金额：%@",self.MakePlanData[@"taskAmount"]];
        self.content_left3_lab.text = [NSString stringWithFormat:@"预计手续费：%@",self.MakePlanData[@"totalServiceCharge"]];
        self.content_right1_lab.text = [NSString stringWithFormat:@"已还次数：%@",self.MakePlanData[@"completedCount"]];
        self.content_right2_lab.text = [NSString stringWithFormat:@"已还金额：%@",self.MakePlanData[@"repaymentedAmount"]];
        self.content_right3_lab.text = [NSString stringWithFormat:@"已扣手续费：%@",self.MakePlanData[@"usedServiceCharge"]];
        self.detailDataArr = [NSMutableArray arrayWithArray:self.MakePlanData[@"planItems"]];
        
        NSInteger status = [self.MakePlanData[@"status"] integerValue];
        [self 计划状态判断:status];
    }else{
        
        [self arabExpediencyFiatWednesday];
    }
    
}

- (UILabel *)content_right3_lab{
    if (!_content_right3_lab) {
        _content_right3_lab = [UILabel new];
        _content_right3_lab.text = @"已扣手续费：0元";
        _content_right3_lab.textColor = [UIColor colorWithHexString:@"#333333"];
        _content_right3_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _content_right3_lab;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.detailDataArr.count;
}

- (UIView *)top_view{
    if (!_top_view) {
        _top_view = [UIView new];
    }
    return _top_view;
}
- (void)计划状态判断:(NSInteger)status{
    
    if (status == 3 || status == 5 || status == 6 ) {
        [self stridentOpponentSwarm:@"隐藏"];
    }else{
        [self.finishBtn setHidden:NO];
        [self stridentOpponentSwarm:@"显示"];
        if (status == 1) {
            [self.finishBtn setTitle:@"启动计划" forState:UIControlStateNormal];
        }else{
            [self.finishBtn setTitle:@"终止计划" forState:UIControlStateNormal];
        }
    }
}

#pragma 底部操作按钮的控制

- (UILabel *)content_left1_lab{
    if (!_content_left1_lab) {
        _content_left1_lab = [UILabel new];
        _content_left1_lab.text = @"还款总次数：0次";
        _content_left1_lab.textColor = [UIColor colorWithHexString:@"#333333"];
        _content_left1_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _content_left1_lab;
}


- (BOOL)date:(NSDate *)date isBetweenDate:(NSDate *)beginDate andDate:(NSDate *)endDate{
    if ([date compare:beginDate] == NSOrderedAscending) {
        return NO;
    }
    if ([date compare:endDate] == NSOrderedDescending) {
        return NO;
    }
    return YES;
}


- (void)impendingEmployment{
    
    if ([self.finishBtn.titleLabel.text isEqualToString:@"启动计划"]) {
        
        
        NSMutableDictionary *params = [NSMutableDictionary new];
        [params setValue:self.cardData[@"cardNo"] forKey:@"cardNo"];
        if (self.empowerToken.length > 0) {
            [params setObject:self.empowerToken forKey:@"empowerToken"];
        }
        [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit/verify/band/card" Params:params success:^(id  _Nonnull responseObject) {
            
            if ([responseObject[@"code"] intValue] == 0) {
                [self 计划日期与还款日的判断];
            }else if ([responseObject[@"code"] intValue] == 3){
                KGCmKchry_vController *VC = [KGCmKchry_vController new];
                VC.cardData = self.cardData;
                
                VC.customer_Name = self.customer_Name;
                VC.empowerToken = self.empowerToken;
                VC.block = ^(NSString * _Nonnull str) {
                    [self 计划日期与还款日的判断];
                };
                [self.xp_rootNavigationController pushViewController:VC animated:YES];
            }
            
            else{
                [ZIONf_d showBottomWithText:responseObject[@"message"]];
            }
        } failure:^(NSString * _Nonnull error) {
            
        }];
        
    }
    else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您是否要终止计划？" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"终止" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            NSMutableDictionary *params = [NSMutableDictionary new];
            [params setValue:self.planIDStr forKey:@"id"];
            if (self.empowerToken.length > 0) {
                [params setObject:self.empowerToken forKey:@"empowerToken"];
            }
            [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/credit/plan/stop" Params:params success:^(id  _Nonnull responseObject) {
                if ([responseObject[@"code"] intValue] == 0) {
                    if (self.empowerToken.length > 0) {
                        [self 返回中介还款界面];
                    }else{
                        [self 返回余额还款界面];
                    }
                    [ZIONf_d showBottomWithText:@"终止计划成功" duration:2.0];
                }
                else{
                    [ZIONf_d showBottomWithText:responseObject[@"message"]];
                }
            } failure:^(NSString * _Nonnull error) {
                
            }];
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
        
        
    }
}

- (void)stridentOpponentSwarm:(NSString *)typeStr{
    if([typeStr isEqualToString:@"隐藏"]){
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(DEVICE_WIDTH-30);
            make.left.offset(0);
            make.top.equalTo(self.table_header_view.mas_bottom).offset(0);
            make.bottom.equalTo(self.content_view.mas_bottom).offset(-KBottomHeight);
        }];
    }else{
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(DEVICE_WIDTH-30);
            make.left.offset(0);
            make.top.equalTo(self.table_header_view.mas_bottom).offset(0);
            make.bottom.equalTo(self.content_view.mas_bottom).offset(-46-KBottomHeight);
        }];
        [self.view addSubview:self.finishBtn];
        [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 46));
            make.left.offset(0);
            make.bottom.offset(-KBottomHeight);
        }];
    }
}

- (UILabel *)top_content_lab{
    if (!_top_content_lab) {
        _top_content_lab = [UILabel new];
        _top_content_lab.text = @"";
        _top_content_lab.textColor = [UIColor colorWithHexString:@"#FCD6A7"];
        _top_content_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _top_content_lab;
}

- (UIView *)table_header_view{
    if (!_table_header_view) {
        _table_header_view = [UIView new];
        _table_header_view.layer.cornerRadius = 10;
        
    }
    return _table_header_view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"QGCuxvq_dbCell";
    QGCuxvq_dbCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"QGCuxvq_dbCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    NSDictionary *data = self.detailDataArr[indexPath.row];
    cell.time_lab.text = data[@"executeTime"];
    cell.money_lab.text = [NSString stringWithFormat:@"%.2f",[data[@"amount"] doubleValue]];
    if ([data[@"type"] intValue] == 1) {
        cell.type_lab.text = @"消费";
        [cell.image_img setHidden:YES];
    }else{
        cell.type_lab.text = @"还款";
        [cell.image_img setHidden:NO];
    }
    
    if ([data[@"status"] intValue] == 1) {
        cell.plan_type_lab.text = @"待执行";
        cell.plan_type_lab.textColor = [UIColor colorWithHexString:@"#F9CB32"];
    }
    else if ([data[@"status"] intValue] == 2){
        cell.plan_type_lab.text = @"执行中";
        cell.plan_type_lab.textColor = [UIColor colorWithHexString:@"#1A1A4B"];
    }
    else if ([data[@"status"] intValue] == 3){
        cell.plan_type_lab.text = @"已成功";
        cell.plan_type_lab.textColor = [UIColor colorWithHexString:@"#209E2F"];
    }
    else if ([data[@"status"] intValue] == 4){
        cell.plan_type_lab.text = @"已失败";
        cell.plan_type_lab.textColor = [UIColor colorWithHexString:@"#121212"];
    }else if ([data[@"status"] intValue] == 5){
        cell.plan_type_lab.text = @"已取消";
        cell.plan_type_lab.textColor = [UIColor colorWithHexString:@"#2741AD"];
    }
    
    
    
    return cell;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.showsVerticalScrollIndicator = NO;
        
    }
    return _tableView;
}


- (UIView *)content_view{
    if (!_content_view) {
        _content_view = [UIView new];
    }
    return _content_view;
}

- (UILabel *)content_left2_lab{
    if (!_content_left2_lab) {
        _content_left2_lab = [UILabel new];
        _content_left2_lab.text = @"还款总金额：0元";
        _content_left2_lab.textColor = [UIColor colorWithHexString:@"#333333"];
        _content_left2_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _content_left2_lab;
}

- (UILabel *)content_right1_lab{
    if (!_content_right1_lab) {
        _content_right1_lab = [UILabel new];
        _content_right1_lab.text = @"已还次数：0次";
        _content_right1_lab.textColor = [UIColor colorWithHexString:@"#333333"];
        _content_right1_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _content_right1_lab;
}

- (UILabel *)content_right2_lab{
    if (!_content_right2_lab) {
        _content_right2_lab = [UILabel new];
        _content_right2_lab.text = @"已还金额：0元";
        _content_right2_lab.textColor = [UIColor colorWithHexString:@"#333333"];
        _content_right2_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _content_right2_lab;
}

- (UIImageView *)top_log_image{
    if (!_top_log_image) {
        _top_log_image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hatchArchitect"]];
    }
    return _top_log_image;
}

- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"amendmentCaissonOvoid"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"启动计划" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont getUIFontSize:18 IsBold:YES];
        [_finishBtn bk_whenTapped:^{
            [self impendingEmployment];
        }];
    }
    return _finishBtn;
}
    

-(NSDate *)understatedStudiedApprenticePepper:(NSDate *)date withMonth:(int)month{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}


- (UILabel *)content_left3_lab{
    if (!_content_left3_lab) {
        _content_left3_lab = [UILabel new];
        _content_left3_lab.text = @"预计手续费：0元";
        _content_left3_lab.textColor = [UIColor colorWithHexString:@"#333333"];
        _content_left3_lab.font = [UIFont getUIFontSize:12 IsBold:NO];
    }
    return _content_left3_lab;
}


@end
