

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@protocol BackButtonHandlerProtocol <NSObject>

@optional

-(BOOL)navigationShouldPopOnBackButton;

@end

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end
