
#import "JMLZu_efICell.h"

@implementation JMLZu_efICell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.bg_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.bg_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.bg_view.layer.shadowOpacity = 0.2;
    self.bg_view.layer.shadowRadius = 3;
    self.bg_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bg_view.layer.cornerRadius = 10;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
