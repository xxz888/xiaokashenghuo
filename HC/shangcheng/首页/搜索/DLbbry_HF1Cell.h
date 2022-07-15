
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SearchTipsBlock)(NSString *strName);

@interface DLbbry_HF1Cell : UITableViewCell

-(void)setDataArr:(NSMutableArray *)Arr;

@property (nonatomic , copy) SearchTipsBlock block;

@end

NS_ASSUME_NONNULL_END
