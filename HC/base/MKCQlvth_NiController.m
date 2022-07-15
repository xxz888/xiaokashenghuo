
#import "MKCQlvth_NiController.h"

@implementation MKCQlvth_NiController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.navTitle;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    WKWebView *web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    web.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:web];
    
    [web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.bottom.offset(-KBottomHeight);
    }];
    
    
    NSString *url = self.url;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [web loadRequest:request];
}

@end
