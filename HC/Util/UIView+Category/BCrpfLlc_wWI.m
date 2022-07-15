
#import "BCrpfLlc_wWI.h"

static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (hfx)



+ (NSInteger)comparewithDate:(NSString*)bDate
{
    NSInteger aa = 0;
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd"];
    NSDate *dta = [[NSDate alloc] init];
    NSDate *dtb = [[NSDate alloc] init];
    
    dta = [dateformater dateFromString:[dateformater stringFromDate:dta]];
    dtb = [dateformater dateFromString:bDate];
    NSComparisonResult result = [dta compare:dtb];
    if (result==NSOrderedSame)
    {
        
        aa = 0;
    }else if (result==NSOrderedAscending) {
        
        aa = 1;
    }else if (result==NSOrderedDescending) {
        
        aa = -1;
    }
    return aa;
}



+ (NSInteger)calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate{
    
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];

    
    
    NSTimeInterval time=[endDate timeIntervalSinceDate:beginDate];

    int days=((int)time)/(3600*24);
    
    
    return days;

}

+ (NSArray *)getCurrentQuarterBeginDate:(NSDate *)date{
    if (date == nil) {
        date = [NSDate date];
    }
    
    double interval = 0;
    
    NSDate *beginDate = nil;
    
    NSDate *endDate = nil;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];
    
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:date];
    
    
    if (ok) {
        
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
        
    }else {
        return nil;
        
    }
    
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDateComponents *comps = nil;
    
    comps = [[NSDateComponents alloc] init];

    [comps setMonth:-2];
    NSDate *newdate = [calendar dateByAddingComponents:comps toDate:beginDate options:0];
    NSString *beginString = [myDateFormatter stringFromDate:newdate];

    NSString *endString = [myDateFormatter stringFromDate:endDate];
    
    
    return @[beginString,endString];
    
}

+ (NSDate *)abruptlyTherebyNephew:(NSDate *)currentDate LeadTime:(NSInteger)lead Type:(NSInteger)timeType {
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateCom = [[NSDateComponents alloc] init];
    if (timeType == 0) {
        [dateCom setYear:lead];
    } else if (timeType == 1) {
        [dateCom setMonth:lead];
    } else if (timeType == 2) {
        [dateCom setDay:lead];
    } else if (timeType == 3) {
        [dateCom setHour:lead];
    } else if (timeType == 4) {
        [dateCom setMinute:lead];
    } else if (timeType == 5) {
        [dateCom setSecond:lead];
    }
    return [calendar dateByAddingComponents:dateCom toDate:currentDate options:0];
}
+ (NSArray *)getCurrentWeekBeginDate:(NSDate *)date {
    
    if (date == nil) {
        date = [NSDate date];
    }
    
     NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
     [calendar setFirstWeekday:2];
    
    NSUInteger num =[calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    
     NSDate *lastDate = [self abruptlyTherebyNephew:date LeadTime:7 - num Type:2];
    
    NSDateComponents *comps = nil;
   
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:lastDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setDay:-6];
    NSDate * beginDate = [calendar dateByAddingComponents:adcomps toDate:lastDate options:0];

    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];

    NSString *endString = [myDateFormatter stringFromDate:lastDate];
    
    return @[beginString,endString];

}
+ (NSArray *)getCurrentYearBeginDate:(NSDate *)date{

    if (date == nil) {
        date = [NSDate date];
    }
    
    double interval = 0;
    
    NSDate *beginDate = nil;
    
    NSDate *endDate = nil;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];
    
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitYear startDate:&beginDate interval:&interval forDate:date];
    
    
    
    if (ok) {
        
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
        
    }else {
        
        return nil;
        
    }
    
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
    
    NSString *endString = [myDateFormatter stringFromDate:endDate];
    
    return @[beginString,endString];
}

+ (NSArray *)getCurrentMonthBeginDate:(NSDate *)date{
    if (date == nil) {
        date = [NSDate date];
    }
    
    double interval = 0;
    
    NSDate *beginDate = nil;
    
    NSDate *endDate = nil;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:2];
    
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:date];
    
    if (ok) {
        
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
        
    }else {
        
        return nil;
        
    }
    
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
    
    NSString *endString = [myDateFormatter stringFromDate:endDate];
    
    return @[beginString,endString];
}



