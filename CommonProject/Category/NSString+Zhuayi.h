//
//  NSString+Zhuayi.h
//  loan
//
//  Created by zhuayi on 15/11/11.
//  Copyright © 2015年 renxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSString (Zhuayi)

/**
 *  判断字符串是否为空
 *
 *  @return
 */
- (BOOL)isBlankString;

/**
 *  MD5加密
 *
 *  @return
 */
- (NSString *)md5HexDigest;

/**
 *  验证身份证号码
 *
 *  @param idCard
 *
 *  @return
 */
- (BOOL)checkUserIdCard;

+ (BOOL)isNumber:(NSString *)string withMinLength:(NSInteger)minLen withMaxLength:(NSInteger)maxLen;

+ (BOOL)isNumber:(NSString *)string;

- (NSUInteger)getStrlength;

/**
 *  邮箱
 *
 *  @return
 */
- (BOOL)validateEmail;

/**
 *  手机号码验证
 *
 *  @return
 */
- (BOOL)validateMobile;

/**
 *  用户名
 *
 *  @param name
 *
 *  @return
 */
- (BOOL)validateUserName;

/**
 *  密码校验
 *
 *  @param passWord
 *
 *  @return
 */
- (BOOL)validatePassword;

/**
 *  验证昵称
 *
 *  @return
 */
- (BOOL)validateNickname;

/**
 *  验证纯数组
 *
 *  @return
 */
- (BOOL)validateNumber;

/**
 *  身份证号验证
 *
 *  @return
 */
- (BOOL)validateIdentityCard;

/**
 *  隐藏中间四位手机号
 *
 *  @return
 */
- (NSString *)hideMobile;

/**
 *  金额转字符串 如100000.00 -> 10,000.00
 *
 *  @param money
 *
 *  @return
 */
+ (NSString *)moneyToStrings:(CGFloat)money;


/**
 *  金额转字符串 如100000.00 -> 10,000
 *
 *  @param money
 *
 *  @return
 */
+ (NSString *)moneyToOrigStrings:(CGFloat)money;

/**
 *  银行卡号转正常号 － 去除4位间的空格
 *
 *  @return
 */
-(NSString *)bankNumToNormalNum;


/**
 *  正常号转银行卡号 － 增加4位间的空格
 *
 *  @return
 */
-(NSString *)normalNumToBankNum;

/**
 *  时间戳转换到固定格式的时间
 *
 *  @param formatter 时间格式
 *
 *  @return 
 */
- (NSString *)timeToStringWithFormatter:(NSDateFormatter *)formatter ;

///DES 解密
+ (NSString *)DecryptWithText:(NSString *)plainText key:(NSString *)key;


@end
