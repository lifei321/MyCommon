//
//  LoanBaseHudTips.h
//  loan
//
//  Created by zhuayi on 15/12/19.
//  Copyright © 2015年 renxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD+BWMExtension.h"

@interface LoanBaseHudTips : NSObject

//+ (void)showHud:(NSString *)title;


+ (void)showHud:(NSString *)title view:(UIView *)view;

/**
 *  显示提示框
 *
 *  @param title
 */
+ (void)showHud:(NSString *)title tipsType:(BWMMBProgressHUDMsgType)tipsType view:(UIView *)view;


/**
 *  显示等待指示器
 */
+ (void)showHudWithLoding:(UIView *)view title:(NSString *)title;

/**
 *  显示等待指示器 -> 正在加载
 */
+ (void)showHudWithLoding:(UIView *)view;

/**
 *   操作成功
 *
 *  @param title
 *  @param view
 */
+ (void)showHudWithSuccessful:(NSString *)title view:(UIView *)view;



/**
 *   操作失败
 *
 *  @param title
 *  @param view
 */
+ (void)showHudWithfail:(NSString *)title view:(UIView *)view;

/**
 *   显示进度条
 *
 *  @param title 标题
 *  @param detail 描述文字（标题下面）
 *  @param view
 */
+ (MBProgressHUD *)showHubWithProgressTitle:(NSString *)title detail:(NSString *)detail view:(UIView *)view;

/**
 *  隐藏指示器
 *
 *  @param view 
 */
+ (void)hideHud:(UIView *)view;
@end
