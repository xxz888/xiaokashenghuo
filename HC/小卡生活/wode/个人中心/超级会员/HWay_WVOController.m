
#import "HWay_WVOController.h"

@interface HWay_WVOController ()
@property (weak, nonatomic) IBOutlet UILabel *title_lab1;
@property (weak, nonatomic) IBOutlet UITextField *content_lab1;
@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UILabel *title_lab2;
@property (weak, nonatomic) IBOutlet UITextField *content_lab2;
@property (weak, nonatomic) IBOutlet UIView *line2;
@property (weak, nonatomic) IBOutlet UILabel *title_lab3;
@property (weak, nonatomic) IBOutlet UITextField *content_lab3;
@property (weak, nonatomic) IBOutlet UIView *line3;
@property (weak, nonatomic) IBOutlet UILabel *title_lab4;
@property (weak, nonatomic) IBOutlet UITextField *content_lab4;
@property (weak, nonatomic) IBOutlet UIView *line4;
@property (weak, nonatomic) IBOutlet UILabel *title_lab5;
@property (weak, nonatomic) IBOutlet UISwitch *switchs;
@property (weak, nonatomic) IBOutlet UIView *line5;

@end

@implementation HWay_WVOController


- (void)heatAlcoholicChapter{
    self.content_lab1.keyboardType = UIKeyboardTypeDecimalPad;
    self.content_lab2.keyboardType = UIKeyboardTypeDecimalPad;
    self.content_lab3.keyboardType = UIKeyboardTypeDecimalPad;
    self.content_lab4.keyboardType = UIKeyboardTypeDecimalPad;
    [_switchs addTarget:self action:@selector(classicalImprisonmentMalariaSextant:) forControlEvents:UIControlEventValueChanged];
        
    [self.title_lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(65, 30));
        make.top.equalTo(self.view.mas_top).offset(10);
        make.left.offset(20);
    }];
    [self.content_lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(36);
        make.centerY.equalTo(self.title_lab1);
        make.left.equalTo(self.title_lab1.mas_right).offset(20);
        make.right.offset(-20);
    }];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH - 40);
        make.height.offset(0.5);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.title_lab1.mas_bottom).offset(10);
    }];
    
    [self.title_lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(65, 30));
        make.top.equalTo(self.line1.mas_bottom).offset(10);
        make.left.offset(20);
    }];
    [self.content_lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(36);
        make.centerY.equalTo(self.title_lab2);
        make.left.equalTo(self.title_lab2.mas_right).offset(20);
        make.right.offset(-20);
    }];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH - 40);
        make.height.offset(0.5);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.title_lab2.mas_bottom).offset(10);
    }];

    [self.title_lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(65, 30));
        make.top.equalTo(self.line2.mas_bottom).offset(10);
        make.left.offset(20);
    }];
    [self.content_lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(36);
        make.centerY.equalTo(self.title_lab3);
        make.left.equalTo(self.title_lab3.mas_right).offset(20);
        make.right.offset(-20);
    }];
    [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH - 40);
        make.height.offset(0.5);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.title_lab3.mas_bottom).offset(10);
    }];

    [self.title_lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(65, 30));
        make.top.equalTo(self.line3.mas_bottom).offset(10);
        make.left.offset(20);
    }];
    [self.content_lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(36);
        make.centerY.equalTo(self.title_lab4);
        make.left.equalTo(self.title_lab4.mas_right).offset(20);
        make.right.offset(-20);
    }];
    [self.line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH - 40);
        make.height.offset(0.5);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.title_lab4.mas_bottom).offset(10);
    }];

    [self.title_lab5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(65, 30));
        make.top.equalTo(self.line4.mas_bottom).offset(10);
        make.left.offset(20);
    }];
    [self.switchs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.centerY.equalTo(self.title_lab5);
        make.left.equalTo(self.title_lab5.mas_right).offset(20);
        make.right.offset(-20);
    }];
    [self.line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH - 40);
        make.height.offset(0.5);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.title_lab5.mas_bottom).offset(10);
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"超级会员设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self heatAlcoholicChapter];
    self.switchs.on = 0;
    NSDictionary *dic = [self loadSuperMembersData];
    if ([[dic allKeys] count] > 0) {
        self.content_lab1.text = dic[@"totalBalance"];
        self.content_lab2.text = dic[@"todayTotal"];
        self.content_lab3.text = dic[@"yesterdayTotal"];
        self.content_lab4.text = dic[@"currentBalance"];
        self.switchs.on = [dic[@"IsSwitch"] integerValue];
    }
    
}


- (void)viewWillDisappear:(BOOL)animated{
    
    [self classicalImprisonmentMalariaSextant:self.switchs];
    
}





- (void)classicalImprisonmentMalariaSextant:(UISwitch *)sender{
    
    if (sender.on) {
        if (self.content_lab1.text.length == 0) {
            [ZIONf_d showBottomWithText:@"总收益不能为空"];
            sender.on = NO;
            return;
        }
        if (self.content_lab2.text.length == 0) {
            [ZIONf_d showBottomWithText:@"今日收益不能为空"];
            sender.on = NO;
            return;
        }
        if (self.content_lab3.text.length == 0) {
            [ZIONf_d showBottomWithText:@"昨日收益不能为空"];
            sender.on = NO;
            return;
        }
        if (self.content_lab4.text.length == 0) {
            [ZIONf_d showBottomWithText:@"可以提现不能为空"];
            sender.on = NO;
            return;
        }
        
        NSMutableDictionary *dic =[NSMutableDictionary dictionary];
        [dic setObject:self.content_lab1.text forKey:@"totalBalance"];
        [dic setObject:self.content_lab2.text forKey:@"todayTotal"];
        [dic setObject:self.content_lab3.text forKey:@"yesterdayTotal"];
        [dic setObject:self.content_lab4.text forKey:@"currentBalance"];
        [dic setObject:[NSString stringWithFormat:@"%i",self.switchs.on] forKey:@"IsSwitch"];
        
        [self updateSuperMembersData:dic];
    }else{
        
        NSMutableDictionary *dic =[NSMutableDictionary dictionary];
        [dic setObject:self.content_lab1.text forKey:@"totalBalance"];
        [dic setObject:self.content_lab2.text forKey:@"todayTotal"];
        [dic setObject:self.content_lab3.text forKey:@"yesterdayTotal"];
        [dic setObject:self.content_lab4.text forKey:@"currentBalance"];
        [dic setObject:[NSString stringWithFormat:@"%i",self.switchs.on] forKey:@"IsSwitch"];
        
        [self updateSuperMembersData:dic];
        
    }
}


@end
