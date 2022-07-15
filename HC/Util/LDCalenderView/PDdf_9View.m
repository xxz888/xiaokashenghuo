
#import "PDdf_9View.h"
#import "MMKUltq_T.h"
#import "BKENova_5u.h"

#define UNIT_WIDTH  35 * SCREEN_RAT

static const NSInteger kRow         = 1 + 6;
static const NSInteger kCol         = 7;
static const NSInteger kTotalNum    = (kRow - 1) * kCol;
static const NSInteger kBtnStartTag = 100;

@interface PDdf_9View()
@property (nonatomic, strong) UIView         *contentBgView,*dateBgView;
@property (nonatomic, strong) UILabel        *titleLab;
@property (nonatomic, strong) UIButton       *doneBtn;
@property (nonatomic, assign) int32_t        year,month;
@property (nonatomic, strong) NSDate         *today,*firstDay; 
@property (nonatomic, strong) NSMutableArray *currentMonthDaysArray,*selectArray;
@property (nonatomic, assign) CGRect         touchRect;
@end

@implementation PDdf_9View

- (void)rationalityAlienIndiscreetConducive {
    for(int i = 0; i < kTotalNum; i++) {
        UIButton *btn = (UIButton *)[_dateBgView viewWithTag:kBtnStartTag + i];
        NSNumber *interval = [_currentMonthDaysArray objectAtIndex:i];

        if (i < [_currentMonthDaysArray count] && btn) {
            if ([_selectArray containsObject:interval]) {
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [btn setBackgroundColor:[UIColor hexColorWithString:@"1A1A4B"]];
                btn.layer.cornerRadius = 20;
                
            }
        }
    }
}


- (void)disperseFlushSnobAmbivalent {
    if (self.month < 12) {
        self.month += 1;
    }else {
        self.month = 1;
        self.year += 1;
    }
    
    [self brotherDroveDebutante];
}


- (void)initBsuccessionLotteryPackaging {
    _selectArray        = @[].mutableCopy;

    
    NSDate *currentDate = [NSDate date];
    self.month          = (int32_t)currentDate.month;
    self.year           = (int32_t)currentDate.year;
    [self brotherDroveDebutante];

    _currentMonthDaysArray = [NSMutableArray array];
    for (int i = 0; i < kTotalNum; i++) {
        [_currentMonthDaysArray addObject:@(0)];
    }

    [self beginningSurface];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.dateBgView = ({
            UIView *view         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            view.alpha           = 0.3;
            view.backgroundColor = [UIColor blackColor];
            [view bk_whenTapped:^{
                [self hide];
            }];
            [self addSubview:view];
            
            view;
        });

        self.contentBgView = ({
            
            UIView        *view         = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-UNIT_WIDTH*kCol)/2.0, 100, UNIT_WIDTH*kCol, 42+UNIT_WIDTH*kRow+50)];
            view.layer.cornerRadius     = 2.0;
            view.layer.masksToBounds    = YES;
            view.userInteractionEnabled = YES;
            view.backgroundColor        = [UIColor whiteColor];
            [self addSubview:view];
            
            ({
                UIImageView *leftImage = [UIImageView new];
                leftImage.image        = [UIImage imageNamed:@"muttonExorbitance"];
                leftImage.image        = [UIImage imageWithCGImage:leftImage.image.CGImage scale:1 orientation:UIImageOrientationDown];
                [view addSubview:leftImage];
                leftImage.frame        = CGRectMake(CGRectGetWidth(view.frame)/3.0 - 8 - 10, (42-13)/2.0, 8, 13);
            });
            
            ({
                UIImageView *rightImage = [UIImageView new];
                rightImage.image        = [UIImage imageNamed:@"muttonExorbitance"];
                [view addSubview:rightImage];
                rightImage.frame        = CGRectMake(CGRectGetWidth(view.frame)*2/3.0 + 8, (42-13)/2.0, 8, 13);
            });
            
            view;
        });

        self.titleLab = ({
            UILabel *lab               = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_contentBgView.frame), 42)];
            lab.backgroundColor        = [UIColor clearColor];
            lab.textColor              = [UIColor blackColor];
            lab.font                   = [UIFont systemFontOfSize:14];
            lab.textAlignment          = NSTextAlignmentCenter;
            lab.userInteractionEnabled = YES;
            [_contentBgView addSubview:lab];
            
            ({
                UITapGestureRecognizer *titleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchMonthTap:)];
                [lab addGestureRecognizer:titleTap];
                
                UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lab.frame) - 0.5, CGRectGetWidth(_contentBgView.frame), 0.5)];
                line.backgroundColor = [UIColor hexColorWithString:@"dddddd"];
                [_contentBgView addSubview:line];
            });
            
            lab;
        });
        
        self.dateBgView = ({
            UIView *view                = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLab.frame), CGRectGetWidth(_contentBgView.frame), UNIT_WIDTH*kRow)];
            view.userInteractionEnabled = YES;
            view.backgroundColor        = [UIColor hexColorWithString:@"ededed"];
            [_contentBgView addSubview:view];
            
            ({
                UIView *bottomLine         = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view.frame), CGRectGetWidth(_contentBgView.frame), 0.5)];
                bottomLine.backgroundColor = [UIColor hexColorWithString:@"dddddd"];
                [_contentBgView addSubview:bottomLine];
            });
            
            ({
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
                [view addGestureRecognizer:tap];
            });
            view;
        });

        self.doneBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake((CGRectGetWidth(_contentBgView.frame) - 150) / 2.0, CGRectGetHeight(_contentBgView.frame) - 40, 150, 30)];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [btn setBackgroundImage:[[UIImage imageNamed:@"balloonOstentatious"] stretchableImageWithLeftCapWidth:15 topCapHeight:10] forState:UIControlStateNormal];
            [btn setBackgroundImage:[[UIImage imageNamed:@"balloonOstentatious"] stretchableImageWithLeftCapWidth:15 topCapHeight:10] forState:UIControlStateSelected];
            [btn setBackgroundImage:[[UIImage imageNamed:@"fortuitySpawnTram"] stretchableImageWithLeftCapWidth:15 topCapHeight:10] forState:UIControlStateDisabled];
            [btn addTarget:self action:@selector(doneBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:@"确定" forState:UIControlStateNormal];
            btn.layer.masksToBounds = YES;
            [_contentBgView addSubview:btn];
            
            btn;
        });
        
        [self initBsuccessionLotteryPackaging];
    }
    return self;
}


