//
//  LoanApiMacro.h
//  loan
//
//  Created by zhuayi on 15/11/26.
//  Copyright © 2015年 renxin. All rights reserved.
//

#import "LoanApiMacro.h"

// 错误码
typedef NS_ENUM(NSInteger,  LoanHttpErrorCode) {
    LoanHttpErrorCodeInputError = -100000,
};

#define kAPI_USER_SERVER_VERSION(PATH) [NSString stringWithFormat:@"%@/%@%@",kAPI_USER_SERVER,APP_VERSION,PATH]

// 格式：域名/版本号/my/xxx
#define kAPI_USER_SERVER_VERSION_MY(PATH) [NSString stringWithFormat:@"%@/%@/my%@",kAPI_USER_SERVER,APP_VERSION,PATH]

//新版服务器的地址都有/a
#define kAPI_USER_SERVER_VERSION_JAVA(PATH) [NSString stringWithFormat:@"%@/a/%@%@",kAPI_USER_SERVER,APP_VERSION,PATH]
/**
 *  登陆
 *
 *  @return
 */
#define kAPI_USER_LOGIN kAPI_USER_SERVER_VERSION(@"/user/login")




/****************单独域*******************/




