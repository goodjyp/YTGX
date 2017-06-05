//
//  NSString+Extension.h
//  BeiQingBike
//
//  Created by 贝庆 on 16/11/18.
//  Copyright © 2016年 贝庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
// 手机号判断
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

// 身份证号判断
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;

// 获取设备唯一标示
+ (NSString *)getDeviceId;
@end
