
#import "WEMUjfk_NCell.h"

@implementation WEMUjfk_NCell


- (void)striateHindranceKingdom{
    
    self.bg_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.bg_view.layer.shadowOpacity = 0.2;
    self.bg_view.layer.shadowRadius = 3;
    self.bg_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bg_view.layer.cornerRadius = 10;
    
    
    [self.bg_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(10);
        make.right.bottom.offset(-10);
    }];
    
    [self.touxiang_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.left.offset(10);
        make.top.offset(10);
    }];
    
    [self.name_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.touxiang_image);
        make.left.equalTo(self.touxiang_image.mas_right).offset(10);
    }];
    
    [self.dengji_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.name_lab);
        make.left.equalTo(self.name_lab.mas_right).offset(5);
    }];
    
    [self.id_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name_lab.mas_bottom).offset(5);
        make.left.equalTo(self.touxiang_image.mas_right).offset(10);
    }];
    
    
    [self.phone_btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:10];
    [self.phone_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.top.equalTo(self.bg_view.mas_top).offset(10);
    }];
    
    [self.time_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.top.equalTo(self.phone_btn.mas_bottom).offset(6);
    }];
    
    
    
    self.content_view.layer.cornerRadius = 5;
    [self.content_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.equalTo(self.touxiang_image.mas_bottom).offset(10);
        make.right.bottom.offset(-10);
    }];
    
    double lab_W = (DEVICE_WIDTH - 50) / 2;
    
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.top.offset(10);
        make.left.offset(10);
    }];
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.centerY.equalTo(self.lab1);
        make.left.equalTo(self.lab1.mas_right).offset(10);
        make.right.offset(-10);
    }];
    
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.top.equalTo(self.lab1.mas_bottom).offset(10);
        make.left.offset(10);
        make.bottom.offset(-10);
    }];
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(lab_W);
        make.centerY.equalTo(self.lab3);
        make.left.equalTo(self.lab3.mas_right).offset(10);
        make.right.offset(0);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self striateHindranceKingdom];
}

@end
