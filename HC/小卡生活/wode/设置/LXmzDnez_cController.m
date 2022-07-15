
#import "LXmzDnez_cController.h"
#import "AppDelegate.h"
#import "BKYt_IHlCell.h"

#import "WDtWubmf_r3Controller.h"
#import "CEVTkmt_LOController.h"
#import "XVQWwcm_IuController.h"


#import "SDImageCache.h"


@interface LXmzDnez_cController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;
@property (strong, nonatomic)  UIButton *finishBtn;

@property (nonatomic , strong) NSMutableArray *dataArr;

@end

@implementation LXmzDnez_cController


- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"balloonOstentatious"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.layer.masksToBounds = YES;

        _finishBtn.layer.cornerRadius = 8;
        _finishBtn.titleLabel.font = [UIFont getUIFontSize:18 IsBold:YES];
        [_finishBtn bk_whenTapped:^{
            [self latitudeRampantInsurgent];
        }];
    }
    return _finishBtn;
}

#pragma 退出登陆

- (float)strifeExemplaryIncompleteSpeedy
{

    float totalSize = 0;
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:[SDImageCache sharedImageCache].diskCachePath];
    for (NSString *fileName in fileEnumerator)
    {
        NSString *filePath = [[SDImageCache sharedImageCache].diskCachePath stringByAppendingPathComponent:fileName];

        NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];

        unsigned long long length = [attrs fileSize];

        totalSize += length / 1024.0 / 1024.0;
    
    }

    return totalSize;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DHSDpnz_x3 *model = self.dataArr[indexPath.row];
    
    if ([model.name isEqualToString:@"设置登录密码"]) {
        [self.xp_rootNavigationController pushViewController:[WDtWubmf_r3Controller new] animated:YES];
    }
    else if ([model.name isEqualToString:@"设置交易密码"]){
        [self.xp_rootNavigationController pushViewController:[CEVTkmt_LOController new] animated:YES];
    }
    else if ([model.name isEqualToString:@"更改手机号码"]){
        [self.xp_rootNavigationController pushViewController:[XVQWwcm_IuController new] animated:YES];
    }
    else if ([model.name containsString:@"清理缓存"]){
        [self thoughtlessPassengerBallpointpenQuixotic];
    }
    else if ([model.name containsString:@"注销账号"]){
        [self zhuxiao];
    }
    
    
}
-(void)zhuxiao{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确认注销此账号，注销账号三天后无法恢复和登录" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *dic = [userDefaults dictionaryRepresentation];
        for (id key in dic) {
            [userDefaults removeObjectForKey:key];
        }
        [userDefaults synchronize];
        
        
        [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
            if (iResCode == 0) {
                NSLog(@"删除别名成功");
            }
        } seq:0];
        
        
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        PXFrJw_QnIController *loginView = [[PXFrJw_QnIController alloc]init];
        XPRootNavigationController *navi = [[XPRootNavigationController alloc]initWithRootViewController:loginView];
        delegate.window.rootViewController = navi;
     
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark - UITableViewDelegate UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"BKYt_IHlCell";
    BKYt_IHlCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"BKYt_IHlCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    DHSDpnz_x3 *model = self.dataArr[indexPath.row];
    if (![model.name isEqualToString:@"版本更新"]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.content_lab setHidden:YES];
    }else{
        [cell.content_lab setHidden:NO];
        cell.content_lab.text = model.content;
        [cell.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-24);
        }];
    }
    
    
    cell.name_lab.text = model.name;
    
    
    
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"设置"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArr = [NSMutableArray array];
    [self embroilFlawless];
    
}


- (void)embroilFlawless{
    
    
    NSArray *data = [NSMutableArray arrayWithObjects:@"清理缓存(0M)",@"设置登录密码",@"更改手机号码",@"版本更新",@"注销账号", nil];
    for (int i = 0; i < data.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data[i];
        if ([data[i] isEqualToString:@"版本更新"]) {
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            
            NSString  *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            model.content = [NSString stringWithFormat:@"当前版本：%@",app_Version];
        }else if([data[i] isEqualToString:@"清理缓存(0M)"]){
            
            
            CGFloat bytesCache = [self strifeExemplaryIncompleteSpeedy];
            model.content = [NSString stringWithFormat:@"清理缓存(%.2fM)",bytesCache];
            
        }
        [self.dataArr addObject:model];
    }
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(252);
        make.left.top.right.offset(0);
    }];
    
    [self.view addSubview:self.finishBtn];
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 46));
        make.left.offset(15);
        make.top.equalTo(self.tableView.mas_bottom).offset(50);
    }];
    
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
        _tableView.scrollEnabled = NO;
        
    }
    return _tableView;
}
#pragma 懒加载

- (void)thoughtlessPassengerBallpointpenQuixotic {
    
    if ([self strifeExemplaryIncompleteSpeedy] == 0) {
        [ZIONf_d showBottomWithText:@"暂无缓存"];
        return;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确认清除" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [SDImageCache.sharedImageCache clearMemory];
        [SDImageCache.sharedImageCache clearDiskOnCompletion:nil];
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)latitudeRampantInsurgent{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否退出登录" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *dic = [userDefaults dictionaryRepresentation];
        for (id key in dic) {
            [userDefaults removeObjectForKey:key];
        }
        [userDefaults synchronize];
        
        
        [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
            if (iResCode == 0) {
                NSLog(@"删除别名成功");
            }
        } seq:0];
        
        
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        PXFrJw_QnIController *loginView = [[PXFrJw_QnIController alloc]init];
        XPRootNavigationController *navi = [[XPRootNavigationController alloc]initWithRootViewController:loginView];
        delegate.window.rootViewController = navi;
        
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}



@end
