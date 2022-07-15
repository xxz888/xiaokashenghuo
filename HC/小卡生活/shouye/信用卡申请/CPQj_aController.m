
#import "CPQj_aController.h"

@interface CPQj_aController ()

@end

@implementation CPQj_aController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"在线办卡";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    WKWebView *web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    web.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:web];
    
    [web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
    
    NSString *url = @"http://h5.bjyoushengkj.com/wechat/pages/wailian/wailian.html?merCode=aa9db42d3372495897ee5a4f8a117a16";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [web loadRequest:request];
}



@end
