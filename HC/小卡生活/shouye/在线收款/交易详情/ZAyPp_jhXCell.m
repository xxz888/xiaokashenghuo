
#import "ZAyPp_jhXCell.h"

@implementation ZAyPp_jhXCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}





- (void)awakeFromNib {
    [super awakeFromNib];
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.offset(25);
    }];
    [self.content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.offset(-25);
    }];
    [self.icon_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(12, 12));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.content_lab.mas_left).offset(-2);
    }];
    [self.line_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-30, 0.5));
        make.center.equalTo(self.contentView);
    }];
    
    
}

@end
