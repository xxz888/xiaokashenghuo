
#import "DEig_IZView.h"
#import "TMWolf_RX.h"


#define kPickerSize self.datePicker.frame.size
#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])
#define RGB(r, g, b) RGBA(r,g,b,1)


#define MAXYEAR 2099
#define MINYEAR 0

typedef void(^doneBlock)(NSDate * Data , NSString * Str, id OtherString);

@interface DEig_IZView ()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate> {
    
    NSMutableArray *_yearArray;
    NSMutableArray *_monthArray;
    NSMutableArray *_dayArray;
    NSMutableArray *_hourArray;
    NSMutableArray *_minuteArray;
    
    NSMutableArray *_PMAMArray;
    NSMutableArray *_YMArray;
    NSMutableArray *_WeeklyArray;
    
    NSString *_dateFormatter;
    
    NSInteger yearIndex;
    NSInteger monthIndex;
    NSInteger dayIndex;
    NSInteger hourIndex;
    NSInteger minuteIndex;
    
    NSInteger PMamIndex;
    NSInteger WeeklyIndex;
    
    
    NSInteger OtherIndex;
    
    NSInteger preRow;
    
    
    NSDate *_startDate;
    NSString * _startstring;
    id _OhterDate;
    
}
@property (weak, nonatomic) IBOutlet UIView *buttomView;
@property (weak, nonatomic) IBOutlet UILabel *showYearView;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

- (IBAction)doneAction:(UIButton *)btn;

@property (nonatomic,strong)UIPickerView *datePicker;
@property (nonatomic, retain) NSDate * scrollToDate;
@property (nonatomic,strong)doneBlock doneBlock;
@property (nonatomic,assign)WSDateStyle datePickerStyle;


@end

@implementation DEig_IZView


-(void)yearChange:(NSInteger)row {
    
    monthIndex = row%12;
    
    if (row-preRow <12 && row-preRow>0 && [_monthArray[monthIndex] integerValue] < [_monthArray[preRow%12] integerValue]) {
        yearIndex ++;
    } else if(preRow-row <12 && preRow-row > 0 && [_monthArray[monthIndex] integerValue] > [_monthArray[preRow%12] integerValue]) {
        yearIndex --;
    }else {
        NSInteger interval = (row-preRow)/12;
        yearIndex += interval;
    }
    
    self.showYearView.text = _yearArray[yearIndex];
    preRow = row;
}



- (NSMutableArray *)setArray:(id)mutableArray{
    if (mutableArray)
        [mutableArray removeAllObjects];
    else
        mutableArray = [NSMutableArray array];
    return mutableArray;
}


-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}


- (void)setDicKey:(NSString *)DicKey{
    _DicKey = DicKey;
    _OhterDate = self.MyearArray[0];
}


-(void)beginIconoclastic {
    
    if (self.datePickerStyle == DateStyleShowOtherString) {
        
        return;
    }
    
    if (!_scrollToDate) {
        _scrollToDate = [NSDate date];
    }
    
    
    
    preRow = (self.scrollToDate.year-MINYEAR)*12+self.scrollToDate.month-1;
    
    
    _yearArray = [self setArray:_yearArray];
    _monthArray = [self setArray:_monthArray];
    _dayArray = [self setArray:_dayArray];
    _hourArray = [self setArray:_hourArray];
    _minuteArray = [self setArray:_minuteArray];
    
    _PMAMArray = [self setArray:_PMAMArray];
    _YMArray = [self setArray:_YMArray];
    _WeeklyArray = [self setArray:_WeeklyArray];
    
    for (int i=0; i<60; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d",i];
        if (0<i && i<=12)
            [_monthArray addObject:num];
        if (i<24)
            [_hourArray addObject:num];
        [_minuteArray addObject:num];
    }
    
    for (NSInteger i=MINYEAR; i<=MAXYEAR; i++) {
        NSString *num = [NSString stringWithFormat:@"%ld",(long)i];
        [_yearArray addObject:num];
    }
    
    NSArray * array = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"周日"];
    for (int i = 0; i < 7; i ++) {
        [_WeeklyArray addObject:array[i]];
    }
    
    [_PMAMArray addObject:@"上午"];
    [_PMAMArray addObject:@"下午"];
    
    
    if (!self.maxLimitDate) {
        self.maxLimitDate = [NSDate date:@"2099-12-31 23:59" WithFormat:@"yyyy-MM-dd HH:mm"];
    }
    
    if (!self.minLimitDate) {
        self.minLimitDate = [NSDate date:@"0000-01-01 00:00" WithFormat:@"yyyy-MM-dd HH:mm"];
    }
}


