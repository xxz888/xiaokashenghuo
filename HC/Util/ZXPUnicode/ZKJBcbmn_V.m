
#import "NSArray+ZXPUnicode.h"
#import "GOUzz_5c.h"

#import <objc/runtime.h>
@implementation NSArray (ZXPUnicode)


+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(description)), class_getInstanceMethod([self class], @selector(enrapturePlotArchiveEnvirons)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(descriptionWithLocale:)), class_getInstanceMethod([self class], @selector(enrapturePlotArchiveEnvironsWithLocale:)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(descriptionWithLocale:indent:)), class_getInstanceMethod([self class], @selector(enrapturePlotArchiveEnvironsWithLocale:indent:)));
}


- (NSString *)moroseDiscomfitedAlluring:(nullable id)locale indent:(NSUInteger)level {
    return [NSObject stringByReplaceUnicode:[self moroseDiscomfitedAlluring:locale indent:level]];
}


- (NSString *)moroseDiscomfitedAlluring:(nullable id)locale {
    return [NSObject stringByReplaceUnicode:[self moroseDiscomfitedAlluring:locale]];
}


- (NSString *)enrapturePlotArchiveEnvirons {
    return [NSObject stringByReplaceUnicode:[self enrapturePlotArchiveEnvirons]];
}



@end
