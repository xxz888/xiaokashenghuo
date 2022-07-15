
#import "ATHf_9.h"
#import <objc/runtime.h>


@implementation UIViewController (HideNavBackTitle)


+(void)load {
    swizzleMethod([self class], @selector(viewDidAppear:), @selector(fidelityTrussSubpoenaDestructible));
}
 

- (void)fidelityTrussSubpoenaDestructible{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@""
                                              style:UIBarButtonItemStylePlain
                                              target:self
                                              action:nil];
    [self fidelityTrussSubpoenaDestructible];
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
     
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
     
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
