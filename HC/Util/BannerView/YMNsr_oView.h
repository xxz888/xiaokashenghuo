
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, NinaBannerSource) {
    NinaBannerStyleOnlyLocalSource = 0,         
    NinaBannerStyleOnlyWebSource = 1,           
};

@class YMNsr_oView;
@protocol HHBannerViewDelegate <NSObject>

@optional


- (void)hhBannerView:(YMNsr_oView *)bannerView didSelectItemAtIndex:(NSInteger)index;

@end

@interface YMNsr_oView : UIView


@property (nonatomic, assign) CGFloat timeInterval;

@property (nonatomic, assign) BOOL showPageControl;

@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

@property (nonatomic, weak) id<HHBannerViewDelegate> delegate;


- (instancetype)initWithFrame:(CGRect)frame WithBannerSource:(NinaBannerSource)bannerSource WithBannerArray:(NSArray *)bannerArray;

@end