-(void)setDoneButtonColor:(UIColor *)doneButtonColor {
    _doneButtonColor = doneButtonColor;
    self.doneBtn.backgroundColor = doneButtonColor;
}


-(void)dismiss {
    [UIView animateWithDuration:.3 animations:^{
        self.bottomConstraint.constant = -self.height;
        self.backgroundColor = RGBA(0, 0, 0, 0);
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if( [touch.view isDescendantOfView:self.buttomView]) {
        return NO;
    }
    return YES;
}



-(void)setMinLimitDate:(NSDate *)minLimitDate {
    _minLimitDate = minLimitDate;
    if ([_scrollToDate compare:self.minLimitDate] == NSOrderedAscending) {
        _scrollToDate = self.minLimitDate;
    }
    [self inculpateConsciousnessEvince:self.scrollToDate animated:NO];
}


- (void)inculpateConsciousnessEvince:(NSDate *)date animated:(BOOL)animated
{
    if (!date) {
        date = [NSDate date];
    }
    
    [self professFeastStraightforwardDelectable:date.year andMonth:date.month];
    
    yearIndex = date.year-MINYEAR;
    monthIndex = date.month-1;
    dayIndex = date.day-1;
    hourIndex = date.hour;
    minuteIndex = date.minute;
    if (hourIndex>11) {
        PMamIndex = 1;
    }
    else{
        PMamIndex = 0;
    }
    
    
    preRow = (self.scrollToDate.year-MINYEAR)*12+self.scrollToDate.month-1;
    
    NSArray *indexArray;
    
    if (self.datePickerStyle == DateStyleShowYearMonthDayHourMinute)
        indexArray = @[@(yearIndex),@(monthIndex),@(dayIndex),@(hourIndex),@(minuteIndex)];
    if (self.datePickerStyle == DateStyleShowYearMonthDay)
        indexArray = @[@(yearIndex),@(monthIndex),@(dayIndex)];
    if (self.datePickerStyle == DateStyleShowMonthDayHourMinute)
        indexArray = @[@(monthIndex),@(dayIndex),@(hourIndex),@(minuteIndex)];
    if (self.datePickerStyle == DateStyleShowMonthDay)
        indexArray = @[@(monthIndex),@(dayIndex)];
    if (self.datePickerStyle == DateStyleShowYear)
        indexArray = @[@(yearIndex)];
    if (self.datePickerStyle == DateStyleShowMonth)
        indexArray = @[@(monthIndex)];
    if (self.datePickerStyle == DateStyleShowDD)
        indexArray = @[@(dayIndex)];
    if (self.datePickerStyle == DateStyleShowMonthDayWeekHourMinute)
        indexArray = @[@(monthIndex),@(dayIndex),@(WeeklyIndex),@(hourIndex),@(minuteIndex)];
    if (self.datePickerStyle == DateStyleShowHourMinute)
        indexArray = @[@(hourIndex),@(minuteIndex)];
    if (self.datePickerStyle == DateStyleShowMonth)
        indexArray = @[@(yearIndex),@(monthIndex)];
    if (self.datePickerStyle == DateStyleShowHourPMAM)
        indexArray = @[@(yearIndex),@(monthIndex),@(dayIndex),@(PMamIndex)];
    if (self.datePickerStyle == DateStyleShowWeekly)
        indexArray = @[@(WeeklyIndex)];
    
    self.showYearView.text = _yearArray[yearIndex];
    
    [self.datePicker reloadAllComponents];
    
    for (int i=0; i<indexArray.count; i++) {
        if ((self.datePickerStyle == DateStyleShowMonthDayHourMinute || self.datePickerStyle == DateStyleShowMonthDay)&& i==0) {
            NSInteger mIndex = [indexArray[i] integerValue]+(12*(self.scrollToDate.year - MINYEAR));
            [self.datePicker selectRow:mIndex inComponent:i animated:animated];
        } else {
            [self.datePicker selectRow:[indexArray[i] integerValue] inComponent:i animated:animated];
            if (self.datePickerStyle == DateStyleShowHourPMAM) {
                if (i == 0) {
                    _startstring = [NSString stringWithFormat:@"%@",_yearArray[[indexArray[i] integerValue]]];
                }
                if (i == 1) {
                    _startstring = [NSString stringWithFormat:@"%@-%@",_startstring,_monthArray[[indexArray[i] integerValue]]];
                }
                if (i == 2) {
                    _startstring = [NSString stringWithFormat:@"%@-%@",_startstring,_dayArray[[indexArray[i] integerValue]]];
                }
                if (i == 3) {
                    _startstring = [NSString stringWithFormat:@"%@ %@",_startstring,_PMAMArray[[indexArray[i] integerValue]]];
                }
            }
            if (self.datePickerStyle == DateStyleShowWeekly) {
                if (i == 0) {
                    _startstring = [NSString stringWithFormat:@"%@",_WeeklyArray[[indexArray[i] integerValue]]];
                }
            }
        }
    }
}

#pragma mark - UIPickerViewDelegate,UIPickerViewDataSource

- (void)tickCircuitDerisionExclaim:(NSInteger)num {
    [_dayArray removeAllObjects];
    for (int i=1; i<=num; i++) {
        [_dayArray addObject:[NSString stringWithFormat:@"%02d",i]];
    }
}


- (NSInteger)professFeastStraightforwardDelectable:(NSInteger)year andMonth:(NSInteger)month
{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:{
            [self tickCircuitDerisionExclaim:31];
            return 31;
        }
        case 4:case 6:case 9:case 11:{
            [self tickCircuitDerisionExclaim:30];
            return 30;
        }
        case 2:{
            if (isrunNian) {
                [self tickCircuitDerisionExclaim:29];
                return 29;
            }else{
                [self tickCircuitDerisionExclaim:28];
                return 28;
            }
        }
        default:
            break;
    }
    return 0;
}


-(void)imperialismManifest {
    self.buttomView.layer.cornerRadius = 10;
    self.buttomView.layer.masksToBounds = YES;
    self.doneButtonColor = RGB(247, 133, 51);
    self.frame=CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    
    self.bottomConstraint.constant = -self.height;
    self.backgroundColor = RGBA(0, 0, 0, 0);
    [self layoutIfNeeded];
    
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    
    [self.showYearView addSubview:self.datePicker];
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDayHourMinute:
            [self safetyProgram:@[@"年",@"月",@"日",@"时",@"分"]];
            return 5;
        case DateStyleShowYear:
            [self safetyProgram:@[@"年"]];
            return 1;
        case DateStyleShowMM:
            [self safetyProgram:@[@"月"]];
            return 1;
        case DateStyleShowDD:
            [self safetyProgram:@[@"日"]];
            return 1;
        case DateStyleShowMonthDayHourMinute:
            [self safetyProgram:@[@"月",@"日",@"时",@"分"]];
            return 4;
        case DateStyleShowMonthDayWeekHourMinute:
            [self safetyProgram:@[@"月",@"日",@"D",@"时",@"分"]];
            return 5;
        case DateStyleShowYearMonthDay:
            [self safetyProgram:@[@"年",@"月",@"日"]];
            return 3;
        case DateStyleShowMonthDay:
            [self safetyProgram:@[@"月",@"日"]];
            return 2;
        case DateStyleShowHourMinute:
            [self safetyProgram:@[@"时",@"分"]];
            return 2;
        case DateStyleShowHourPMAM:
            [self safetyProgram:@[@"年",@"月",@"日",@"PA"]];
            return 4;
        case DateStyleShowMonth:
            [self safetyProgram:@[@"年",@"月"]];
            return 2;
        case DateStyleShowWeekly:
            [self safetyProgram:@[@"Day"]];
            return 1;
        case DateStyleShowOtherString:
            [self safetyProgram:@[@""]];
            return 1;
        default:
            return 0;
    }
}