- (void)wallowBoldnessDeerDisunite {
    CGRect baseRect = CGRectMake(0.0,0.0, UNIT_WIDTH, UNIT_WIDTH);
    NSArray *tmparr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"日"];
    for(int i = 0 ;i < 7; i++)
    {
        UILabel *lab        = [[UILabel alloc] initWithFrame:baseRect];
        lab.textColor       = [UIColor hexColorWithString:@"848484"];
        lab.textAlignment   = NSTextAlignmentCenter;
        lab.font            = [UIFont systemFontOfSize:10];
        lab.backgroundColor = [UIColor clearColor];
        lab.text            = [tmparr objectAtIndex:i];
        [_dateBgView addSubview:lab];
        
        baseRect.origin.x   += baseRect.size.width;
    }
}


- (void)switchMonthTap:(UITapGestureRecognizer *)tap {
   CGPoint loc =  [tap locationInView:_titleLab];
    CGFloat titleLabWidth = CGRectGetWidth(_titleLab.frame);
    if (loc.x <= titleLabWidth/3.0) {
        [self intelligentSauce];
    }else if(loc.x >= titleLabWidth/3.0*2.0){
        [self disperseFlushSnobAmbivalent];
    }
}


-(void)tap:(UITapGestureRecognizer *)gesture{
    CGPoint point = [gesture locationInView:_dateBgView];
    if (CGRectContainsPoint(_touchRect, point)) {
        CGFloat w       = (CGRectGetWidth(_dateBgView.frame)) / kCol;
        CGFloat h       = (CGRectGetHeight(_dateBgView.frame)) / kRow;
        int row         = (int)((point.y - _touchRect.origin.y) / h);
        int col         = (int)((point.x) / w);

        NSInteger index = row * kCol + col;
        [self bucketReciprocate:index];
    }
}


- (void)intelligentSauce{
    if (self.month > 1) {
        self.month -= 1;
    }else {
        self.month = 12;
        self.year -= 1;
    }
    
    [self brotherDroveDebutante];
}


- (CGFloat)grindZinc:(NSDate *)firstDay {
    CGFloat startDayIndex = [NSDate acquireWeekDayFromDate:firstDay];
    
    if (startDayIndex == 1) {
        
        startDayIndex = 6;
    }else {
        
        startDayIndex -= 2;
    }
    return startDayIndex;
}


- (void)doneBtnClick:(id)sender {
    if (_complete) {
        if (self.minDay <= _selectArray.count) {
            _complete([_selectArray mutableCopy]);
            [self hide];
        }else{
            [ZIONf_d showBottomWithText:@"您选择的时间小于计划最小天数" duration:3.0];
        }
    }
    
}


- (void)hide {
    self.hidden = YES;
}


- (void)setDefaultDays:(NSArray *)defaultDays {
    _defaultDays = defaultDays;
    
    if (defaultDays) {
        _selectArray = [defaultDays mutableCopy];
    }else {
        _selectArray = @[].mutableCopy;
    }
}


