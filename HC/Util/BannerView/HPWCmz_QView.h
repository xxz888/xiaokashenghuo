
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HCBarnerViewDelegate<NSObject>
-(void)sendImageName:(NSInteger)selectImage;

@end



@interface HPWCmz_QView : UIView

@property (nonatomic,weak)id<HCBarnerViewDelegate>delegate;
-(id)initWithFrame:(CGRect)frame andImageNameArray:
(NSMutableArray * )imageNameArray andIsRunning:(BOOL)isRunning;

@end

NS_ASSUME_NONNULL_END
