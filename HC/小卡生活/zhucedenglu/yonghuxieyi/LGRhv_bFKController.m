
#import "LGRhv_bFKController.h"
#import <WebKit/WebKit.h>

@interface LGRhv_bFKController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation LGRhv_bFKController


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
}



#pragma mark - WKNavigationDelegate


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [self.whereCome isEqualToString:@"1"] ? @"注册协议" : @"用户信息授权协议";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self changeTheNavigationBarStyle:[UIColor blackColor] navTitle:[UIColor blackColor] navBackgroundColor:[UIColor whiteColor]];

    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT - kStatusBarHeight + 44) configuration:config];
    [self.view addSubview:self.webView];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[self.whereCome isEqualToString:@"1"] ? @"UserAgreement.html" : @"UserAuthorize.html" ofType:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
    
    self.webView.navigationDelegate = self;
}

@end
