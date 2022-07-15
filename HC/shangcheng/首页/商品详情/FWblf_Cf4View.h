
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FWblf_Cf4View : UIView

- (instancetype)initWithFrame:(CGRect)frame;

- (void)ShowView;
- (void)disMissView;

@property (nonatomic, assign) CGFloat top_H;

@property (strong , nonatomic) UIImageView *goods_image;
@property (strong , nonatomic) UILabel *goods_name;
@property (strong , nonatomic) UILabel *goods_vouchersxxxAfter_price;

@property (strong , nonatomic) UIView *line;

@property (strong , nonatomic) UILabel *BuyNow_number_lab;
@property (strong , nonatomic) UILabel *ReductionOf_number;
@property (strong , nonatomic) UILabel *BuyNow_number;
@property (strong , nonatomic) UILabel *add_number;
@property (strong , nonatomic) UIButton *finishBtn;

@end

NS_ASSUME_NONNULL_END
