
#import "BRmaPhqii_6dCell.h"

@interface BRmaPhqii_6dCell()<UITextFieldDelegate>

@end

@implementation BRmaPhqii_6dCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)textFieldDidChange:(UITextField *)textField {
    self.model.placeholder = textField.text;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(self.textfield_lab.text.length > 5 && ![string isEqualToString:@""]){
        return NO;
    }
    return YES;
}




- (void)setModel:(DHSDpnz_x3 *)model{
    _model = model;
    self.title_lab.text = model.name;
    self.content_textfield.placeholder = model.placeholder;
    self.content_textfield.text = model.content;
    
    
    
    [self.title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(80);
        make.centerY.equalTo(self.contentView);
        make.left.offset(10);
    }];
    if ([self.title_lab.text isEqualToString:@"验证码"]) {
        [self.textfield_lab setHidden:NO];
        self.textfield_lab.delegate = self;
        self.textfield_lab.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
        [self.line_view setHidden:YES];
        self.content_textfield.textColor = [UIColor colorWithHexString:@"#1A1A4B"];
        [self.content_textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(80);
            make.centerY.equalTo(self.contentView);
            make.right.offset(-10);
        }];
        [self.textfield_lab addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self.textfield_lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.content_textfield.mas_left).offset(-10);
            make.left.equalTo(self.title_lab.mas_right).offset(10);
        }];
        
    }else{
        [self.line_view setHidden:NO];
        [self.textfield_lab setHidden:YES];
        self.content_textfield.textColor = [UIColor colorWithHexString:@"#666666"];
        [self.content_textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.offset(-10);
            make.left.equalTo(self.title_lab.mas_right).offset(10);
        }];
        
        [self.line_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(DEVICE_WIDTH - 30 - 20);
            make.height.offset(0.5);
            make.bottom.offset(0);
            make.centerX.equalTo(self.contentView);
        }];
    }
}

@end
