
#import "DZHKj_FController.h"
#import "XHHIdez_0gfCell.h"
@interface DZHKj_FController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) UIButton *finishBtn;

@property (nonatomic , strong) NSMutableArray *dataArr;



@property (nonatomic , strong) UIButton *rightbtn;

@end

@implementation DZHKj_FController


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma 获取卡片基本信息

- (void)prejudiceBiographer{
    
    DHSDpnz_x3 *model2 = self.dataArr[2];
    DHSDpnz_x3 *model3 = self.dataArr[3];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.data[@"id"] forKey:@"id"];
    [params setValue:model2.content forKey:@"cardNo"];
    [params setValue:model3.content forKey:@"phone"];
    
    if (self.empowerToken.length > 0) {
        [params setObject:self.empowerToken forKey:@"empowerToken"];
    }
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:@"/api/user/debit/card/update" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            if(self.block){
                self.block(model2.content, model3.content);
            }
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
            [self.xp_rootNavigationController popViewControllerAnimated:YES];
        }else{
            [ZIONf_d showBottomWithText:responseObject[@"message"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

#pragma 更改卡片基本信息

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"XHHIdez_0gfCell";
    XHHIdez_0gfCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"XHHIdez_0gfCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.model = self.dataArr[indexPath.row];
    
    if (indexPath.row == 0 || indexPath.row == 1) {
        cell.content_textfield.textColor = [UIColor colorWithHexString:@"#999999"];
    }else{
        if (!self.rightbtn.selected) {
            cell.content_textfield.textColor = [UIColor colorWithHexString:@"#999999"];
        }else{
            cell.content_textfield.textColor = [UIColor blackColor];
        }
        
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate UITableViewDataSource

- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_finishBtn setBackgroundImage:[UIImage imageNamed:@"balloonOstentatious"] forState:UIControlStateNormal];
        [_finishBtn setTitle:@"确定修改" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont getUIFontSize:18 IsBold:YES];
        [_finishBtn bk_whenTapped:^{
            [self prejudiceBiographer];
        }];
    }
    return _finishBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"修改储蓄卡";
    self.dataArr = [NSMutableArray array];
    
    [self phoenixEntertainment];
    if (self.empowerToken.length > 0) {
        [self loadData];
    }else{
        [self larderEquipValidate];
    }
    
}

- (void)larderEquipValidate{
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:[NSString stringWithFormat:@"/api/user/debit/card/get/%@",self.CardID] Params:[NSMutableDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            self.data = responseObject[@"data"];
            [self loadData];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
    
}


- (void)phoenixEntertainment{
    
    NSArray *data = [NSMutableArray arrayWithObjects:@"姓名",@"身份证",@"储蓄卡号",@"储蓄卡预留电话", nil];
    for (int i = 0; i < data.count; i++) {
        DHSDpnz_x3 *model = [DHSDpnz_x3 new];
        model.name = data[i];
        
        model.placeholder = [NSString stringWithFormat:@"请输入%@",data[i]];
        
        
        [self.dataArr addObject:model];
    }
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(200);
        make.left.top.right.offset(0);
    }];
    
    [self.view addSubview:self.finishBtn];
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 46));
        make.left.offset(15);
        make.top.equalTo(self.tableView.mas_bottom).offset(50);
    }];
    self.rightbtn = [UIButton new];
    
    if (self.empowerToken.length > 0) {
        
        [self.finishBtn setHidden:YES];
        self.tableView.userInteractionEnabled = NO;
        
        UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [settingButton setFrame:CGRectMake(10.0, 0.0, 44.0, 44.0)];
        [settingButton addTarget:self action:@selector(settingButtonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [settingButton setTitle:@"编辑" forState:UIControlStateNormal];
        [settingButton setTitle:@"取消" forState:UIControlStateSelected];
        [settingButton setTitleColor:FontThemeColor forState:UIControlStateNormal];
        settingButton.titleLabel.font = [UIFont getUIFontSize:15 IsBold:NO];
        [settingButton setEnlargeEdgeWithTop:15 right:15 bottom:15 left:15];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 44.0, 44.0)];
        [view addSubview:settingButton];
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:view];
        
        self.navigationItem.rightBarButtonItem = rightItem;
        
    }else{
        self.rightbtn.selected = YES;
    }
    
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


- (void)settingButtonOnClicked:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    self.rightbtn.selected = sender.selected;
    if (sender.selected) {
        [self.finishBtn setHidden:NO];
        self.tableView.userInteractionEnabled = YES;
        [self loadData];
    }else{
        [self.finishBtn setHidden:YES];
        self.tableView.userInteractionEnabled = NO;
        [self loadData];
    }
    
}

#pragma 懒加载

- (void)loadData{
    DHSDpnz_x3 *model0 = self.dataArr[0];
    DHSDpnz_x3 *model1 = self.dataArr[1];
    DHSDpnz_x3 *model2 = self.dataArr[2];
    DHSDpnz_x3 *model3 = self.dataArr[3];
    
    model0.content = self.data[@"fullname"];
    model1.content = [self.data[@"idCard"] length] == 0 ? self.customer_idCard : self.data[@"idCard"];
    model2.content = self.data[@"cardNo"];
    model3.content = self.data[@"phone"];
    
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
