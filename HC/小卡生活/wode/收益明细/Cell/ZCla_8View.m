
#import "ZCla_8View.h"

@implementation ZCla_8View


- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(10);
        make.right.bottom.offset(-10);
    }];
    self.bgview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.bgview.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.bgview.layer.shadowOpacity = 0.2;
    self.bgview.layer.shadowRadius = 3;
    self.bgview.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bgview.layer.cornerRadius = 10;
    
    double view_W = (DEVICE_WIDTH - 20 )/3;
    
    [self.yihuan_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(view_W);
        make.center.equalTo(self.bgview);
    }];
    
    [self.type_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(view_W);
        make.centerY.equalTo(self.bgview);
        make.right.equalTo(self.yihuan_lab.mas_left);
    }];
    
    [self.fanxian_lab  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(view_W);
        make.centerY.equalTo(self.bgview);
        make.left.equalTo(self.yihuan_lab.mas_right);
    }];
}

@end
