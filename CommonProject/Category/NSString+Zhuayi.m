//
//  NSString+Zhuayi.m
//  loan
//
//  Created by zhuayi on 15/11/11.
//  Copyright © 2015年 renxin. All rights reserved.
//

#import "NSString+Zhuayi.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (Zhuayi)
/**
 *  判断字符串是否为空
 *
 *  @return
 */
- (BOOL)isBlankString {
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

/**
 *  MD5加密
 *
 *  @return
 */
- (NSString *)md5HexDigest {
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}


- (BOOL)checkUserIdCard {
    
    NSString *idCard = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSInteger length;
    if (!idCard) {
        
        return NO;
        
    } else {
        length = idCard.length;
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)isNumber:(NSString *)string withMinLength:(NSInteger)minLen withMaxLength:(NSInteger)maxLen
{  //检测是否是数字
    NSString *regex = [NSString stringWithFormat:@"^[0-9]{%ld,%ld}$", (long)minLen, (long)maxLen];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:string];
}

+ (BOOL)isNumber:(NSString *)string
{  //检测是否是数字
    NSString *regex = @"^[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:string];
}


/**
 *  邮箱
 *
 *  @return 
 */
- (BOOL)validateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


/**
 *  手机号码验证
 *
 *  @return
 */
- (BOOL)validateMobile {
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^(\\+)?(86)?0?(\\s)?1\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    NSString *phone = [self stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return [phoneTest evaluateWithObject:phone];
}

/**
 *  用户名
 *
 *  @param name
 *
 *  @return
 */
- (BOOL)validateUserName {
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:self];
    return B;
}


/**
 *  密码校验
 *
 *  @param passWord
 *
 *  @return
 */
- (BOOL)validatePassword {
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}

/**
 *  获取长度
 *
 *  @return
 */
- (NSUInteger)getStrlength {
    return [self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];
}

/**
 *  验证昵称
 *
 *  @return
 */
- (BOOL)validateNickname {
    
    NSString *nicknameRegex = @"[a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:self];
}


/**
 *  验证纯数组
 *
 *  @return
 */
- (BOOL)validateNumber {
    
    NSString *nicknameRegex = @"^[0-9]*$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:self];
}

/**
 *  身份证号验证
 *
 *  @return
 */
- (BOOL)validateIdentityCard {
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

/**
 *  隐藏中间四位手机号
 *
 *  @return
 */
- (NSString *)hideMobile {
    
    NSString *mobile = [self stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    if (mobile.length > 11) {
        return mobile;
    }
    
     return [NSString stringWithFormat:@"%@****%@",
               [mobile substringWithRange:NSMakeRange(0, 3)],
               [mobile substringWithRange:NSMakeRange(7, 4)]];
    
}

/**
 *  金额转字符串 如100000 -> 10,000.00
 *
 *  @param money
 *
 *  @return
 */
+ (NSString *)moneyToStrings:(CGFloat)money {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *moneyStr = [formatter stringFromNumber:[NSNumber numberWithDouble:money]];
    
    return [NSString multipleLongForNumber:moneyStr];
}

/**
 *  金额转字符串 如100000 -> 10,000
 *
 *  @param money
 *
 *  @return
 */
+ (NSString *)moneyToOrigStrings:(CGFloat)money {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    return [formatter stringFromNumber:[NSNumber numberWithDouble:money]];

}

//是否是整数
+ (NSString *)multipleLongForNumber:(NSString *)money {
    if ([money rangeOfString:@"."].location != NSNotFound) {
        
        //取得 . 的位置
        NSRange pointRange = [money rangeOfString:@"."];
        
        //判断 . 后面有几位
        NSUInteger f = money.length - 1 - pointRange.location;
        //如果小于2位就添加一个0
        if (f < 2) {
            money  = [NSString stringWithFormat:@"%@%@",money,@"0"];
        }
    } else {
        money  = [NSString stringWithFormat:@"%@%@",money,@".00"];
    }
    return money;
}

/**
 *  正常号转银行卡号 － 增加4位间的空格
 *
 *  @return
 */
-(NSString *)normalNumToBankNum {
    NSString *tmpStr = [self bankNumToNormalNum];
    
    NSUInteger size = (tmpStr.length / 4);
    
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    for (int n = 0;n < size; n++)
    {
        [tmpStrArr addObject:[tmpStr substringWithRange:NSMakeRange(n*4, 4)]];
    }
    
    [tmpStrArr addObject:[tmpStr substringWithRange:NSMakeRange(size*4, (tmpStr.length % 4))]];
    
    tmpStr = [tmpStrArr componentsJoinedByString:@" "];
    
    return tmpStr;
}

/**
 *  银行卡号转正常号 － 去除4位间的空格
 *
 *  @return
 */
-(NSString *)bankNumToNormalNum {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}


- (NSString *)timeToStringWithFormatter:(NSDateFormatter *)formatter {
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    
//    //实例化一个NSDateFormatter对象
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    
//    //设定时间格式,这里可以设置成自己需要的格式
////    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    [dateFormatter setDateFormat:@"MM月dd日"];

    NSString *currentDateStr = [formatter stringFromDate: detaildate];
    
    return currentDateStr;
}

+ (NSString *)DecryptWithText:(NSString *)plainText key:(NSString *)key {
    
    NSString *cleartext = nil;
    NSData *textData = [NSString parseHexToByteArray:plainText];
    NSUInteger dataLength = [textData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          NULL,
                                          [textData bytes]  , dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSLog(@"DES解密成功");
        
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        cleartext = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else{
        NSLog(@"DES解密失败");
    }
    
    free(buffer);
    return cleartext;
}

+ (NSData*) parseHexToByteArray:(NSString*) hexString {
    int j=0;
    Byte bytes[hexString.length];
    for(int i=0;i<[hexString length];i++)
    {
        int int_ch;  /// 两位16进制数转化后的10进制数
        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        else
            int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
        i++;
        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        else if(hex_char2 >= 'A' && hex_char1 <='F')
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        else
            int_ch2 = hex_char2-87; //// a 的Ascll - 97
        
        int_ch = int_ch1+int_ch2;
        bytes[j] = int_ch;  ///将转化后的数放入Byte数组里
        j++;
    }
    
    NSData *newData = [[NSData alloc] initWithBytes:bytes length:hexString.length/2];
    return newData;
}

@end
