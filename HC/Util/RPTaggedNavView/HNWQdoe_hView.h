
#import <UIKit/UIKit.h>

@protocol RPTaggedNavViewDelegate <NSObject>
@optional

- (void)haveSelectedIndex:(NSInteger )index;

@end

@interface HNWQdoe_hView : UIView


@property (nonatomic, strong) NSArray * dataArr;

@property (nonatomic, strong) UIColor * tagTextColor_normal;

@property (nonatomic, strong) UIColor * tagTextColor_selected;

@property (nonatomic, assign)CGFloat tagTextFont_normal;

@property (nonatomic, assign)CGFloat tagTextFont_selected;

@property (nonatomic, strong)UIColor *sliderColor;

@property (nonatomic, assign)CGFloat sliderW;

@property (nonatomic, assign)CGFloat sliderH;

@property (nonatomic, assign)id<RPTaggedNavViewDelegate> delegate;


- (void)selectingOneTagWithIndex:(NSInteger )index;



















@end
