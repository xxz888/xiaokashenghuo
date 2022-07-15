
#import "PXl_3jController.h"
#import "WYCWu_nLCell.h"

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface PXl_3jController ()<UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *dataArr;

@end

@implementation PXl_3jController


- (void)snickerPendulumMotor:(NSString *)title{
    
    [self NetWorkingPostWithURL:self hiddenHUD:NO url:[NSString stringWithFormat:@"/api/user/guide/get/%@",title] Params:[NSDictionary dictionary] success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            [self piscatorialPelfSummon:responseObject[@"data"]];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
    
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    [self outstandingGateNumber];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"使用帮助";
    [self alliterationPreamble];
    [self outstandingGateNumber];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


#pragma mark - UITableViewDelegate UITableViewDataSource

- (void)piscatorialPelfSummon:(NSString *)URLStr{
    
    
    NSString *webVideoPath = URLStr;
    NSURL*webVideoUrl = [NSURL URLWithString:webVideoPath];
    
    AVPlayer * avPlayer = [[AVPlayer alloc]initWithURL:webVideoUrl];
    
    AVPlayerViewController *avPlayerVC =[[AVPlayerViewController alloc] init];
    avPlayerVC.player = avPlayer;
    [self presentViewController:avPlayerVC animated:YES completion:nil];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"WYCWu_nLCell";
    WYCWu_nLCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"WYCWu_nLCell" owner:nil options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSDictionary *dic = self.dataArr[indexPath.row];
    cell.name.text = dic[@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = self.dataArr[indexPath.row];
    [self snickerPendulumMotor:dic[@"id"]];
    
}


- (void)outstandingGateNumber{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:brandId forKey:@"brandId"];
    [self NetWorkingPostWithAddressURL:self hiddenHUD:NO url:@"/api/user/guide/title/list" Params:dic success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] intValue] == 0) {
            
            self.dataArr = [NSArray arrayWithArray:responseObject[@"data"]];
            
            [self.tableView reloadData];
        }
    } failure:^(NSString * _Nonnull error) {
        
    }];
}




- (void)alliterationPreamble{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH);
        make.left.offset(0);
        make.top.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
}
#pragma 无数据点击刷新

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

#pragma 懒加载

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bespeakPermeable"];
}
@end
