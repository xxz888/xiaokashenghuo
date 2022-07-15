
#import "QVTJojBhhtn_CXCCell.h"

@implementation QVTJojBhhtn_CXCCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    double view_W = (DEVICE_WIDTH - 20 )/3;
    [self.type_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(view_W, 40));
        make.left.offset(10);
        make.centerY.equalTo(self.contentView);
    }];

    [self.yihuan_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(view_W, 20));
        make.left.equalTo(self.type_lab.mas_right);
        make.centerY.equalTo(self.contentView);
    }];
    [self.fanxian_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(view_W, 20));
        make.left.equalTo(self.yihuan_lab.mas_right);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(0.5);
        make.left.offset(10);
        make.right.offset(-10);
        make.bottom.offset(0);
    }];
}

@end