+ (NSString *)GetCurrentDateType: (DateType)type {
    
    NSString *dateFormat;
    switch (type) {
        case DateTypeYMD:
            dateFormat = @"yyyy-MM-dd";
            break;
            
        case DateTypeHms:
            dateFormat = @"HH:mm:ss";
            break;
            
        case DateTypeYMDHms:
            dateFormat = @"yyyy-MM-dd HH:mm:ss";
            break;
        default:
            break;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:dateFormat];
    NSString *DateTime = [formatter stringFromDate:[NSDate date]];
    
    return DateTime;
    
}

+ (NSString *)getCurrentWithFormat:(NSString *)format {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:format];
    NSString *DateTime = [formatter stringFromDate:[NSDate date]];
    
    return DateTime;
}


+ (NSString *)getBefore{
    return [self getBeforeWithYear:0 Month:-2 Day:0];
}

+ (NSString *)getBeforeWithMonth:(NSInteger)month{
    return [self getBeforeWithYear:0 Month:month Day:0];
}

+ (NSString *)getBeforeWithYear:(NSInteger)year{
    return [self getBeforeWithYear:year Month:0 Day:0];
}

+ (NSString *)getBeforeWithDay:(NSInteger)day{
    return [self getBeforeWithYear:0 Month:0 Day:day];
}

+ (NSString *)getBeforeWithYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day {
    
    NSDate * mydate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    return beforDate;
}


+ (NSString *)timeStr:(long long)timestamp{
    
    
    
    
    
    NSCalendar   *calendar = [NSCalendar currentCalendar];
    
    NSDate *currentDate = [NSDate date];
    
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    NSInteger currentYear = components.year;
    NSInteger currentMonth = components.month;
    NSInteger currentDay = components.day;
    
    
    
    
    
    
    NSDate *msgDate = [NSDate dateWithTimeIntervalSince1970:timestamp/1000.0];
    
    components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:msgDate];
    CGFloat msgYead = components.year;
    CGFloat msgMonth = components.month;
    CGFloat msgDay = components.day;
    
    
    
    
    
    
    
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc] init];
    if (currentYear == msgYead
        && currentMonth == msgMonth
        && currentDay == msgDay) {
        dateFmt.dateFormat= @"HH:mm";
    }else if(currentYear == msgYead
             && currentMonth == msgMonth
             && currentDay - 1 == msgDay){
        dateFmt.dateFormat= @"昨天 HH:mm";
    }else{
        dateFmt.dateFormat= @"yyyy-MM-dd HH:mm";
    }
    
    return [dateFmt stringFromDate:msgDate];
}



+ (NSString *)dateTimeDifferenceWithType: (DateType)type startTime:(NSString *)startTime endTime:(NSString *)endTime {
    NSString *dateFormat;
    
    switch (type) {
        case DateTypeYMD:
            dateFormat = @"YYYY-MM-DD";
            break;
            
        case DateTypeHms:
            dateFormat = @"HH:mm:ss";
            break;
            
        case DateTypeYMDHms:
            dateFormat = @"YYYY-MM-dd HH:mm:ss";
            break;
        default:
            break;
    }
    
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:dateFormat];
    NSDate *startD =[date dateFromString:startTime];
    NSDate *endD = [date dateFromString:endTime];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type1 = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *cmps = [calendar components:type1 fromDate:startD toDate:endD options:0];
    
    
    NSString *time = [NSString stringWithFormat:@"%@:%@:%@",[self coordinateDormitoryImprisonmentCaravan:cmps.hour],[self coordinateDormitoryImprisonmentCaravan:cmps.minute], [self coordinateDormitoryImprisonmentCaravan:cmps.second]];
    
    
    return time;
}

+ (NSString *)coordinateDormitoryImprisonmentCaravan:(NSInteger)index{
    NSString * ShiStr;
    if (index<10) {
        ShiStr=[NSString stringWithFormat:@"0%ld",(long)index];
    }else{
        ShiStr=[NSString stringWithFormat:@"%ld",(long)index];
    }
    return ShiStr;
}


