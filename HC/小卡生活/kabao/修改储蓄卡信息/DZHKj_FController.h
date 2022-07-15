
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ModifySavingsCardBlock)(NSString *cardNo , NSString *phone);

@interface DZHKj_FController : LXZtjte_qController

@property (nonatomic , strong) NSString *CardID;

@property (nonatomic , copy) ModifySavingsCardBlock block;
@property (nonatomic , strong) NSDictionary *data;

@property (nonatomic , strong) NSString *empowerToken;
@property (nonatomic , strong) NSString *customer_idCard;

@end

NS_ASSUME_NONNULL_END
