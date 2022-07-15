
#import "ULTTqJuku_qCell.h"

@implementation ULTTqJuku_qCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self laboratoryHaphazardApplicable];
}


- (void)laboratoryHaphazardApplicable{
    self.bg_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.bg_view.layer.shadowOpacity = 0.2;
    self.bg_view.layer.shadowRadius = 3;
    self.bg_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bg_view.layer.cornerRadius = 10;
    
    
    [self.bg_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(10);
        make.right.bottom.offset(-10);
    }];
    
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(10);
    }];
    [self.content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title_lab.mas_bottom).offset(10);
        make.left.offset(10);
        make.right.offset(-10);
    }];
    [self.time_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.content_lab.mas_bottom).offset(10);
        make.right.offset(-10);
        make.bottom.offset(-10);
    }];
    
    
    
}

@end
