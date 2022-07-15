
#import "TReoce_Kc.h"

@implementation UIFont (Category)


+ (instancetype)getUIFontSize:(CGFloat)size IsBold:(BOOL)isBold{
    if (isBold) {
        return  [UIFont fontWithName:@"Helvetica-Bold" size:size];
    }
    return  [UIFont systemFontOfSize:size];
}

+ (instancetype)getUIFontSize:(CGFloat)size FontType:(NSString *)typeStr{
    return  [UIFont fontWithName:typeStr size:size];
}


@end