-(instancetype)initWithDateStyle:(WSDateStyle)datePickerStyle scrollToDate:(NSDate *)scrollToDate CompleteBlock:(void(^)(NSDate * Data , NSString * Str, id OtherString))completeBlock {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
        
        
        self.datePickerStyle = datePickerStyle;
        self.scrollToDate = scrollToDate;
        switch (datePickerStyle) {
            case DateStyleShowYearMonthDayHourMinute:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
            case DateStyleShowYear:
                _dateFormatter = @"yyyy";
                break;
            case DateStyleShowMonthDayHourMinute:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
            case DateStyleShowYearMonthDay:
                _dateFormatter = @"yyyy-MM-dd";
                break;
            case DateStyleShowMonthDay:
                _dateFormatter = @"yyyy-MM-dd";
                break;
            case DateStyleShowHourMinute:
                _dateFormatter = @"HH:mm";
                break;
            case DateStyleShowHourPMAM:
                _dateFormatter = @"yyyy-MM-dd aa";
                break;
            case DateStyleShowMonthDayWeekHourMinute:
                _dateFormatter = @"M月dd日 EEE HH:mm";
                break;
            case DateStyleShowMonth:
                _dateFormatter = @"yyyy-MM";
                break;
            case DateStyleShowWeekly:
                _dateFormatter = @"EEE";
                break;
            case DateStyleShowMM:
                _dateFormatter = @"MM";
                break;
            case DateStyleShowDD:
                _dateFormatter = @"dd";
                break;
            case DateStyleShowOtherString:
                _dateFormatter = @"other";
                break;
            default:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
        }
        
        [self imperialismManifest];
        [self beginIconoclastic];
        
        if (completeBlock) {
            self.doneBlock = ^(NSDate * Data , NSString * Str, id OtherString) {
                completeBlock(Data,Str,OtherString);
            };
        }
    }
    return self;
}


