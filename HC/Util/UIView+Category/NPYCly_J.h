
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NPYCly_J : NSObject


@property (assign, nonatomic) NSInteger groupSize;


@property (copy, nonatomic) NSString *separator;

- (void)bankNoField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end
