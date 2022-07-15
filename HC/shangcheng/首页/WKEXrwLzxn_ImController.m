
#import "WKEXrwLzxn_ImController.h"
#import "MEzsku_Eh0Cell.h"
#import "OUPo_vvView.h"
#import "TMWolf_RX.h"
#import "BCiynw_PIController.h"
@interface WKEXrwLzxn_ImController()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong)OUPo_vvView * headerView;
@property (nonatomic , strong) NSArray *dataHotArr;

@end
@implementation WKEXrwLzxn_ImController




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MEzsku_Eh0Cell * cell = [tableView dequeueReusableCellWithIdentifier:@"MEzsku_Eh0Cell" forIndexPath:indexPath];
    NSDictionary *data = self.dataHotArr[indexPath.row];
    
    [cell.img sd_setImageWithURL:data[@"pict_url"] placeholderImage:[UIImage imageNamed:@"introspectionPregnancy"]];
    
    cell.title.text = data[@"title"];
    
    
    NSString *priceStr = [NSString stringWithFormat:@"¥%@",data[@"size"]];
    
    NSString *salesStr = [NSString stringWithFormat:@"%@",data[@"volume"]];
    
    cell.content.attributedText =  [UILabel setupAttributeString:[NSString stringWithFormat:@"%@ %@人付款",priceStr,salesStr] rangeText:priceStr textColor:[UIColor colorWithHexString:@"#FF8100"] textFont:[UIFont getUIFontSize:18 IsBold:NO]];
    
    
    
    return cell;
}
#pragma 热门推荐

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *data = self.dataHotArr[indexPath.row];

    BCiynw_PIController *VC = [BCiynw_PIController new];

    VC.tao_id = data[@"tao_id"];
    [self.xp_rootNavigationController pushViewController:VC animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (!_headerView) {
        _headerView =  [[NSBundle mainBundle]loadNibNamed:@"OUPo_vvView" owner:nil  options:nil].firstObject;
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 385);
        _headerView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        _headerView.autoresizingMask = UIViewAutoresizingNone;

    }
    return _headerView;

}

- (void)loadData{
    
    int x = arc4random() % 14 + 1;

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"1" forKey:@"page"];
    [params setObject:@"14" forKey:@"page_size"];
    [params setObject:@(x) forKey:@"cid"];

    [self NetWorkingPostWithURL:self hiddenHUD:YES url:@"/api/shop/api/getGood/all" Params:params success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"status"] intValue] == 200) {
            self.dataHotArr = responseObject[@"content"];
            [self.tableView reloadData];
        }
    } failure:^(NSString * _Nonnull error) {

    }];
    
}

-(void)viewDidLoad{
    self.navigationItem.title = @"小卡生活";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.navigationBarHidden = YES;
    self.tableView.contentInset = UIEdgeInsetsMake(-kStatusBarHeight, 0, 0, 0  );

    [self.tableView registerNib:[UINib nibWithNibName:@"MEzsku_Eh0Cell" bundle:nil] forCellReuseIdentifier:@"MEzsku_Eh0Cell"];
    [self loadData];
    
    [self toLogin];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 385;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataHotArr count];
}
@end
