
#import <UIKit/UIKit.h>

typedef void(^LabelScrollViewBlock)(NSString *str);

@interface DKAYfYli_aView : UIView
@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)showNext;
- (void)removeTimer;
- (void)addTimer;

@property (nonatomic , strong) LabelScrollViewBlock block;

@end
