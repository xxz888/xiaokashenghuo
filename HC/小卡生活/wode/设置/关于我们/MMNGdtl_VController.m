
#import "MMNGdtl_VController.h"

@interface MMNGdtl_VController ()
@property (weak, nonatomic) IBOutlet UILabel *title_lab;

@end

@implementation MMNGdtl_VController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString  *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    self.title_lab.text = [NSString stringWithFormat:@"%@",app_Version];
    
}



@end
