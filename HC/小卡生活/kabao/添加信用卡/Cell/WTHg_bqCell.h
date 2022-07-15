
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTHg_bqCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UITextField *content_textfield;
@property (weak, nonatomic) IBOutlet UIView *line_view;

@property (weak, nonatomic) IBOutlet UIButton *right_btn;


@property (nonatomic , strong) NSIndexPath *index;
@property (nonatomic , strong) DHSDpnz_x3 *model;

@end

NS_ASSUME_NONNULL_END
