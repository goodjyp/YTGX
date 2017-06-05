//
//  JudgmentRegularHelper.h
//  NSPredicateSearch
//
//  Created by ludongliang on 15/11/13.
//  Copyright (c) 2015年 ludongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JudgmentRegularHelper : NSObject
// 根据前三个数字判断手机号码属哪家
+ (NSString *)isMobileNumber:(NSString *)mobileNum;
//判断是不是email的地址
+(BOOL)isEmail:(NSString *)email;
//判断是否是手机号码
+(BOOL)isTelPhoneNumber:(NSString *)number;
//验证身份证号
+ (BOOL)isIDCard:(NSString *)IDCard;
//验证电话号码
+ (BOOL)isPhoneNumber:(NSString *)phoneNumber;
//只能输入由数字和26个英文字母组成的字符串
+ (BOOL)isOnlyNumerAndLetter:(NSString *)string;
//验证只有数字
+ (BOOL)isOnlyNumber:(NSString *)number;
//验证只能为n位的数字
+ (BOOL)isOnlyNumber:(NSString *)number bits:(NSInteger)bits;
//验证整数或者小数
+ (BOOL)isIntegerOrDecimal:(NSString *)string;
//验证至少n位的数字
+ (BOOL)isNumber:(NSString *)number atLeast:(NSInteger)bits;
//验证m位到n位的数字
+ (BOOL)isNumber:(NSString *)number fromBit:(NSInteger)fromBit toBit:(NSInteger)toBit;
//验证是否以数字开头
+ (BOOL)isNumberBegain:(NSString *)string;
//验证n位小数的正实数
+ (BOOL)isPositiveRealNumber:(NSString *)string bits:(NSInteger)bits;
//验证输入的是否是正整数
+ (BOOL)isPositiveInteger:(NSString *)string;
//验证输入的是否是负整数
+ (BOOL)isNegtiveInteger:(NSString *)string;
//验证是否是整数
+ (BOOL)isInteger:(NSString *)string;
//验证是否是非负整数
+ (BOOL)isNotNegtiveInteger:(NSString *)string;
//验证是否是非正整数
+ (BOOL)isNotPositiveInteger:(NSString *)string;
//验证只能输入英文字母
+ (BOOL)isOnlyLetter:(NSString *)letter;
//验证只能输入大写字母
+ (BOOL)isOnlyLowercaseLetters:(NSString *)letters;
//验证只能输入小写字母
+ (BOOL)isOnlyCapitalLetters:(NSString *)letters;
//验证是否含有指定的字符
+ (BOOL)isContentSpecialCharacter:(NSString *)string specialCharacter:(NSString *)character;
//验证只能输入汉字
+ (BOOL)isOnlyChineseCharacters:(NSString *)characters;
//验证是否是网址
+ (BOOL)isURL:(NSString *)URLString;
//验证InternetURL
+ (BOOL)isInternetURL:(NSString *)URLString;
//匹配中国邮编
+ (BOOL)isPostcode:(NSString *)postcode;
//匹配QQ号
+ (BOOL)isQQ:(NSString *)QQString;
//匹配IP地址
+ (BOOL)isIPAddress:(NSString *)IPAddress;
//匹配账号是否合法（字母开头，允许m-n字节，允许字母数字下划线）
+ (BOOL)isAccountNumber:(NSString *)account fromBit:(NSInteger)fromBit toBit:(NSInteger)toBit;
//验证车牌号
+ (BOOL)isCarNo:(NSString *)carNo;
//验证车型号
+ (BOOL)isCarType:(NSString *)carType;
//验证昵称
+ (BOOL)isNickname:(NSString *)nickname fromBit:(NSInteger)fromBit toBit:(NSInteger)toBit;
@end
