
#import "JGKSt_R.h"

@implementation UIImageView (Category)


+ (instancetype)getUIImageView:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    
    return imageView;
}

@end
