//
//  JudgmentRegularHelper.m
//  NSPredicateSearch
//
//  Created by ludongliang on 15/11/13.
//  Copyright (c) 2015年 ludongliang. All rights reserved.
//

#import "JudgmentRegularHelper.h"

@implementation JudgmentRegularHelper
// 根据前三个数字判断手机号码属哪家
+ (NSString *)isMobileNumber:(NSString *)mobileNum {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", PHS];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestphs evaluateWithObject:mobileNum] == YES))
    {
        if([regextestcm evaluateWithObject:mobileNum] == YES) {
//            NSLog(@"China Mobile");
            return @"中国移动";
        } else if([regextestct evaluateWithObject:mobileNum] == YES) {
//            NSLog(@"China Telecom");
            return @"中国电信";
        } else if ([regextestcu evaluateWithObject:mobileNum] == YES) {
//            NSLog(@"China Unicom");
            return @"中国联通";
        } else if ([regextestphs evaluateWithObject:mobileNum] == YES) {
//            NSLog(@"固话");
            return @"固话";
        }
    }
    return @"未知来源";
}
//判断是不是email的地址
+(BOOL)isEmail:(NSString *)email {
    return [[self class] judgementWithString:email type:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,5}"];
}
//判断是否是手机号
+(BOOL)isTelPhoneNumber:(NSString *)number {
    return [[self class] judgementWithString:number type:@"^1\\d{10}$"];
}
//验证身份证号
+ (BOOL)isIDCard:(NSString *)IDCard {
    return [[self class] judgementWithString:IDCard type:@"^(\\d{14}|\\d{17})(\\d|[xX])$"];
}
//验证电话号码
+ (BOOL)isPhoneNumber:(NSString *)phoneNumber {
    return [[self class] judgementWithString:phoneNumber type:@"^(\\d{3,4}-)\\d{7,8}$"];
}
//只能输入由数字和26个英文字母组成的字符串
+ (BOOL)isOnlyNumerAndLetter:(NSString *)string {
    return [[self class] judgementWithString:string type:@"^[A-Za-z0-9]+$"];
}
//验证只有数字
+ (BOOL)isOnlyNumber:(NSString *)number {
    return [[self class] judgementWithString:number type:@"^[0-9]*$"];
}
//验证只能为n位的数字
+ (BOOL)isOnlyNumber:(NSString *)number bits:(NSInteger)bits {
    return [[self class] judgementWithString:number type:[NSString stringWithFormat:@"^\\d{%lu}$", bits - 1]];
}
//验证整数或者小数(实数)
+ (BOOL)isIntegerOrDecimal:(NSString *)string {
    return [[self class] judgementWithString:string type:@"^-?[0-9]+([.]{0,1}[0-9]+){0,1}$"];
}
//验证至少n位的数字
+ (BOOL)isNumber:(NSString *)number atLeast:(NSInteger)bits {
    return [[self class] judgementWithString:number type:[NSString stringWithFormat:@"^\\d{%lu,}$", bits - 1]];
}
//验证m位到n位的数字
+ (BOOL)isNumber:(NSString *)number fromBit:(NSInteger)fromBit toBit:(NSInteger)toBit {
    return [[self class] judgementWithString:number type:[NSString stringWithFormat:@"^\\d{%lu,%lu}$", fromBit - 1, toBit - 1]];
}
//验证是否以数字开头
+ (BOOL)isNumberBegain:(NSString *)string {
    return [[self class] judgementWithString:string type:@"^(0|[1-9][0-9]*)$"];
}
//验证n位小数的正实数
+ (BOOL)isPositiveRealNumber:(NSString *)string bits:(NSInteger)bits {
    return [[self class] judgementWithString:string type:[NSString stringWithFormat:@"^[0-9]+(.[0-9]{%lu})?$", bits - 1]];
}
//验证输入的是否是正整数
+ (BOOL)isPositiveInteger:(NSString *)string {
    return [[self class] judgementWithString:string type:@"^[1-9]d*$"];
}
//验证输入的是否是负整数
+ (BOOL)isNegtiveInteger:(NSString *)string {
    return [[self class] judgementWithString:string type:@"^-[1-9]d*$"];
}
//验证是否是整数
+ (BOOL)isInteger:(NSString *)string {
    return [[self class] judgementWithString:string type:@"^-?[1-9]d*$"];
}
//验证是否是非负整数
+ (BOOL)isNotNegtiveInteger:(NSString *)string {
    return [[self class] judgementWithString:string type:@"^[1-9]d*|0$"];
}
//验证是否是非正整数
+ (BOOL)isNotPositiveInteger:(NSString *)string {
    return [[self class] judgementWithString:string type:@"^-[1-9]d*|0$"];
}
//验证只能输入英文字母
+ (BOOL)isOnlyLetter:(NSString *)letter {
    return [[self class] judgementWithString:letter type:@"^[A-Za-z]+$"];
}
//验证只能输入大写字母
+ (BOOL)isOnlyLowercaseLetters:(NSString *)letters {
    return [[self class] judgementWithString:letters type:@"^[A-Z]+$"];
}
//验证只能输入小写字母
+ (BOOL)isOnlyCapitalLetters:(NSString *)letters {
    return [[self class] judgementWithString:letters type:@"^[a-z]+$"];
}
//验证是否含有指定的字符
+ (BOOL)isContentSpecialCharacter:(NSString *)string specialCharacter:(NSString *)character {
    return [[self class] judgementWithString:string type:[NSString stringWithFormat:@"[%@x22]+", character]];
}
//验证只能输入汉字
+ (BOOL)isOnlyChineseCharacters:(NSString *)characters {
    return [[self class] judgementWithString:characters type:@"^[\u4e00-\u9fa5]{0,}$"];
}
//验证是否是网址
+ (BOOL)isURL:(NSString *)URLString {
    return [[self class] judgementWithString:URLString type:@"[a-zA-z]+://[^s]*"];
}
//验证InternetURL
+ (BOOL)isInternetURL:(NSString *)URLString {
    return [[self class] judgementWithString:URLString type:@"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?"];
}
//匹配中国邮编
+ (BOOL)isPostcode:(NSString *)postcode {
    return [[self class] judgementWithString:postcode type:@"[1-9]d{5}(?!d)"];
}
//匹配QQ号
+ (BOOL)isQQ:(NSString *)QQString {
    return [[self class] judgementWithString:QQString type:@"[1-9][0-9]{4,}"];
}
//匹配IP地址
+ (BOOL)isIPAddress:(NSString *)IPAddress {
    return [[self class] judgementWithString:IPAddress type:@"(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])"];
}
//匹配账号是否合法（字母开头，允许m-n字节，允许字母数字下划线）
+ (BOOL)isAccountNumber:(NSString *)account fromBit:(NSInteger)fromBit toBit:(NSInteger)toBit {
    return [[self class] judgementWithString:account type:[NSString stringWithFormat:@"^[a-zA-Z][a-zA-Z0-9_]{%lu,%lu}$", fromBit - 1, toBit - 1]];
}
//验证车牌号
+ (BOOL)isCarNo:(NSString *)carNo {
    return [[self class] judgementWithString:carNo type:@"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$"];
}
//验证车型号
+ (BOOL)isCarType:(NSString *)carType {
    return [[self class] judgementWithString:carType type:@"^[\u4E00-\u9FFF]+$"];
}
//验证昵称
+ (BOOL)isNickname:(NSString *)nickname fromBit:(NSInteger)fromBit toBit:(NSInteger)toBit {
    return [[self class] judgementWithString:nickname type:[NSString stringWithFormat:@"^[\u4e00-\u9fa5]{%lu,%lu}$", fromBit - 1, toBit - 1]];
}
+ (BOOL)judgementWithString:(NSString *)string type:(NSString *)type {
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", type];
    return [regextest evaluateWithObject:string];
}
@end
