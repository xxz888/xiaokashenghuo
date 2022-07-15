
#import "OUPo_vvView.h"
#import "USvtNu_iController.h"
#import "TMWolf_RX.h"
#import "ONalsGl_6GpController.h"
#import "DWPJrtbd_SController.h"
@implementation OUPo_vvView



- (IBAction)moreAction:(id)sender {
    USvtNu_iController * VC = [USvtNu_iController new];
    [self.viewController.xp_rootNavigationController pushViewController:VC animated:YES];
}



- (void)drawRect:(CGRect)rect {
    self.stateTop.constant = kStatusBarHeight+10;
    
    
    


    
    
    [self.view1 rf_addTapActionWithBlock:^(UITapGestureRecognizer *gestureRecoginzer) {
        ONalsGl_6GpController * VC = [ONalsGl_6GpController new];
        VC.title = @"居家日用";
        VC.cid = 4;
        [self.viewController.xp_rootNavigationController pushViewController:VC animated:YES];

    }];
    [self.view2 rf_addTapActionWithBlock:^(UITapGestureRecognizer *gestureRecoginzer) {
        ONalsGl_6GpController * VC = [ONalsGl_6GpController new];
        VC.title = @"数码产品";
        VC.cid = 8;
        [self.viewController.xp_rootNavigationController pushViewController:VC animated:YES];
    }];
    [self.view3 rf_addTapActionWithBlock:^(UITapGestureRecognizer *gestureRecoginzer) {
        ONalsGl_6GpController * VC = [ONalsGl_6GpController new];

        VC.title = @"服饰";
        VC.cid = 1;
        [self.viewController.xp_rootNavigationController pushViewController:VC animated:YES];
    }];
    [self.view4 rf_addTapActionWithBlock:^(UITapGestureRecognizer *gestureRecoginzer) {
        ONalsGl_6GpController * VC = [ONalsGl_6GpController new];

        VC.title = @"配饰";
        VC.cid = 12;

        [self.viewController.xp_rootNavigationController pushViewController:VC animated:YES];
    }];
    
    [self.searchView rf_addTapActionWithBlock:^(UITapGestureRecognizer *gestureRecoginzer) {

    }];
}


- (IBAction)searchAction:(id)sender {
    [self.viewController.xp_rootNavigationController pushViewController:[DWPJrtbd_SController new] animated:YES];

}
@end
