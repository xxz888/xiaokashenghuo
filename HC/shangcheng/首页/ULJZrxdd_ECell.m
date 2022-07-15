
#import "ULJZrxdd_ECell.h"

@implementation ULJZrxdd_ECell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bg_view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.bg_view.layer.shadowOffset = CGSizeMake(0, 0.1);
    self.bg_view.layer.shadowOpacity = 0.1;
    self.bg_view.layer.shadowRadius = 3;
    self.bg_view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bg_view.layer.cornerRadius = 10;
    
    [self.bg_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(5);
        make.right.bottom.offset(-5);
    }];
    [self.top_image getPartOfTheCornerRadius:CGRectMake(0, 0, (DEVICE_WIDTH - 35) / 2, 140) CornerRadius:10 UIRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight ];
    
    [self.top_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(140);
    }];
    
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(self.top_image.mas_bottom).offset(5);
        make.left.offset(10);
        make.right.offset(-10);
        make.height.offset(30);
        
    }];
    
    [self.content_lab mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(self.title_lab.mas_bottom).offset(5);
        make.left.offset(10);
        make.right.offset(-10);
        make.height.offset(20);
        
    }];
    
}

@end