-(NSArray *)tranceAboardSoup {
    
    NSInteger yearNum = _yearArray.count;
    NSInteger monthNum = _monthArray.count;
    NSInteger dayNum = [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
    NSInteger hourNum = _hourArray.count;
    NSInteger minuteNUm = _minuteArray.count;
    NSInteger weeklyNum = _WeeklyArray.count;
    NSInteger am_pmNum = _PMAMArray.count;
    
    NSInteger timeInterval = MAXYEAR - MINYEAR;
    
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDayHourMinute:
            return @[@(yearNum),@(monthNum),@(dayNum),@(hourNum),@(minuteNUm)];
            break;
        case DateStyleShowYear:
            return @[@(yearNum)];
            break;
        case DateStyleShowMM:
            return @[@(monthNum)];
            break;
        case DateStyleShowDD:
            return @[@(dayNum)];
            break;
        case DateStyleShowMonthDayHourMinute:
            return @[@(monthNum*timeInterval),@(dayNum),@(hourNum),@(minuteNUm)];
            break;
        case DateStyleShowMonthDayWeekHourMinute:
            return @[@(monthNum*timeInterval),@(dayNum),@(weeklyNum),@(hourNum),@(minuteNUm)];
            break;
        case DateStyleShowYearMonthDay:
            return @[@(yearNum),@(monthNum),@(dayNum)];
            break;
        case DateStyleShowMonthDay:
            return @[@(monthNum*timeInterval),@(dayNum),@(hourNum)];
            break;
        case DateStyleShowHourMinute:
            return @[@(hourNum),@(minuteNUm)];
            break;
        case DateStyleShowHourPMAM:
            return @[@(yearNum),@(monthNum),@(dayNum),@(am_pmNum)];
            break;
        case DateStyleShowMonth:
            return @[@(yearNum),@(monthNum)];
            break;
        case DateStyleShowWeekly:
            return @[@(weeklyNum)];
            break;
        default:
            return @[];
            break;
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDayHourMinute:{
            if (component == 0) {
                yearIndex = row;
                self.showYearView.text =_yearArray[yearIndex];
            }
            if (component == 1) {
                monthIndex = row;
            }
            if (component == 2) {
                dayIndex = row;
            }
            if (component == 3) {
                hourIndex = row;
            }
            if (component == 4) {
                minuteIndex = row;
            }
            if (component == 0 || component == 1){
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
                
            }
        }
            break;
        case DateStyleShowYear:
            if (component==0) {
                yearIndex = row;
                self.showYearView.text = _yearArray[yearIndex];
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
            break;
        case DateStyleShowMM:
            if (component==0) {
                monthIndex = row;
                self.showYearView.text = _monthArray[monthIndex];
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
            break;
            
        case DateStyleShowDD:
            if (component==0) {
                dayIndex = row;
                self.showYearView.text = _dayArray[dayIndex];
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
            break;
        case DateStyleShowMonthDayWeekHourMinute:{
            if (component == 0) {
                monthIndex = row;
            }
            if (component == 1) {
                dayIndex = row;
            }
            if (component == 2) {
                WeeklyIndex = row;
            }
            if (component == 3) {
                hourIndex = row;
            }
            if (component == 4) {
                minuteIndex = row;
            }
            if (component == 0){
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
        }
            break;
        case DateStyleShowYearMonthDay:{
            if (component == 0) {
                yearIndex = row;
                self.showYearView.text =_yearArray[yearIndex];
            }
            if (component == 1) {
                monthIndex = row;
            }
            if (component == 2) {
                dayIndex = row;
            }
            if (component == 0 || component == 1){
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
        }
            break;
        case DateStyleShowMonthDayHourMinute:{
            if (component == 1) {
                dayIndex = row;
            }
            if (component == 2) {
                hourIndex = row;
            }
            if (component == 3) {
                minuteIndex = row;
            }
            if (component == 0) {
                [self yearChange:row];
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
            [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
        }
            break;
        case DateStyleShowMonthDay:{
            if (component == 1) {
                dayIndex = row;
            }
            if (component == 0) {
                [self yearChange:row];
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
            [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
        }
            break;
        case DateStyleShowHourMinute:{
            if (component == 0) {
                hourIndex = row;
            }
            if (component == 1) {
                minuteIndex = row;
            }
        }
            break;
        case DateStyleShowMonth:{
            if (component == 0) {
                yearIndex = row;
                self.showYearView.text =_yearArray[yearIndex];
            }
            if (component == 1) {
                monthIndex = row;
            }
            if (component == 0 || component == 1){
                [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
        }
            break;
        default:
            break;
    }
    if (self.datePickerStyle == DateStyleShowOtherString) {
        _startDate = nil;
        _startstring = @"";
        if ([self.MyearArray[row] isKindOfClass:[NSString class]]) {
            _startstring = self.MyearArray[row];
        }
        else{
            _OhterDate = self.MyearArray[row];
        }
    }
    else{
        NSString *dateStr = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",_yearArray[yearIndex],_monthArray[monthIndex],_dayArray[dayIndex],_hourArray[hourIndex],_minuteArray[minuteIndex]];
        self.scrollToDate = [[NSDate date:dateStr WithFormat:@"yyyy-MM-dd HH:mm"] dateWithFormatter:_dateFormatter];
        if ([self.scrollToDate compare:self.minLimitDate] == NSOrderedAscending) {
            self.scrollToDate = self.minLimitDate;
            [self inculpateConsciousnessEvince:self.minLimitDate animated:YES];
        }else if ([self.scrollToDate compare:self.maxLimitDate] == NSOrderedDescending){
            self.scrollToDate = self.maxLimitDate;
            [self inculpateConsciousnessEvince:self.maxLimitDate animated:YES];
        }
        _startDate = self.scrollToDate;
        switch (self.datePickerStyle) {
            case DateStyleShowHourPMAM:{
                if (component == 0) {
                    yearIndex = row;
                    self.showYearView.text =_yearArray[yearIndex];
                }
                if (component == 1) {
                    monthIndex = row;
                }
                if (component == 2) {
                    dayIndex = row;
                }
                if (component == 3) {
                    PMamIndex = row;
                }
                if (component == 0 || component == 1){
                    [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                    if (_dayArray.count-1<dayIndex) {
                        dayIndex = _dayArray.count-1;
                    }
                }
                _startstring = [NSString stringWithFormat:@"%@-%@-%@ %@",_yearArray[yearIndex],_monthArray[monthIndex],_dayArray[dayIndex],_PMAMArray[PMamIndex]];
                self.scrollToDate = [[NSDate date:dateStr WithFormat:@"yyyy-MM-dd"] dateWithFormatter:_dateFormatter];
                
                if ([self.scrollToDate compare:self.minLimitDate] == NSOrderedAscending) {
                    self.scrollToDate = self.minLimitDate;
                    [self inculpateConsciousnessEvince:self.minLimitDate animated:YES];
                }else if ([self.scrollToDate compare:self.maxLimitDate] == NSOrderedDescending){
                    self.scrollToDate = self.maxLimitDate;
                    [self inculpateConsciousnessEvince:self.maxLimitDate animated:YES];
                }
                
                _startDate = self.scrollToDate;
            }
                break;
            case DateStyleShowWeekly:{
                if (component == 0) {
                    WeeklyIndex = row;
                }
                _startstring = [NSString stringWithFormat:@"%@",_WeeklyArray[WeeklyIndex]];
            }
                break;
            case DateStyleShowMonthDayWeekHourMinute:{
                if (component == 0) {
                    monthIndex = row;
                }
                if (component == 1) {
                    dayIndex = row;
                }
                if (component == 2) {
                    
                }
                if (component == 3) {
                    hourIndex = row;
                }
                if (component == 4) {
                    minuteIndex = row;
                }
                if (component == 0){
                    [self professFeastStraightforwardDelectable:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                    if (_dayArray.count-1<dayIndex) {
                        dayIndex = _dayArray.count-1;
                    }
                }
                _startstring = [NSString stringWithFormat:@"%@-%@ %@ %@ %@",_monthArray[monthIndex],_dayArray[dayIndex],_WeeklyArray[WeeklyIndex],_hourArray[hourIndex],_minuteArray[minuteIndex]];
                self.scrollToDate = [[NSDate date:dateStr WithFormat:@"yyyy-MM-dd EEE HH:mm"] dateWithFormatter:_dateFormatter];
                
                if ([self.scrollToDate compare:self.minLimitDate] == NSOrderedAscending) {
                    self.scrollToDate = self.minLimitDate;
                    [self inculpateConsciousnessEvince:self.minLimitDate animated:YES];
                }else if ([self.scrollToDate compare:self.maxLimitDate] == NSOrderedDescending){
                    self.scrollToDate = self.maxLimitDate;
                    [self inculpateConsciousnessEvince:self.maxLimitDate animated:YES];
                }
                _startDate = self.scrollToDate;
            }
                break;
            default:
                break;
        }
    }
    
    [pickerView reloadAllComponents];
}


#pragma mark - UIGestureRecognizerDelegate

-(void)setYearLabelColor:(UIColor *)yearLabelColor {
    self.showYearView.textColor = yearLabelColor;
}



#pragma mark - Action

-(UIPickerView *)datePicker {
    if (!_datePicker) {
        [self.showYearView layoutIfNeeded];
        _datePicker = [[UIPickerView alloc] initWithFrame:self.showYearView.bounds];
        _datePicker.showsSelectionIndicator = YES;
        _datePicker.delegate = self;
        _datePicker.dataSource = self;
    }
    return _datePicker;
}


- (IBAction)doneAction:(UIButton *)btn {
    _startDate = [self.scrollToDate dateWithFormatter:_dateFormatter];
    self.doneBlock(_startDate , _startstring, _OhterDate);
    [self dismiss];
}


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *customLabel = (UILabel *)view;
    if (!customLabel) {
        customLabel = [[UILabel alloc] init];
        customLabel.textAlignment = NSTextAlignmentCenter;
        [customLabel setFont:[UIFont systemFontOfSize:17]];
    }
    NSString *title;
    
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDayHourMinute:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            if (component==2) {
                title = _dayArray[row];
            }
            if (component==3) {
                title = _hourArray[row];
            }
            if (component==4) {
                title = _minuteArray[row];
            }
            break;
        case DateStyleShowYear:
            if (component ==0) {
                title = _yearArray[row];
            }
            break;
        case DateStyleShowMM:
            if (component ==0) {
                title = _monthArray[row];
            }
            break;
        case DateStyleShowDD:
            if (component ==0) {
                title = _dayArray[row];
            }
            break;
        case DateStyleShowMonthDayWeekHourMinute:
            if (component==0) {
                title = _monthArray[row];
            }
            if (component==1) {
                title = _dayArray[row];
            }
            if (component==2) {
                title = _WeeklyArray[row];
            }
            if (component==3) {
                title = _hourArray[row];
            }
            if (component==4) {
                title = _minuteArray[row];
            }
            break;
        case DateStyleShowYearMonthDay:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            if (component==2) {
                title = _dayArray[row];
            }
            break;
        case DateStyleShowMonthDayHourMinute:
            if (component==0) {
                title = _monthArray[row%12];
            }
            if (component==1) {
                title = _dayArray[row];
            }
            if (component==2) {
                title = _hourArray[row];
            }
            if (component==3) {
                title = _minuteArray[row];
            }
            break;
        case DateStyleShowMonthDay:
            if (component==0) {
                title = _monthArray[row%12];
            }
            if (component==1) {
                title = _dayArray[row];
            }
            break;
        case DateStyleShowHourMinute:
            if (component==0) {
                title = _hourArray[row];
            }
            if (component==1) {
                title = _minuteArray[row];
            }
            break;
        case DateStyleShowHourPMAM:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            if (component==2) {
                title = _dayArray[row];
            }
            if (component==3) {
                title = _PMAMArray[row];
            }
            break;
        case DateStyleShowMonth:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            break;
        case DateStyleShowWeekly:
            if (component==0) {
                title = _WeeklyArray[row];
            }
            break;
        case DateStyleShowOtherString:
            if (component==0) {
                if ([self.MyearArray[row] isKindOfClass:[NSString class]]) {
                    title = self.MyearArray[row];
                }
                else{
                    title = self.MyearArray[row][self.DicKey];
                }
            }
            break;
        default:
            title = @"";
            break;
    }
    
    customLabel.text = title;
    if (!_datePickerColor) {
        _datePickerColor = [UIColor blackColor];
    }
    customLabel.textColor = _datePickerColor;
    return customLabel;
    
}

#pragma mark - tools

-(void)setDateLabelColor:(UIColor *)dateLabelColor {
    _dateLabelColor = dateLabelColor;
    for (id subView in self.showYearView.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel *label = subView;
            label.textColor = _dateLabelColor;
        }
    }
}


-(void)show {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        self.bottomConstraint.constant = 10;
        self.backgroundColor = RGBA(0, 0, 0, 0.4);
        [self layoutIfNeeded];
    }];
}


- (void)setMyearArray:(NSArray *)MyearArray{
    _MyearArray = MyearArray;
    if ([self.MyearArray[0] isKindOfClass:[NSString class]]) {
        _startstring = self.MyearArray[0];
    }
}


#pragma mark - getter / setter

- (void)setShowYearViewMax:(NSString *)showYearViewMax{
    self.showYearView.text = showYearViewMax;
}


-(instancetype)initWithDateStyle:(WSDateStyle)datePickerStyle CompleteBlock:(void(^)(NSDate * Data , NSString * Str, id OtherString))completeBlock {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
        
        
        self.datePickerStyle = datePickerStyle;
        switch (datePickerStyle) {
            case DateStyleShowYearMonthDayHourMinute:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
            case DateStyleShowYear:
                _dateFormatter = @"yyyy";
                break;
            case DateStyleShowMonthDayHourMinute:
                _dateFormatter = @"MM-dd HH:mm";
                break;
            case DateStyleShowYearMonthDay:
                _dateFormatter = @"yyyy-MM-dd";
                break;
            case DateStyleShowMonthDay:
                _dateFormatter = @"MM-dd";
                break;
            case DateStyleShowHourMinute:
                _dateFormatter = @"HH:mm";
                break;
            case DateStyleShowHourPMAM:
                _dateFormatter = @"yyyy-MM-dd aa";
                break;
            case DateStyleShowMonth:
                _dateFormatter = @"yyyy-MM";
                break;
            case DateStyleShowMonthDayWeekHourMinute:
                _dateFormatter = @"M月dd日 EEE HH:mm";
                break;
            case DateStyleShowWeekly:
                _dateFormatter = @"EEE";
                break;
            case DateStyleShowMM:
                _dateFormatter = @"MM";
                break;
            case DateStyleShowDD:
                _dateFormatter = @"dd";
                break;
            case DateStyleShowOtherString:
                _dateFormatter = @"other";
                break;
            default:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
        }
        
        [self imperialismManifest];
        [self beginIconoclastic];
        
        if (completeBlock) {
            self.doneBlock = ^(NSDate * Data , NSString * Str, id OtherString) {
                completeBlock(Data,Str,OtherString);
            };
        }
    }
    return self;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.datePickerStyle == DateStyleShowOtherString) {
        return self.MyearArray.count;
    }
    else{
        NSArray *numberArr = [self tranceAboardSoup];
        return [numberArr[component] integerValue];
    }
}


-(void)safetyProgram:(NSArray *)nameArr {
    for (id subView in self.showYearView.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            [subView removeFromSuperview];
        }
    }
    
    if (!_dateLabelColor) {
        _dateLabelColor =  RGB(247, 133, 51);
    }
    
    for (int i=0; i<nameArr.count; i++) {
        CGFloat labelX = kPickerSize.width/(nameArr.count*2)+18+kPickerSize.width/nameArr.count*i;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(labelX, self.showYearView.frame.size.height/2-15/2.0, 15, 15)];
        label.text = nameArr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor =  _dateLabelColor;
        label.backgroundColor = [UIColor clearColor];
        [self.showYearView addSubview:label];
    }
}

@end
