
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSString * error);

@interface UIViewController (HUD)

- (void)Show;

- (void)dismiss;

#pragma Post数据请求
- (void)NetWorkingPostWithURL:(UIViewController *)Controller hiddenHUD:(BOOL)hidden url:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;

#pragma Post请求省市
- (void)NetWorkingPostWithAddressURL:(UIViewController *)Controller hiddenHUD:(BOOL)hidden url:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;

#pragma AFN上传图片 单张
- (void)NetWorkingPostWithImageURL:(UIViewController *)Controller hiddenHUD:(BOOL)hidden url:(NSString *)url Params:(NSMutableDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
