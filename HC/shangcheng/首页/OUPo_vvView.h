
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OUPo_vvView : UIView<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stateTop;
- (IBAction)moreAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *searchView;

@end

NS_ASSUME_NONNULL_END
