//
//  AppMacro.h
//  loan
//
//  Created by zhuayi on 15/11/16.
//  Copyright © 2015年 renxin. All rights reserved.
//

#import "StyleMacro.h"
#import "NotificationMacro.h"
#import "DataAppearMacro.h"

// 当前taberController
#define kTabBarController [[UIApplication sharedApplication].delegate window].rootViewController

// 当前NavigationController
#define KNavigationController ((UINavigationController *)((UITabBarController *)kTabBarController).selectedViewController)

// 当前ViewController
#define kViewController  ((UIViewController *)[KNavigationController.viewControllers lastObject])

#if defined(CHANNEL_TEST) // 测试版本

#define IS_FORMAL 0

#elif defined(CHANNEL_APPSTORE) // AppStore 版本

#define IS_FORMAL 1

#else // 开发

#define IS_FORMAL 0

#endif

#define kchannelId @"pgy"

#define kAPI_USER_SERVER @"www.baidu.com"

//深圳统计  成单是3
#define kGDP_APPID 3
#define kGDP_STATIC_ID @"10001"

//MTA
#define kMTA_API_KEY @"IUSA9E2H8X6Y"

//微信
#define kWEIXIN_API_KEY @"wx04e411eba599d31e"


// 友盟统计 appkey
#define kUmengAppKey @"5672768de0f55aaf9300353a"

//个推SDK AppStore版证书key
#if IS_FORMAL
    #define kGtAppId           @"g3fgxh1xzh9m1LL5Vj2wq3"
    #define kGtAppKey          @"aaD2VYWrZk6djXWE4I6n02"
    #define kGtAppSecret       @"Joj6mlBIwj7ZkSuT1Ii6I6"
//企业版本（release）
#else
    #define kGtAppId           @"yIP67Xnn4X9aGAX3Jt41Q"
    #define kGtAppKey          @"JKE0AaytG19YDSPECg3qX"
    #define kGtAppSecret       @"ZmncktKj03AjqsR1Vm1xq9"
#endif

//无参block
typedef void (^SimpleCompletionBlock)(void);

//NSString  nil --> @""
#define EMPTY_STRING_IF_NIL(a)  (((a)==nil)?@"":(a))

// 指示器等待时间
#define kAfterSecond 1.5

// 交易记录每页最大显示数
#define kPageCount 20

/**
 *  反馈渠道号
 */
#define kFeedBackSource 5


#define kLoginViewTag 98765

/**
 *  自身 scheme 协议
 */
#define kSelfScheme @"loan"

// 客服电话
#define kCustomTel @"400-010-0788"


// umeng 强制升级在线参数
#define kUmengConfig @"iosConfig"

// appID
#define kAppID @"1069785400"

#define APPSTORE_URL @"itms-apps://itunes.apple.com/app/id"

//devcieToken
#define kDeviceToken @"LoandeviceToken"


// JLRoutes 传入的key（UINavigationController），用来导航
#define kLoanRouteViewControllerKey @"kLoanRouteViewControllerKey"

/**
 *  oauth1 加密秘钥
 */
#define kServerEncryptSignKey @"chengdan"


///客服加密key
#define kCustomerKey @"dLde34)dk3*&kd2H"

/**
 *  JSPatch 修复平台key
 */
#define JSPatchAPPkey @"fda7dac1e0643131"

/**
 *  Bugly Appid
 */
#define BuglyAppId @"e912b99f8f"

