
#import "QOkhoiZbw_OLwController.h"

@interface QOkhoiZbw_OLwController ()

@end

@implementation QOkhoiZbw_OLwController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"在线客服";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    WKWebView *web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    web.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:web];
    
    [web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
    
    NSString *url = @"https://tb.53kf.com/code/client/fc25d13606aea048aad115359d019b9f5/1";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [web loadRequest:request];

    
}



@end
