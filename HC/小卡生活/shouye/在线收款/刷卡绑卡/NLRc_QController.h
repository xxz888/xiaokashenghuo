
#import "LXZtjte_qController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^CreditCardToCardBlock)(NSString *str);

@interface NLRc_QController : LXZtjte_qController

@property (nonatomic , strong) NSDictionary *cardData;

@property (nonatomic , copy) CreditCardToCardBlock block;

@property (nonatomic , strong) NSString *channelId;




@end

NS_ASSUME_NONNULL_END
