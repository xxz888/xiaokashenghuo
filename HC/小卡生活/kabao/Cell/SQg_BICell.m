
#import "SQg_BICell.h"

@implementation SQg_BICell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)absentBedroomScarp{
    [self.bg_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(10);
        make.right.bottom.offset(-10);
    }];
    
    [self.icon_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.top.equalTo(self.bg_image.mas_top).offset(15.5);
        make.left.equalTo(self.bg_image.mas_left).offset(25);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(0.5);
        make.top.equalTo(self.icon_image.mas_bottom).offset(50);
        make.left.equalTo(self.bg_image.mas_left).offset(20);
        make.right.equalTo(self.bg_image.mas_right).offset(-20);
    }];
    
    [self.yinhang_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bg_image.mas_top).offset(17.5);
        make.left.equalTo(self.icon_image.mas_right).offset(25);
    }];
    
    [self.name_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yinhang_lab.mas_bottom).offset(12);
        make.left.equalTo(self.yinhang_lab.mas_left).offset(2);
    }];
    
    [self.weihao_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.name_lab);
        make.left.equalTo(self.name_lab.mas_right).offset(23.5);
    }];
    
    
    
    [self.xiugai_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(50, 17));
        make.right.equalTo(self.bg_image.mas_right).offset(-20);
        make.top.equalTo(self.bg_image.mas_top).offset(50);
    }];
    
    [self.delete_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 17));
        make.centerX.equalTo(self.xiugai_btn);
        make.top.equalTo(self.xiugai_btn.mas_bottom).offset(6);
    }];
    
    
    
    [self.left_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(20);
        make.top.equalTo(self.line.mas_bottom).offset(10);
        make.left.equalTo(self.bg_image.mas_left).offset(17);
        make.bottom.equalTo(self.bg_image.mas_bottom).offset(-10);
    }];
    [self.right_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bg_image.mas_top).offset(10);
        make.right.equalTo(self.bg_image.mas_right).offset(-15);
    }];
    
    [self.yinlang_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(43, 27));
        make.centerY.equalTo(self.left_lab);
        make.right.equalTo(self.bg_image.mas_right).offset(-18);
    }];
    
    
    
    self.bg_image.layer.cornerRadius = 10;
    
    self.xiugai_btn.layer.masksToBounds = YES;
    self.xiugai_btn.layer.cornerRadius = 5;
    self.xiugai_btn.layer.borderColor = [UIColor colorWithHexString:@"#F4CA99" alpha:0.5].CGColor;
    self.xiugai_btn.layer.borderWidth = 0.5;
    [self.xiugai_btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:3.5];
    self.delete_btn.layer.masksToBounds = YES;
    self.delete_btn.layer.cornerRadius = 5;
    self.delete_btn.layer.borderColor = [UIColor colorWithHexString:@"#F4CA99" alpha:0.5].CGColor;
    self.delete_btn.layer.borderWidth = 0.5;
    [self.delete_btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:3.5];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self absentBedroomScarp];
}

@end
