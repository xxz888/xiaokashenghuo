

#import "DKAYfYli_aView.h"


static CGFloat const AniDuration = 1.8;

@interface DKAYfYli_aView ()

@property (nonatomic, weak) UILabel *upLabel;

@property (nonatomic, weak) UILabel *downLabel;

@property (nonatomic, assign) BOOL upLabelIsUP;

@property (nonatomic, assign) BOOL isAni;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation DKAYfYli_aView

#pragma mark - public method

- (UILabel *)upLabel {
    if (!_upLabel) {
        UILabel *up = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:up];
        _upLabel = up;
        up.font = [UIFont getUIFontSize:15 IsBold:YES];
        up.textColor = [UIColor blackColor];
        up.textAlignment = NSTextAlignmentLeft;
        up.userInteractionEnabled = YES;
        [up addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    }
    return _upLabel;
}


- (void)tap:(UITapGestureRecognizer *)tap {
    if (self.block) {
        self.block([tap.view valueForKey:@"text"]);
    }
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.upLabelIsUP = YES;
        self.isAni = NO;
        self.clipsToBounds = YES;
        self.currentIndex = 0;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma mark - life cycle

- (UILabel *)downLabel {
    if (!_downLabel) {
        UILabel *down = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
        [self addSubview:down];
        _downLabel = down;
        down.font = [UIFont getUIFontSize:15 IsBold:YES];
        down.textColor = [UIColor blackColor];
        down.textAlignment = NSTextAlignmentLeft;
        down.userInteractionEnabled = YES;
        [down addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    }
    return _downLabel;
}

#pragma mark - setter

- (void)affluentWarp {
    if (self.currentIndex == self.dataSource.count) {
        self.currentIndex = 0;
    }
    if (self.currentIndex % 2 == 0) {
        self.upLabel.text = [self.dataSource objectAtIndex:self.currentIndex];
    }else {
        self.downLabel.text = [self.dataSource objectAtIndex:self.currentIndex];
    }
    self.currentIndex ++;
}

#pragma mark - private method


- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)showNext:(id)sender {
    if (self.isAni) {
        return;
    }
    self.isAni = YES;
    [UIView animateWithDuration:AniDuration animations:^{
        if (self.upLabelIsUP == YES) {
            self.upLabel.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
            self.downLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        }else {
            self.downLabel.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
            self.upLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        }
    } completion:^(BOOL finished) {
        if (self.upLabelIsUP == YES) {
            
            self.upLabel.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
            self.upLabelIsUP = NO;
        }else {
            
            self.downLabel.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
            self.upLabelIsUP = YES;
        }
        self.isAni = NO;
        
        [self affluentWarp];
    }];
}


- (void)showNext {
    [self showNext:nil];
}

#pragma mark - getter

- (void)addTimer {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:AniDuration target:self selector:@selector(showNext:) userInfo:nil repeats:YES];
    }
}


- (void)setDataSource:(NSMutableArray *)dataSource {
    _dataSource = dataSource;
    if (self.dataSource.count == 0) {
        return;
    }
    if (dataSource.count%2 == 1) {
        
        [dataSource addObjectsFromArray:dataSource];
    }
    
    [self affluentWarp];
    [self affluentWarp];
    [self addTimer];
}


@end
