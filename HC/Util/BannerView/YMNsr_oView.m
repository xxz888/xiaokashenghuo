
#import "YMNsr_oView.h"
#import "UIImageView+WebCache.h"
@interface YMNsr_oView()<CAAnimationDelegate>

@property (nonatomic,strong) UIImageView *imgView;                  
@property (nonatomic,strong) NSArray *imgArr;                       
@property (nonatomic, strong) NSTimer *myTimer;                     
@property (nonatomic, strong) UIPageControl *pageControl;           
@end

@implementation YMNsr_oView
{
    CGFloat SELFWIDTH;
    CGFloat SELFHEIGHT;
    NSInteger totalNumber;
    NSInteger currentPage;
    NSMutableArray *bannerImageArray;
    NSInteger bannerSourceType;
}

- (void)equableCanary:(CGFloat)timeInterval {
    self.myTimer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(handleSwipeFromRight) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.myTimer forMode:NSDefaultRunLoopMode];
}

#pragma mark - SetMethod

- (instancetype)initWithFrame:(CGRect)frame WithBannerSource:(NinaBannerSource)bannerSource WithBannerArray:(NSArray *)bannerArray{
    if (self = [super initWithFrame:frame]) {
        SELFWIDTH = frame.size.width;
        SELFHEIGHT = frame.size.height;
        totalNumber = bannerArray.count;
        currentPage = 0;
        _imgArr = bannerArray;
        bannerSourceType = bannerSource;
        
        self.imgArr = bannerArray;
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.imgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.imgView];
        self.imgView.userInteractionEnabled = YES;
        if (bannerSourceType == 0) {
            self.imgView.image = [UIImage imageNamed:self.imgArr[currentPage]];
        }else if (bannerSourceType == 1) {
            [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.imgArr[currentPage]]];
        }

        UISwipeGestureRecognizer *fromRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromRight)];
        [fromRightRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
        [self.imgView addGestureRecognizer:fromRightRecognizer];

        UISwipeGestureRecognizer *fromLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromLeft)];
        [fromLeftRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
        [self.imgView addGestureRecognizer:fromLeftRecognizer];
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImgView)];
        [self.imgView addGestureRecognizer:tapRecognizer];
        [self equableCanary:5];
    }
    return self;
}

- (UIPageControl *)pageControl {
    
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = totalNumber;
        CGSize size = [_pageControl sizeForNumberOfPages:totalNumber];
        _pageControl.frame = CGRectMake(0, 0, size.width, size.height);
        _pageControl.center = CGPointMake(self.center.x, SELFHEIGHT - 8);
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.hidesForSinglePage = YES;
    }
    return _pageControl;
}


- (void)animationDidStart:(CAAnimation *)theAnimation{
    if (self.myTimer) {
        [self.myTimer invalidate];
    }
    self.imgView.userInteractionEnabled = NO;
}

#pragma mark - LazyLoad

- (void)handleSwipeFromLeft{
    
    currentPage--;
    if (currentPage < 0 ) {
        currentPage = self.imgArr.count-1;
    }
    self.pageControl.currentPage = currentPage;
    
    if (bannerSourceType == 0) {
        self.imgView.image = [UIImage imageNamed:self.imgArr[currentPage]];
    }else if (bannerSourceType == 1) {
        [ self.imgView sd_setImageWithURL:[NSURL URLWithString:self.imgArr[currentPage]]];
    }

    CATransition *transition2 = [[CATransition alloc] init];
    transition2.type = @"cube";
    transition2.subtype = kCATransitionFromLeft;
    transition2.duration = 0.5;
    transition2.delegate = self;
    [self.imgView.layer addAnimation:transition2 forKey:nil];
    

}


- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}

- (void)handleSwipeFromRight{
    currentPage++;
    if (currentPage >= self.imgArr.count) {
        currentPage = 0;
    }
    self.pageControl.currentPage = currentPage;

    if (bannerSourceType == 0) {
        self.imgView.image = [UIImage imageNamed:self.imgArr[currentPage]];
    }else if (bannerSourceType == 1) {
        [ self.imgView sd_setImageWithURL:[NSURL URLWithString:self.imgArr[currentPage]]];
    }
    
    
    CATransition *transition = [[CATransition alloc] init];
    transition.type = @"cube";                
    transition.subtype = kCATransitionFromRight;
    transition.duration = 0.5;
    transition.delegate = self;
    [self.imgView.layer addAnimation:transition forKey:nil];
    

}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.timeInterval > 0) {
        [self equableCanary:self.timeInterval];
    }else {
        [self equableCanary:5.0];
    }
    self.imgView.userInteractionEnabled = YES;
}


- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
}

- (void)tapImgView{
    
    if ([self.delegate respondsToSelector:@selector(hhBannerView:didSelectItemAtIndex:)]) {
        [self.delegate hhBannerView:self didSelectItemAtIndex:currentPage];
    }
}


- (void)setShowPageControl:(BOOL)showPageControl {
    if (showPageControl == YES) {
        [self addSubview:self.pageControl];
    }
}


- (void)setTimeInterval:(CGFloat)timeInterval {
    _timeInterval = fabs(timeInterval);
    if (self.myTimer) {
        [self.myTimer invalidate];
        [self equableCanary:_timeInterval];
    }
}
@end
