
#import "INZcy_MHFCell.h"

#define kRGBColor(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define percent 0.9
#define duration_First 1.0 
#define duration_Second 1.0
#define TimeInterval 0.01  

#define lineWH 45

@interface INZcy_MHFCell()


@property (nonatomic, strong) UIView *bgView;
@property (strong, nonatomic) UILabel *progressLab;

@property (nonatomic,strong) CAShapeLayer *progressLayer;
@property (strong, nonatomic) NSTimer *timer;

@property (assign, nonatomic) CGFloat showProgress;


@end

@implementation INZcy_MHFCell


- (void)robeLaneAugust{
    
    [self.bg_view addSubview:self.bgView];
    [self.bgView addSubview:self.progressLab];
    
    self.bgView.frame = CGRectMake(DEVICE_WIDTH- 130, CGRectGetMaxY(self.zhiding_jihua_lab.frame)-20-4, lineWH, lineWH);
    
    [self.progressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgView);
    }];
    
    
    [self householdOperativeCleaveIntellectual];
    
}


- (void)setProgress:(CGFloat)progress{
    
    _progress = progress;
    
    
    if (progress != 10000) {
        [self.bgView setHidden:NO];
        [self.progressLab setHidden:NO];
        [self speciousHandicappedStouthearted];
        [self.progressLayer removeAllAnimations];
        self.progressLayer.strokeEnd = 0;
        self.progressLab.text = @"0%";

        self.showProgress = 0;
        
        __weak __typeof(&*self)weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
            
            [weakSelf scenarioMillineryConcave];
            
            [weakSelf startTimer];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration_First * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [weakSelf displayPalatableWalkerFormula];
            });
        });
    }else{
        [self.bgView setHidden:YES];
        [self.progressLab setHidden:YES];
    }
    
}



- (void)scenarioMillineryConcave{
    CABasicAnimation *animation_1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation_1.fromValue = @0;
    animation_1.toValue = [NSNumber numberWithDouble:self.progress*percent];
    animation_1.duration = duration_First;
    animation_1.fillMode = kCAFillModeForwards;
    animation_1.removedOnCompletion = NO;
    [self.progressLayer addAnimation:animation_1 forKey:nil];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self consumptionRobotCentury];
}


- (void)householdOperativeCleaveIntellectual{

    
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(lineWH/2, lineWH/2) radius:(lineWH-17)/2.0 startAngle:-M_PI/2 endAngle:3*M_PI/2 clockwise:YES];
    
    [kRGBColor(0xF6F6F9) set];
    circlePath.lineWidth = 10;
    
    [circlePath stroke];
    
    
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = self.bgView.bounds;
    bgLayer.fillColor = [UIColor clearColor].CGColor;
    bgLayer.lineWidth = 4;
    bgLayer.strokeColor = [UIColor colorWithHexString:@"#FFFFFF" alpha:0.5].CGColor;
    bgLayer.strokeStart = 0;
    bgLayer.strokeEnd = 1;
    bgLayer.lineCap = kCALineCapRound;
    bgLayer.path = circlePath.CGPath;
    [self.bgView.layer addSublayer:bgLayer];
    
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bgView.bounds;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.lineWidth = 4;
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.strokeColor = kRGBColor(0xC8A159).CGColor;
    _progressLayer.strokeStart = 0;
    _progressLayer.strokeEnd = 0;
    _progressLayer.path = circlePath.CGPath;
    [self.bgView.layer addSublayer:_progressLayer];
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    [self.bgView.layer addSublayer:gradientLayer];
    
    
    CAGradientLayer *leftGradientLayer = [CAGradientLayer layer];
    leftGradientLayer.frame = CGRectMake(0, 0, lineWH/2, lineWH);
    [leftGradientLayer setColors:[NSArray arrayWithObjects:(id)kRGBColor(0xEBD6AB).CGColor, (id)kRGBColor(0xC6A05D).CGColor, nil]];
    [leftGradientLayer setLocations:@[@0.0,@1.0]];
    [leftGradientLayer setStartPoint:CGPointMake(0, 0)];
    [leftGradientLayer setEndPoint:CGPointMake(0, 1)];
    [gradientLayer addSublayer:leftGradientLayer];
    
    CAGradientLayer *rightGradientLayer = [CAGradientLayer layer];
    rightGradientLayer.frame = CGRectMake(lineWH/2, 0, lineWH/2, lineWH);
    [rightGradientLayer setColors:[NSArray arrayWithObjects:(id)kRGBColor(0xEBD6AB).CGColor, (id)kRGBColor(0xC6A05D).CGColor, nil]];
    [rightGradientLayer setLocations:@[@0.0,@1.0]];
    [rightGradientLayer setStartPoint:CGPointMake(0, 0)];
    [rightGradientLayer setEndPoint:CGPointMake(0, 1)];
    [gradientLayer addSublayer:rightGradientLayer];
    [gradientLayer setMask:_progressLayer];
    
}


