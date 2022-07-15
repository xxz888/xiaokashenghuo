
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^KeyboardBlock)(NSString *str);

@interface XDHEdqz_T2View : UIView

@property (weak, nonatomic) IBOutlet UIButton *keboard_1_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_2_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_3_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_4_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_5_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_6_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_7_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_8_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_9_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_0_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_d_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_sq_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_clean_btn;
@property (weak, nonatomic) IBOutlet UIButton *keboard_collection_btn;

- (void)ShowView;
- (void)disMissView;
@property (nonatomic , copy) KeyboardBlock block;

@end

NS_ASSUME_NONNULL_END