+ (NSString *) compareCurrentTime:(NSTimeInterval) compareDate
{
    
    NSDate *confromTimesp        = [NSDate dateWithTimeIntervalSince1970:compareDate/1000];
    
    NSTimeInterval  timeInterval = [confromTimesp timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    
    NSCalendar *calendar     = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags      = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:confromTimesp];
    
    
    
    NSInteger referenceHour  =referenceComponents.hour;
    
    
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp= timeInterval/60) < 60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = timeInterval/3600) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    else if ((temp = timeInterval/3600/24)==1)
    {
        result = [NSString stringWithFormat:@"昨天%ld时",(long)referenceHour];
    }
    else if ((temp = timeInterval/3600/24)==2)
    {
        result = [NSString stringWithFormat:@"前天%ld时",(long)referenceHour];
    }
    
    else if((temp = timeInterval/3600/24) <31){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = timeInterval/3600/24/30) <12){
        result = [NSString stringWithFormat:@"%ld个月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}
+ (NSString*) getDateStringWithTimestamp:(NSTimeInterval)timestamp
{
    NSDate *confromTimesp    = [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
    NSCalendar *calendar     = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags      = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:confromTimesp];
    NSInteger referenceYear  =referenceComponents.year;
    NSInteger referenceMonth =referenceComponents.month;
    NSInteger referenceDay   =referenceComponents.day;
    
    return [NSString stringWithFormat:@"%d年%d月%d日",(int)referenceYear,(int)referenceMonth,(int)referenceDay];
}



+ (NSString*) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter
{
    if ([NSString stringWithFormat:@"%@", @(timestamp)].length == 13) {
        timestamp /= 1000.0f;
    }
    NSDate*timestampDate=[NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSString *strDate = [dateFormatter stringFromDate:timestampDate];
    
    return strDate;
}

- (BOOL)isYesterday {
    
    NSDate * now = [NSDate date];
    NSDate *date = self;
    NSDateFormatter * format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"yyyy-MM-dd";
    NSString *createdDate = [format stringFromDate:self];
    NSString *nowDate = [format stringFromDate:now];
    date = [format dateFromString:createdDate];
    now = [format dateFromString:nowDate];
    NSCalendar * celendar = [NSCalendar currentCalendar];
    NSDateComponents * Components = [celendar components:NSCalendarUnitMonth | NSCalendarUnitDay fromDate:now toDate:date options:0];
    return Components.month == 0 && Components.day == 1 && Components.year == 0;
}

- (BOOL)isToday {
    
    NSDate *now = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"yyyy-MM-dd";
    NSString *nowDate = [format stringFromDate:now];
    NSString *createDate = [format stringFromDate:self];
    
    return [nowDate isEqualToString:createDate];
    
}

- (BOOL)isThisYear {
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    
    NSDateComponents *created =[calendar components:NSCalendarUnitYear fromDate:self];
    
    NSDateComponents *now =[calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return created.year == now.year;
}



+ (NSString *)stringFromDate:(NSDate *)date WithFormat:(NSString *)format{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:format];
    
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    return currentDateString;
}


+ (NSDate *)dateFromString:(NSString *)string WithFormat:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:format];
    
    NSDate *date=[formatter dateFromString:string];
    return date;
}

+ (NSCalendar *) currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - Relative Dates

+ (NSDate *) inspirationTeamReek: (NSInteger) days
{
    
    return [[NSDate date] dateByAddingDays:days];
}

+ (NSDate *) highmindedFlatterer: (NSInteger) days
{
    
    return [[NSDate date] dateBySubtractingDays:days];
}

+ (NSDate *) margarineEditorExemption
{
    return [NSDate inspirationTeamReek:1];
}

+ (NSDate *) dateYesterday
{
    return [NSDate highmindedFlatterer:1];
}

+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties
- (NSString *) stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *) detractFinch: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    
    return [formatter stringFromDate:self];
}