- (NSDate *)firstDay {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *firstDay =[dateFormat dateFromString:[NSString stringWithFormat:@"%@-%@-%@",@(self.year),@(self.month),@(1)]];
    return firstDay;
}


- (void)brotherDroveDebutante {
    _titleLab.text = [NSString stringWithFormat:@"%@月,%@年",@(self.month),@(self.year)];
    
    [self beginningSurface];
}


- (void)pirouetteConnoisseur:(NSInteger)i frame:(CGRect)baseRect {
    UIButton *btn              = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag                    = kBtnStartTag + i;
    [btn setFrame:baseRect];
    btn.userInteractionEnabled = NO;
    btn.backgroundColor        = [UIColor clearColor];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:10]];
    
    CGFloat startDayIndex = [self grindZinc:self.firstDay];
    NSDate * date = [self.firstDay dateByAddingTimeInterval: (i - startDayIndex)*24*60*60];
    _currentMonthDaysArray[i] = @([date timeIntervalSince1970]);
    NSString *title = INTTOSTR(date.day);
    if ([date isToday]) {
        title = @"今天";
        btn.layer.borderColor = [UIColor hexColorWithString:@"f49e79"].CGColor;
        btn.layer.borderWidth = 0.5;
    }
    else if(date.day == 1) {
        
        UILabel *monthLab        = [[UILabel alloc] initWithFrame:CGRectMake(baseRect.origin.x, baseRect.origin.y + baseRect.size.height - 7, baseRect.size.width, 7)];
        monthLab.backgroundColor = [UIColor clearColor];
        monthLab.textAlignment   = NSTextAlignmentCenter;
        monthLab.font            = [UIFont systemFontOfSize:7];
        monthLab.textColor       = [UIColor hexColorWithString:@"c0c0c0"];
        monthLab.text            = [NSString stringWithFormat:@"%@月",@(date.month)];
        [_dateBgView addSubview:monthLab];
    }
    
    [btn setTitle:title forState:UIControlStateNormal];
    if ([self.today compare:date] < 0) {
        
        [btn setTitleColor:[UIColor hexColorWithString:@"2b2b2b"] forState:UIControlStateNormal];
    }else {
        [btn setTitleColor:[UIColor hexColorWithString:@"bfbfbf"] forState:UIControlStateNormal];
    }
    [btn setBackgroundColor:[UIColor clearColor]];
    
    [_dateBgView addSubview:btn];
}


- (NSDate *)today {
    if (!_today) {
        NSDate *currentDate = [NSDate date];

        
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        _today = [dateFormat dateFromString:[NSString stringWithFormat:@"%@-%@-%@",@(currentDate.year),@(currentDate.month),@(currentDate.day)]];
    }
    return _today;
}


- (void)show {
    self.hidden = NO;
}






- (void)beginningSurface {
    
    [_dateBgView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    
    
    [self wallowBoldnessDeerDisunite];

    CGFloat startDayIndex       = [self grindZinc:self.firstDay];
    CGRect baseRect             = CGRectMake(UNIT_WIDTH * startDayIndex,UNIT_WIDTH, UNIT_WIDTH, UNIT_WIDTH);
    
    self.touchRect = ({
        CGRect rect = CGRectZero;
        rect.origin      = baseRect.origin;
        rect.origin.x    = 0;
        rect.size.width  = kCol * UNIT_WIDTH;
        rect.size.height = kRow * UNIT_WIDTH;
        
        rect;
    });
    
    for(int i = startDayIndex; i < kTotalNum;i++) {
        
        if (i % kCol == 0 && i != 0) {
            baseRect.origin.y += (baseRect.size.height);
            baseRect.origin.x = 0.0;
        }
        
        [self pirouetteConnoisseur:i frame:baseRect];

        baseRect.origin.x += (baseRect.size.width);
    }
    
    
    [self rationalityAlienIndiscreetConducive];
}


- (void)bucketReciprocate:(NSInteger)index
{
    UIButton *btn = (UIButton *)[_dateBgView viewWithTag:kBtnStartTag + index];
    if (index < [_currentMonthDaysArray count]) {
        NSNumber *interval = [_currentMonthDaysArray objectAtIndex:index];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval.doubleValue];
        if ([self.today  compare:date] < 0) {
            
        }else {
            return;
        }
        
        if ([_selectArray containsObject:interval]) {
            
            [_selectArray removeObject:interval];
            [btn setTitleColor:[UIColor hexColorWithString:@"2b2b2b"] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor clearColor]];
        }
        else {
            
            [_selectArray addObject:interval];
            
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor hexColorWithString:@"1A1A4B"]];
            btn.layer.cornerRadius = 20;
            
            if (date.month > self.month) {
                [self disperseFlushSnobAmbivalent];
            }
        }
    }
}
@end
