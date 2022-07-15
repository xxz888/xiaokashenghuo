
#import "HBLMmhwsTr_Le.h"

#import <CommonCrypto/CommonCrypto.h>


@implementation NSString (Category)



- (NSString *)getNamelength:(NSString *)name{
    if (name.length == 0) return @"";
    else if (name.length > 4) {
        
        return [NSString stringWithFormat:@"%@*",[name substringToIndex:4]];
    }
    return name;
}


- (BOOL)SJZL_isPhone {
    
    
    NSString *regex = @"1\\d{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

+ (NSString *)secondTransToDate:(NSInteger)totalSecond{
    NSInteger second = totalSecond % 60;
    NSInteger minute = (totalSecond / 60) % 60;
    NSInteger hours = (totalSecond / 3600) % 24;
    NSInteger days = totalSecond / (24*3600);
    
    NSString *secondStr = [NSString stringWithFormat:@"%ld",(long)second];
    NSString *minuteStr = [NSString stringWithFormat:@"%ld",(long)minute];
    NSString *hoursStr = [NSString stringWithFormat:@"%ld",(long)hours];
    NSString *dayStr = [NSString stringWithFormat:@"%ld",(long)days];
    if (second < 10) {
        secondStr = [NSString stringWithFormat:@"0%ld",(long)second];
    }
    if (minute < 10) {
        minuteStr = [NSString stringWithFormat:@"0%ld",(long)minute];
    }
    if (hours < 10) {
        hoursStr = [NSString stringWithFormat:@"0%ld",(long)hours];
    }
    if (days < 10) {
        dayStr = [NSString stringWithFormat:@"0%ld",(long)days];
    }
    if (hours <= 0) {
        return [NSString stringWithFormat:@"%@:%@",minuteStr,secondStr];
    }
    if (days <= 0) {
        return [NSString stringWithFormat:@"%@:%@:%@",hoursStr,minuteStr,secondStr];
    }
    return [NSString stringWithFormat:@"%@:%@:%@:%@",dayStr,hoursStr,minuteStr,secondStr];
}

-(CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

+ (BOOL)isBlankString:(NSString *)aStr{
    if (!aStr) {
        return YES;
    }
    if ([aStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!aStr.length) {
        return YES;
    }
    if ([aStr isEqualToString:@"(null)"]) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}


- (NSString *)RemoveTheBlankSpace:(NSString *)spaceStr{
    return [spaceStr stringByReplacingOccurrencesOfString:@" " withString:@""];
}


+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum
{
    if (phoneNum.length==11) {
        NSMutableString *newStr = [NSMutableString stringWithString:phoneNum];
        NSRange range = NSMakeRange(3, 4);
        [newStr replaceCharactersInRange:range withString:@"*****"];
        return newStr;
    }
    return nil;
}

+ (NSString *)base64EncodeString:(NSString *)string {
    
    NSData *data =[string dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}
+ (NSString*) getSecrectStringWithAccountNo:(NSString*)accountNo
{
    NSMutableString *newStr = [NSMutableString stringWithString:accountNo];
    NSRange range = NSMakeRange(4, 8);
    if (newStr.length>12) {
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    return newStr;
}

+ (NSString*) stringMobileFormat:(NSString *)mobile {
    if (mobile.length==11) {
        NSMutableString* value = [[NSMutableString alloc] initWithString:mobile];
        [value insertString:@"-" atIndex:3];
        [value insertString:@"-" atIndex:8];
        return value;
    }
    
    return nil;
}

+ (NSString*) stringChineseFormat:(double)value{
    
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.2f亿",value/100000000];
    }
    else if (value / 10000 >= 1 && value / 100000000 < 1) {
        return [NSString stringWithFormat:@"%.2f万",value/10000];
    }
    else {
        return [NSString stringWithFormat:@"%.2f",value];
    }
}


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize andlineSpacing:(CGFloat) lineSpaceing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.hyphenationFactor = 1.0;
    paragraphStyle.lineSpacing = lineSpaceing;
    paragraphStyle.firstLineHeadIndent = 0.0;
    paragraphStyle.paragraphSpacingBefore = 0.0;
    paragraphStyle.headIndent = 0;
    paragraphStyle.tailIndent = 0;
    NSDictionary *dict = @{NSFontAttributeName : font,NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize originSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    NSString *test = @"我们";
    CGSize wordSize = [test sizeWithFont:font maxSize:maxSize];
    
    CGFloat selfHeight = [self sizeWithFont:font maxSize:maxSize].height;
    
    if (selfHeight <= wordSize.height) {
        
        CGSize newSize = CGSizeMake(originSize.width, font.pointSize);
        
        if (selfHeight == 0) {
            
            newSize = CGSizeMake(originSize.width, 0);
        }
        
        originSize = newSize;
    }
    
    return originSize;
}


+ (BOOL)isTheWholeTen:(NSString *)digital{
    if([digital containsString:@"."]){
        return NO;
    }else{
        NSLog(@"%@",[digital substringFromIndex:digital.length-1]);
        if ([[digital substringFromIndex:digital.length-1] isEqualToString:@"0"]) {
            return YES;
        }else{
            return NO;
        }
    }
}

- (CGFloat) widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(0, maxHeight) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.width;
}


+(NSString *)countNumAndChangeformat:(NSString *)num
{
    NSMutableString *temp = [NSMutableString stringWithString:num];
    NSRange afterPointRange=NSMakeRange(num.length-3, 3);
    NSString * afterPoint=[temp substringWithRange:afterPointRange];
    [temp deleteCharactersInRange:afterPointRange];
    
    int count = 0;
    long long int a = temp.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:temp];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    [newstring insertString:afterPoint atIndex:newstring.length];
    return newstring;
}



+ (NSString *)MD5ForUpper32Bate:(NSString *)str{
    
    
    const char* input = [[NSString stringWithFormat:@"%@HengchUang33@",str] UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    return digest;
}


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
        NSDictionary *attrs = @{NSFontAttributeName : font};
        return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


- (NSString *)getNameEncryption:(NSString *)name{
    if (name.length == 0) return @"";
    else if (name.length == 2) {
        return [NSString stringWithFormat:@"%@*",[name substringToIndex:1]];
    }
    else {
        NSString *string1 = [name substringToIndex:name.length-1];
        NSString *string2 = [string1 substringFromIndex:1];
        NSString *str = @"*";
        for (int i = 0; i < string2.length; i++) {
            if (i < 3 && i > 0) {
                str = [NSString stringWithFormat:@"*%@",str];
            }
        }
        NSString *strUrl = [name stringByReplacingOccurrencesOfString:string2 withString:str];
        return strUrl;
    }
}


- (NSString *)removeUnwantedZero {
    
    if ([[self substringWithRange:NSMakeRange(self.length- 6, 6)] isEqualToString:@"000000"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-7)]; 
    } else if ([[self substringWithRange:NSMakeRange(self.length- 3, 3)] isEqualToString:@"000"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-4)]; 
    } else if ([[self substringWithRange:NSMakeRange(self.length- 2, 2)] isEqualToString:@"00"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-2)];
    } else if ([[self substringWithRange:NSMakeRange(self.length- 1, 1)] isEqualToString:@"0"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-1)];
    } else {
        return self;
    }
}