- (void)speciousHandicappedStouthearted{
    [self.timer invalidate];
    self.timer = nil;
}


- (void)animate:(NSTimer *)time{
    if (self.showProgress <= self.progress*percent) {
        self.showProgress += TimeInterval*self.progress*percent/duration_First;
    }else if (self.showProgress <= self.progress){
        self.showProgress += TimeInterval*self.progress*(1-percent)/duration_Second;
    }else{
        [self speciousHandicappedStouthearted];
    }
    
    if (self.showProgress > 1) {
        self.showProgress = 1;
    }
    
    NSString *progressStr = [NSString stringWithFormat:@"%.0f%%",self.showProgress*100];
    self.progressLab.text = progressStr;
}


- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]init];
    }
    return _bgView;
}


- (void)startTimer{
    [self speciousHandicappedStouthearted];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:TimeInterval target:self selector:@selector(animate:) userInfo:nil repeats:YES];
}

#pragma mark - action

- (UILabel *)progressLab{
    if (_progressLab == nil) {
        _progressLab = [[UILabel alloc]init];
        _progressLab.textColor = FontThemeColor;
        _progressLab.textAlignment = NSTextAlignmentLeft;
        _progressLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:8];
        _progressLab.text = @"0%";
    }
    return _progressLab;
}




#pragma mark - getter


- (void)displayPalatableWalkerFormula{
    CABasicAnimation *animation_2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation_2.fromValue = [NSNumber numberWithDouble:self.progress*percent];
    animation_2.toValue = [NSNumber numberWithDouble:self.progress];
    animation_2.duration = duration_Second;
    animation_2.fillMode = kCAFillModeForwards;
    animation_2.removedOnCompletion = NO;
    [self.progressLayer addAnimation:animation_2 forKey:nil];
    
}




- (void)consumptionRobotCentury{
    
    [self.bg_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
    
    [self.bg_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(10);
        make.right.bottom.offset(-10);
    }];
    [self.delete_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.top.offset(17);
        make.left.offset(17);
    }];
    
    [self.yinlian_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.offset(10);
        make.right.offset(-25);
    }];
    self.lishi_lab.layer.masksToBounds = YES;
    self.lishi_lab.layer.borderColor = [UIColor colorWithHexString:@"#1A1A4B"].CGColor;
    self.lishi_lab.layer.borderWidth = 0.5;
    self.lishi_lab.layer.cornerRadius = 5;
    self.lishi_lab.userInteractionEnabled = YES;
    [self.lishi_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(56, 17));
        make.top.equalTo(self.yinlian_image.mas_bottom).offset(3);
        make.right.offset(-25);
    }];

    [self.yinhang_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.top.equalTo(self.delete_image.mas_bottom).offset(-1);
        make.left.equalTo(self.delete_image.mas_right).offset(6);
    }];
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yinhang_image.mas_top).offset(0);
        make.left.equalTo(self.yinhang_image.mas_right).offset(10);
    }];
    [self.content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title_lab.mas_bottom).offset(8);
        make.left.equalTo(self.title_lab.mas_left);
    }];
    
    
    [self.line_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(0.5);
        make.left.offset(30);
        make.right.offset(-30);
        make.top.equalTo(self.content_lab.mas_bottom).offset(12);
    }];
    
    [self.jihua_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yinhang_image.mas_left);
        make.top.equalTo(self.line_view.mas_bottom).offset(14);
    }];
    
    self.zhiding_jihua_lab.layer.masksToBounds = YES;
    self.zhiding_jihua_lab.layer.borderColor = [UIColor colorWithHexString:@"#1A1A4B"].CGColor;
    self.zhiding_jihua_lab.layer.borderWidth = 0.5;
    self.zhiding_jihua_lab.layer.cornerRadius = 5;
    self.zhiding_jihua_lab.userInteractionEnabled = YES;
    [self.zhiding_jihua_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(56, 17));
        make.centerY.equalTo(self.jihua_lab);
        make.right.offset(-25);
    }];
    
    
    [self robeLaneAugust];
    
}

@end
