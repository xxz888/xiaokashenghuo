
#import "WBVxn_I3.h"

@implementation UIViewController (BackButtonHandler)

@end

@implementation UINavigationController (ShouldPopOnBackButton)


- (BOOL)overloaded_navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {

	if([self.viewControllers count] < [navigationBar.items count]) {
		return YES;
	}

	BOOL shouldPop = YES;
	UIViewController* vc = [self topViewController];
	if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
		shouldPop = [vc navigationShouldPopOnBackButton];
	}

	if(shouldPop) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[self popViewControllerAnimated:YES];
		});
	} else {
		
		for(UIView *subview in [navigationBar subviews]) {
			if(0. < subview.alpha && subview.alpha < 1.) {
				[UIView animateWithDuration:.25 animations:^{
					subview.alpha = 1.;
				}];
			}
		}
	}

	return NO;
}


+ (void)load {
    
    Method originalMethod = class_getInstanceMethod([self class], @selector(navigationBar:shouldPopItem:));
    Method overloadingMethod = class_getInstanceMethod([self class], @selector(overloaded_navigationBar:shouldPopItem:));
    
    method_setImplementation(originalMethod, method_getImplementation(overloadingMethod));
}

@end