+  (CGFloat) heightForString:(NSString *)value fontSize:(CGFloat)fontSize andWidth:(CGFloat)width
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    CGRect sizeToFit = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:font ,NSParagraphStyleAttributeName:paragraphStyle}
                                           context:nil];
    return sizeToFit.size.height;
}

+ (CGFloat) widthForString:(NSString *)value fontSize:(CGFloat)fontSize andHight:(CGFloat)hight{
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    CGRect sizeToFit = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, hight)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:font ,NSParagraphStyleAttributeName:paragraphStyle}
                                           context:nil];
    return sizeToFit.size.width;
    
}


+ (NSString *)base64DecodeString:(NSString *)string {
    
    
    NSData *data=[[NSData alloc]initWithBase64EncodedString:string options:0];
    
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)trimmedString{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}


- (NSString *)replaceStringWithAsterisk:(NSInteger)startLocation length:(NSInteger)length {
    NSString *replaceStr = self;
    for (NSInteger i = 0; i < length; i++) {
        NSRange range = NSMakeRange(startLocation, 1);
        replaceStr = [replaceStr stringByReplacingCharactersInRange:range withString:@"*"];
        startLocation ++;
    }
    return replaceStr;
}


#pragma mark - MD5加密 32位 大写

- (NSNumber*)toNumber
{
    NSNumberFormatter *formatter=[[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number=[formatter numberFromString:self];
    return number;
}

@end
