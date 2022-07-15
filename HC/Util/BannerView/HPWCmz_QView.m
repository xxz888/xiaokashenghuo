
#import "HPWCmz_QView.h"
@interface HPWCmz_QView()<UIScrollViewDelegate>
{
  NSInteger _currentPage; 
  NSTimer *_timer; 
}
@property (nonatomic,assign) BOOL isRun;
@property (nonatomic,strong) NSMutableArray *imageArray;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@end

@implementation HPWCmz_QView


-(void)postmanNobodyRifleParaphrase{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _width, _height)];
    _scrollView.contentSize = CGSizeMake(_width*self.imageArray.count, _height);
    for (int i = 0; i < self.imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*_width, 0, _width, _height)];
        if ([self.imageArray[i] isKindOfClass:[UIImage class]]) {
            imageView.image = self.imageArray[i];
        }else{
            [imageView sd_setImageWithURL:self.imageArray[i] placeholderImage:[UIImage imageNamed:@"home_banner_blank"]];
        }
        imageView.userInteractionEnabled = YES;
        imageView.tag = 200+i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [imageView addGestureRecognizer:tap];
        [_scrollView addSubview:imageView];
    }
    _scrollView.layer.cornerRadius = 5;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.bounces = NO;
    
    _scrollView.contentOffset = CGPointMake(_width, 0);
    
    _scrollView.delegate = self;
    
    _scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
  
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  if (_timer) {
    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
  }
  
  
  
  CGPoint point = _scrollView.contentOffset;
  if (point.x == (self.imageArray.count-1)*_width) {
    scrollView.contentOffset = CGPointMake(_width, 0);
  }
  if (point.x == 0) {
    scrollView.contentOffset = CGPointMake((self.imageArray.count-2)*_width, 0);
  }
  
  CGPoint endPoint = scrollView.contentOffset;
  _currentPage = endPoint.x/_width;
  _pageControl.currentPage = _currentPage-1;
}

-(id)initWithFrame:(CGRect)frame andImageNameArray:(NSMutableArray *)imageNameArray andIsRunning:(BOOL)isRunning{
  self = [super initWithFrame:frame];
  if (self) {
    _width = self.frame.size.width;
    _height = self.frame.size.height;
    
    self.imageArray = [NSMutableArray arrayWithArray:imageNameArray];
    
    [self.imageArray addObject:[imageNameArray firstObject]];
    
    [self.imageArray insertObject:[imageNameArray lastObject] atIndex:0];
    self.isRun = isRunning;
    _currentPage = 0;
    [self postmanNobodyRifleParaphrase];
    [self stutterLoudspeakerMethodical];
    [self franchiseVicariousInequity];
  }
  return self;
}

-(void)stutterLoudspeakerMethodical{
  _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(_width-200, _height-30, 100, 30)];
  _pageControl.centerX = _width/2;
  _pageControl.numberOfPages = self.imageArray.count-2;
  _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
  _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
  _pageControl.userInteractionEnabled = NO;
  [self addSubview:_pageControl];
}

-(void)change{
  
  CGPoint point = _scrollView.contentOffset;
  
  CGPoint endPoint = CGPointMake(point.x+_width, 0);
  
  if (endPoint.x == (self.imageArray.count-1)*_width) {
    [UIView animateWithDuration:0.25 animations:^{
        self->_scrollView.contentOffset = CGPointMake(endPoint.x, 0);
    } completion:^(BOOL finished) {
      
        self->_scrollView.contentOffset = CGPointMake(self->_width, 0);
        CGPoint realEnd = self->_scrollView.contentOffset;
        
        self->_currentPage = realEnd.x/self->_width;
        self->_pageControl.currentPage = self->_currentPage-1;
    }];
  }
  else{
    
      [UIView animateWithDuration:0.25 animations:^{
          self->_scrollView.contentOffset = endPoint;
    } completion:^(BOOL finished) {
    }];
        CGPoint realEnd = _scrollView.contentOffset;
    
    _currentPage = realEnd.x/_width;
    _pageControl.currentPage = _currentPage-1;
  }
}

-(void)tap:(UITapGestureRecognizer *)tap{
  if(_delegate&&[_delegate respondsToSelector:@selector(sendImageName:)]){
    [_delegate sendImageName:tap.view.tag-201];
  }else{
    NSLog(@"没有设置代理或者没有事先协议的方法");
  }
}
#pragma mark UIScrollViewDelegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
  if (_timer) {
    
    [_timer setFireDate:[NSDate distantFuture]];
  }
}

-(void)franchiseVicariousInequity{
  if (_isRun == YES) {
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(change) userInfo:nil repeats:YES ];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];  }
}

@end
