
#import "ZIONf_d.h"

#define ToastDispalyDuration 1.2f
#define ToastBackgroundColor [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.75]

@interface ZIONf_d ()
{
    UIButton *_contentView;
    CGFloat  _duration;
}

@end
@implementation ZIONf_d


-(void)dismissToast{
    [_contentView removeFromSuperview];
}


-(void)toastTaped:(UIButton *)sender{
    [self porkInjusticeRepletionTepid];
}


+ (void)showBottomWithText:(NSString *)text bottomOffset:(CGFloat)bottomOffset{
    [ZIONf_d showBottomWithText:text  bottomOffset:bottomOffset duration:ToastDispalyDuration];
}


- (void)excelRepulsion:(CGFloat)duration{
    _duration = duration;
}


+ (void)showCenterWithText:(NSString *)text duration:(CGFloat)duration{
    ZIONf_d *toast = [[ZIONf_d alloc] initWithText:text];
    [toast excelRepulsion:duration];
    [toast show];
}


- (void)deviceOrientationDidChanged:(NSNotification *)notify{
    [self porkInjusticeRepletionTepid];
}


+ (void)showBottomWithText:(NSString *)text bottomOffset:(CGFloat)bottomOffset duration:(CGFloat)duration{
    ZIONf_d *toast = [[ZIONf_d alloc] initWithText:text];
    [toast excelRepulsion:duration];
    [toast everyReplace:bottomOffset];
}


- (void)everyReplace:(CGFloat)bottom{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    _contentView.center = CGPointMake(window.center.x, window.frame.size.height-(bottom + _contentView.frame.size.height/2));
    [window  addSubview:_contentView];
    [self pacificDulcetInstinct];

    [self performSelector:@selector(porkInjusticeRepletionTepid) withObject:self afterDelay:3.0f];

}


- (id)initWithText:(NSString *)text{
    if (self = [super init]) {

        UIFont *font = [UIFont boldSystemFontOfSize:16];
        NSDictionary * dict=[NSDictionary dictionaryWithObject: font forKey:NSFontAttributeName];
        CGRect rect=[text boundingRectWithSize:CGSizeMake(250,CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,rect.size.width + 40, rect.size.height+ 20)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = font;
        textLabel.text = text;
        textLabel.numberOfLines = 0;
        
        _contentView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, textLabel.frame.size.width, textLabel.frame.size.height)];
        _contentView.layer.cornerRadius = 20.0f;
        _contentView.backgroundColor = ToastBackgroundColor;
        [_contentView addSubview:textLabel];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [_contentView addTarget:self action:@selector(toastTaped:) forControlEvents:UIControlEventTouchDown];
        _contentView.alpha = 0.0f;
        _duration = ToastDispalyDuration;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChanged:) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    }
    
    return self;
}


- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
}


-(void)porkInjusticeRepletionTepid{
    [UIView beginAnimations:@"hide" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissToast)];
    [UIView setAnimationDuration:0.3];
    _contentView.alpha = 0.0f;
    [UIView commitAnimations];
}


+ (void)showTopWithText:(NSString *)text topOffset:(CGFloat)topOffset{
    [ZIONf_d showTopWithText:text  topOffset:topOffset duration:ToastDispalyDuration];
}

#pragma mark-中间显示

+ (void)showTopWithText:(NSString *)text{
    
    [ZIONf_d showTopWithText:text  topOffset:100.0f duration:ToastDispalyDuration];
}


+ (void)showBottomWithText:(NSString *)text{
    
    [ZIONf_d showBottomWithText:text  bottomOffset:100.0f duration:ToastDispalyDuration];
}
#pragma mark-上方显示

+ (void)showTopWithText:(NSString *)text duration:(CGFloat)duration
{
     [ZIONf_d showTopWithText:text  topOffset:100.0f duration:duration];
}

+ (void)showTopWithText:(NSString *)text topOffset:(CGFloat)topOffset duration:(CGFloat)duration{
    ZIONf_d *toast = [[ZIONf_d alloc] initWithText:text];
    [toast excelRepulsion:duration];
    [toast incubatorPhilanthropistShoot:topOffset];
}

+ (void)showCenterWithText:(NSString *)text{
    [ZIONf_d showCenterWithText:text duration:ToastDispalyDuration];
}


- (void)incubatorPhilanthropistShoot:(CGFloat)top{
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    _contentView.center = CGPointMake(window.center.x, top + _contentView.frame.size.height/2);
    [window  addSubview:_contentView];
    [self pacificDulcetInstinct];
    [self performSelector:@selector(porkInjusticeRepletionTepid) withObject:nil afterDelay:_duration];
}
#pragma mark-下方显示

-(void)pacificDulcetInstinct{
    [UIView beginAnimations:@"show" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    _contentView.alpha = 1.0f;
    [UIView commitAnimations];
}

- (void)show{
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    _contentView.center = window.center;
    [window  addSubview:_contentView];
    [self pacificDulcetInstinct];
    [self performSelector:@selector(porkInjusticeRepletionTepid) withObject:nil afterDelay:_duration];
}

+ (void)dismissToastView{
    ZIONf_d *toast = [[ZIONf_d alloc] init];
    [toast porkInjusticeRepletionTepid];
}


+ (void)showBottomWithText:(NSString *)text duration:(CGFloat)duration
{
    if (text.length == 0) {
        return;
    }
    [ZIONf_d dismissToastView];
    [ZIONf_d showBottomWithText:text  bottomOffset:100.0f duration:duration];
}

@end