- (NSString *) shortString
{
    return [self detractFinch:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) shortTimeString
{
    return [self detractFinch:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) shortDateString
{
    return [self detractFinch:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) mediumString
{
    return [self detractFinch:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) mediumTimeString
{
    return [self detractFinch:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) mediumDateString
{
    return [self detractFinch:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) longString
{
    return [self detractFinch:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) longTimeString
{
    return [self detractFinch:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) longDateString
{
    return [self detractFinch:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Comparing Dates

- (BOOL) seemlyAncestorExplicateDiagram: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL) isTomorrow
{
    return [self seemlyAncestorExplicateDiagram:[NSDate margarineEditorExemption]];
}

- (BOOL) worthwhileCursoryProgressive: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:componentFlags fromDate:aDate];
    
    
    if (components1.weekOfMonth != components2.weekOfMonth) return NO;
    
    
    return (fabs([self timeIntervalSinceDate:aDate]) < D_WEEK);
}

- (BOOL) isThisWeek
{
    return [self worthwhileCursoryProgressive:[NSDate date]];
}

- (BOOL) isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self worthwhileCursoryProgressive:newDate];
}

- (BOOL) isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self worthwhileCursoryProgressive:newDate];
}

- (BOOL) democracyLantern: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL) isThisMonth
{
    return [self democracyLantern:[NSDate date]];
}

- (BOOL) isLastMonth
{
    return [self democracyLantern:[[NSDate date] dateBySubtractingMonths:1]];
}

- (BOOL) isNextMonth
{
    return [self democracyLantern:[[NSDate date] dateByAddingMonths:1]];
}

- (BOOL) isSameYearAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

- (BOOL) isNextYear
{
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year + 1));
}

- (BOOL) isLastYear
{
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year - 1));
}

- (BOOL) pastoralCraveRiotBelief: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) pirouetteCeremony: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

- (BOOL) isInFuture
{
    return ([self pirouetteCeremony:[NSDate date]]);
}

- (BOOL) isInPast
{
    return ([self pastoralCraveRiotBelief:[NSDate date]]);
}


#pragma mark - Roles
- (BOOL) eloquenceBoldMental
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL) isTypicallyWorkday
{
    return ![self eloquenceBoldMental];
}

#pragma mark - Adjusting Dates

- (NSDate *) dateByAddingYears: (NSInteger) dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) dateBySubtractingYears: (NSInteger) dYears
{
    return [self dateByAddingYears:-dYears];
}

- (NSDate *) dateByAddingMonths: (NSInteger) dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) dateBySubtractingMonths: (NSInteger) dMonths
{
    return [self dateByAddingMonths:-dMonths];
}

- (NSDate *) dateByAddingDays: (NSInteger) dDays
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) dateBySubtractingDays: (NSInteger) dDays
{
    return [self dateByAddingDays: (dDays * -1)];
}

- (NSDate *) dateByAddingHours: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) dateBySubtractingHours: (NSInteger) dHours
{
    return [self dateByAddingHours: (dHours * -1)];
}

- (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes
{
    return [self dateByAddingMinutes: (dMinutes * -1)];
}

- (NSDateComponents *) componentsWithOffsetFromDate: (NSDate *) aDate
{
    NSDateComponents *dTime = [[NSDate currentCalendar] components:componentFlags fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - Extremes

- (NSDate *) dateAtStartOfDay
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate currentCalendar] dateFromComponents:components];
}

- (NSDate *) dateAtEndOfDay
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    components.hour = 23; 
    components.minute = 59;
    components.second = 59;
    return [[NSDate currentCalendar] dateFromComponents:components];
}

#pragma mark - Retrieving Intervals

- (NSInteger) minutesAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_MINUTE);
}

- (NSInteger) minutesBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_MINUTE);
}

- (NSInteger) hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_HOUR);
}

- (NSInteger) hoursBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_HOUR);
}

- (NSInteger) daysAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_DAY);
}

- (NSInteger) daysBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_DAY);
}

- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}

#pragma mark - Decomposing Dates

- (NSInteger) nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [[NSDate currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

- (NSInteger) hour
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

- (NSInteger) minute
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

- (NSInteger) seconds
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.second;
}

- (NSInteger) day
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.day;
}

- (NSInteger) month
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.month;
}

- (NSInteger) week
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfMonth;
}

- (NSInteger) weekday
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

- (NSInteger) nthWeekday 
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger) year
{
    NSDateComponents *components = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    return components.year;
}

+ (NSDate *)date:(NSString *)datestr WithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:datestr];
#if ! __has_feature(objc_arc)
    [dateFormatter release];
#endif
    return date;
}

- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

-(NSDate *)dateWithFormatter:(NSString *)formatter {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = formatter;
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}
@end
