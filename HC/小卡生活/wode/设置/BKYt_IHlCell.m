
#import "BKYt_IHlCell.h"

@implementation BKYt_IHlCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self.name_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.offset(20);
    }];
    
    [self.content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.offset(-20);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(DEVICE_WIDTH-20);
        make.height.offset(0.5);
        make.left.offset(10);
        make.bottom.offset(0);
    }];
    
    
    
    
}

@end
