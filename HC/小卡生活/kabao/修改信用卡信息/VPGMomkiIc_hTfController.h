
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ModifyTheInformationBlock)(NSString *zdStr , NSString *hkStr);

@interface VPGMomkiIc_hTfController : LXZtjte_qController

@property (nonatomic , strong) NSString *CardID;

@property (nonatomic , copy) ModifyTheInformationBlock block;

@property (nonatomic , strong) NSString *empowerToken;

@end

NS_ASSUME_NONNULL_END
