
#import <UIKit/UIKit.h>

@class LPUakedZmoad_0;
@interface HMNBa_mView : UIView
@property (nonatomic,assign) CGFloat                        cornerRaius;
@property (nonatomic,strong) UIColor                       *separatorColor;
@property (nonatomic,strong) UIColor                       *menuColor;
@property (nonatomic,assign) CGFloat                        menuCellHeight;
@property (nonatomic,assign) NSInteger                      maxDisplayCount;
@property (nonatomic,assign,getter = isShadowShowing)BOOL   isShowShadow;
@property (nonatomic,assign)  BOOL                          dismissOnselected;
@property (nonatomic,assign)  BOOL                          dismissOnTouchOutside;
@property (nonatomic,assign)  UIFont                        *textFont;
@property (nonatomic,strong)  UIColor                       *textColor;
@property (nonatomic,assign)  CGFloat                       offset;

@property (nonatomic,strong) NSString                        *menuSelectCell;





+ (instancetype)menuWithActions:(NSArray<LPUakedZmoad_0 *> *)actions width:(CGFloat)width atPoint:(CGPoint)point;
+ (instancetype)menuWithActions:(NSArray<LPUakedZmoad_0 *> *)actions width:(CGFloat)width relyonView:(id)view;
- (void)show;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end

@interface LPUakedZmoad_0 : NSObject
@property (nonatomic, readonly) NSString      *title;
@property (nonatomic, readonly) UIImage       *image;
@property (nonatomic,copy, readonly) void (^handler)(LPUakedZmoad_0 *action);
+ (instancetype)actionWithTitle:(NSString *)title image:(UIImage *)image handler:(void (^)(LPUakedZmoad_0 *action))handler;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end




