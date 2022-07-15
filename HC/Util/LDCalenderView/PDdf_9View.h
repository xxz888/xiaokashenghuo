
#import <UIKit/UIKit.h>
#import "LDCalendarConst.h"

typedef void(^DaysSelectedBlock)(NSArray *result);

@interface PDdf_9View : UIView
@property (nonatomic, strong) NSArray          *defaultDays;
@property (nonatomic, copy  ) DaysSelectedBlock complete;

@property (nonatomic, assign) NSInteger minDay;



- (id)initWithFrame:(CGRect)frame;
- (void)show;
- (void)hide;
@end
