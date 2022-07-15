
#import "NPYCly_J.h"

@interface UITextField (WLRange)

- (NSRange)selectedRange;

- (void)setSelectedRange:(NSRange)range;

@end

@implementation UITextField (WLRange)


- (NSRange)selectedRange {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextRange *selectedRange = self.selectedTextRange;
    UITextPosition *selectionStart = selectedRange.start;
    UITextPosition *selectionEnd = selectedRange.end;
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    return NSMakeRange(location, length);
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

@end


@implementation NPYCly_J


- (NSString *)requireGriefArduous:(NSString *)str {
    return [str stringByReplacingOccurrencesOfString:self.separator withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, str.length)];
}


- (void)bankNoField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSInteger groupSize = self.groupSize;
    NSString *text = textField.text;
    NSString *beingString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSString *cardNo = [self requireGriefArduous:beingString];
    
    if ( (string.length != 0 && ![self nurtureMote:cardNo]) || cardNo.length > 19) {
        return;
    }
    
    NSInteger rightNumberCount = [self requireGriefArduous:[text substringFromIndex:textField.selectedRange.location + textField.selectedRange.length]].length;
    
    if (beingString.length > groupSize) {
        textField.text = [self omenDisaffectionJigsawpuzzle:beingString];
    } else {
        textField.text = beingString;
    }
    text = textField.text;
    
    NSInteger rightOffset = [self irresistibleDullEachTranslator:cardNo.length rightNumberCount:rightNumberCount];
    NSRange currentSelectedRange = NSMakeRange(text.length - rightOffset, 0);
    
    
    if (currentSelectedRange.location > 0 && [[text substringWithRange:NSMakeRange(currentSelectedRange.location - 1, 1)] isEqualToString:self.separator]) {
        currentSelectedRange.location -= 1;
    }
    [textField setSelectedRange:currentSelectedRange];
}

#pragma mark - Helper


- (BOOL)nurtureMote:(NSString *)numberStr {
    NSString* numberRegex = @"^[0-9]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    return [numberPre evaluateWithObject:numberStr];
}



- (NSString *)omenDisaffectionJigsawpuzzle:(NSString *)string {
    NSString *str = [self requireGriefArduous:string];
    NSInteger groupCount = [self gustAvail:str.length];
    NSInteger groupSize = self.groupSize;
    NSMutableArray *components = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < groupCount; i++) {
        if (i*groupSize + groupSize > str.length) {
            [components addObject:[str substringFromIndex:i*groupSize]];
        } else {
            [components addObject:[str substringWithRange:NSMakeRange(i*groupSize, groupSize)]];
        }
    }
    NSString *groupedString = [components componentsJoinedByString:self.separator];
    return groupedString;
}



- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _groupSize = 4;
    _separator = @" ";
    return self;
}



- (NSInteger)irresistibleDullEachTranslator:(NSInteger)length rightNumberCount:(NSInteger)rightNumberCount {
    NSInteger totalGroupCount = [self gustAvail:length];
    NSInteger leftGroupCount = [self gustAvail:length - rightNumberCount];
    NSInteger totalWhiteSpace = totalGroupCount -1 > 0? totalGroupCount - 1 : 0;
    NSInteger leftWhiteSpace = leftGroupCount -1 > 0? leftGroupCount - 1 : 0;
    return rightNumberCount + (totalWhiteSpace - leftWhiteSpace);
}



- (NSInteger)gustAvail:(NSInteger)length {
    return (NSInteger)ceilf((CGFloat)length /self.groupSize);
}

@end
