
#import "KOf_4View.h"

@implementation KOf_4View


- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.bg_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
    }];
    
    [self.top_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bg_image);
        make.top.equalTo(self.bg_image.mas_top).offset(30);
    }];
    
    [self.conent_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(180);
        make.top.equalTo(self.top_lab.mas_bottom).offset(50);
        make.left.equalTo(self.bg_image.mas_left).offset(20);
        make.right.equalTo(self.bg_image.mas_right).offset(-20);
    }];
    
    self.conent_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.conent_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.conent_view.layer.shadowOpacity = 0.2;
    self.conent_view.layer.shadowRadius = 3;
    self.conent_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.conent_view.layer.cornerRadius = 10;
    
    
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.conent_view.mas_top).offset(40);
        make.height.offset(50);
        make.left.offset(10);
        make.right.offset(-10);
    }];
    
    double btn_W = (DEVICE_WIDTH - 80 - 120)/2;
    
    self.left_btn.ylCornerRadius = 5;
    [self.left_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(btn_W, 33));
        make.left.equalTo(self.conent_view.mas_left).offset(40);
        make.top.equalTo(self.title_lab.mas_bottom).offset(36);
    }];

    self.right_btn.ylCornerRadius = 5;
    [self.right_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(btn_W, 33));
        make.right.equalTo(self.conent_view.mas_right).offset(-40);
        make.top.equalTo(self.title_lab.mas_bottom).offset(36);
    }];
}

@end
