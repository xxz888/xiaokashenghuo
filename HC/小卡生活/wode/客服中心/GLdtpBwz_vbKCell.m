
#import "GLdtpBwz_vbKCell.h"

@implementation GLdtpBwz_vbKCell


- (void)awakeFromNib {
    [super awakeFromNib];
    [self.bg_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(5);
        make.right.bottom.offset(-5);
    }];
    
    [self.name_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bg_view);
    }];
    
    [self.top_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.centerX.equalTo(self.bg_view);
        make.bottom.equalTo(self.name_lab.mas_top).offset(-5);
    }];
    
    [self.content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(38);
        make.centerX.equalTo(self.bg_view);
        make.top.equalTo(self.name_lab.mas_bottom).offset(0);
    }];
    
    self.bg_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.bg_view.layer.shadowOffset = CGSizeMake(0, 0.1);
    self.bg_view.layer.shadowOpacity = 0.2;
    self.bg_view.layer.shadowRadius = 3;
    self.bg_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bg_view.layer.cornerRadius = 10;
    
    
    
}

@end
