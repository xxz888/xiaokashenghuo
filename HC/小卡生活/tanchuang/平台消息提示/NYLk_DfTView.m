
#import "NYLk_DfTView.h"

@implementation NYLk_DfTView



- (void)awakeFromNib{
    [super awakeFromNib];
    
    
    
    [self.clean_btn setEnlargeEdgeWithTop:10 right:10 bottom:30 left:30];
    self.clean_btn.layer.masksToBounds = YES;
    self.clean_btn.layer.cornerRadius = 12;
    [self.clean_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(24, 24));
        make.right.top.offset(0);
    }];
    self.bg_view.layer.cornerRadius = 10;
    [self.bg_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(self.frame.size.width - 20);
        make.top.left.offset(10);
        make.right.offset(-10);
        make.bottom.offset(-10);
    }];
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(40);
        make.centerX.equalTo(self.bg_view);
        make.top.offset(30);
    }];
    
    [self.bg_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
    }];
    
    
    [self.conent_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title_lab.mas_bottom).offset(20);
        make.left.equalTo(self.bg_image.mas_left).offset(20);
        make.right.equalTo(self.bg_image.mas_right).offset(-20);
        make.bottom.equalTo(self.bg_view.mas_bottom).offset(-20);
    }];
    
    self.conent_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.conent_view.layer.shadowOffset = CGSizeMake(0, 0.3);
    self.conent_view.layer.shadowOpacity = 0.2;
    self.conent_view.layer.shadowRadius = 3;
    self.conent_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.conent_view.layer.cornerRadius = 10;
    
    [self.msgtitle_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(20);
        make.top.offset(15);
        make.left.offset(15);
        make.right.offset(-15);
    }];
    
    [self.msg_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.msgtitle_lab.mas_bottom).offset(15);
        make.left.offset(15);
        make.right.offset(-15);
    }];
    
}


@end
