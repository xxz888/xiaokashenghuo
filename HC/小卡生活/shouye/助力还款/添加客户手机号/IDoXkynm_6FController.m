
#import "IDoXkynm_6FController.h"
#import "NAHlInimc_TController.h"
@interface IDoXkynm_6FController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phone_textfield;



@end

@implementation IDoXkynm_6FController


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField.text.length > 10 && ![string isEqualToString:@""]){
        return NO;
    }
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加客户";
    self.view.backgroundColor = [UIColor whiteColor];
    self.phone_textfield.delegate = self;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    
    NSArray<UIViewController *> * arr = self.xp_rootNavigationController.viewControllers;
    NSMutableArray *array = [NSMutableArray array];
    for (XPContainerNavigationController * VC in arr) {
        if (![VC isKindOfClass:[IDoXkynm_6FController class]]) {
            [array addObject:VC];
        }
    }
    self.xp_rootNavigationController.viewControllers = array;
    
}

- (IBAction)下一步:(UIButton *)sender {
    
    
    if (self.phone_textfield.text.length == 0) {
        [ZIONf_d showBottomWithText:@"请输入手机号" duration:2];
        return;
    }
    if (self.phone_textfield.text.length != 11) {
        [ZIONf_d showBottomWithText:@"请输入正确手机号" duration:2];
        return;
    }

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.phone_textfield.text forKey:@"phone"];

    [self NetWorkingPostWithAddressURL:self hiddenHUD:YES url:@"/api/user/pre/register" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {

            NAHlInimc_TController *VC = [NAHlInimc_TController new];
            VC.empowerToken = responseObject[@"data"];
            [self.xp_rootNavigationController pushViewController:VC animated:NO];

        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"] duration:2];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}



@end
