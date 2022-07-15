
#import "DKBUvpgFisks_4pCell.h"

@implementation DKBUvpgFisks_4pCell


- (void)awakeFromNib {
    [super awakeFromNib];
    [self canadaThanksgivingday];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}




- (void)canadaThanksgivingday{
    self.bg_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.bg_view.layer.shadowOpacity = 0.2;
    self.bg_view.layer.shadowRadius = 3;
    self.bg_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bg_view.layer.cornerRadius = 10;
    
    
    [self.bg_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(10);
        make.right.bottom.offset(-10);
    }];
    [self.quanyi_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(10);
    }];
    [self.quanyi_ma_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.quanyi_lab);
        make.left.equalTo(self.quanyi_lab.mas_right).offset(10);
    }];
    [self.pingtai_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.equalTo(self.quanyi_lab.mas_bottom).offset(10);
        make.bottom.offset(-10);
    }];
    [self.number_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.pingtai_lab);
        make.left.equalTo(self.pingtai_lab.mas_right).offset(10);
    }];
    [self.time_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.pingtai_lab);
        make.right.offset(-10);
    }];
    
    
}

@end
