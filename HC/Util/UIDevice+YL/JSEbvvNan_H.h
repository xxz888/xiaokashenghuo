
#import <UIKit/UIKit.h>

#define HX_UI_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define HX_IS_IPHONEX (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) || CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)) || CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)) || CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(896, 414)))

#define HX_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define HX_Is_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !HX_UI_IS_IPAD : NO)

#define HX_Is_iPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !HX_UI_IS_IPAD : NO)

#define HX_Is_iPhoneXS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !HX_UI_IS_IPAD : NO)

#define HX_Is_iPhoneTwelveMini ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 2340), [[UIScreen mainScreen] currentMode].size) && !HX_UI_IS_IPAD : NO)

#define HX_Is_iPhoneTwelvePro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size) && !HX_UI_IS_IPAD : NO)

#define HX_Is_iPhoneTwelveProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1284, 2778), [[UIScreen mainScreen] currentMode].size) && !HX_UI_IS_IPAD : NO)

#define HX_IS_IPhoneX_All (HX_Is_iPhoneX || HX_Is_iPhoneXR || HX_Is_iPhoneXS || HX_Is_iPhoneXS_MAX || HX_IS_IPHONEX || HX_Is_iPhoneTwelveMini || HX_Is_iPhoneTwelvePro || HX_Is_iPhoneTwelveProMax)


NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (YL)
+ (UIWindow *)currentWindow;

+ (CGFloat)statusBarHeight ;

+ (CGFloat)bottomSafeHeight ;
+ (BOOL)isPhoneX ;


+ (NSString *)getAppVersionCode ;

+ (NSString *)getAppVersionName ;
+ (NSString *)getAppName;

@end

NS_ASSUME_NONNULL_END
