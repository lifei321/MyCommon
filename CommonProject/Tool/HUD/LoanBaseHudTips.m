//
//  LoanBaseHudTips.m
//  loan
//
//  Created by zhuayi on 15/12/19.
//  Copyright © 2015年 renxin. All rights reserved.
//

#import "LoanBaseHudTips.h"

static CGFloat FONT_SIZE = 14.0f;
static CGFloat OPACITY = 0.85;

// 指示器等待时间
#define kAfterSecond 1.5

@implementation LoanBaseHudTips

/**
 *  显示提示框
 *
 *  @param title
 */
+ (void)showHud:(NSString *)title tipsType:(BWMMBProgressHUDMsgType)tipsType view:(UIView *)view {
    
    if (view == nil) {
        return;
    }
    [LoanBaseHudTips hideHud:view];
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
    HUD.labelText = nil;
    HUD.detailsLabelText = title;
    HUD.opacity = OPACITY;
    
    [HUD bwm_hideWithTitle:nil
                 hideAfter:kBWMMBProgressHUDHideTimeInterval
                   msgType:tipsType];
    
}

+ (void)showHud:(NSString *)title view:(UIView *)view {
    if (view == nil) {
        return;
    }
    [LoanBaseHudTips hideHud:view];
    [MBProgressHUD bwm_showTitle:title toView:view hideAfter:kAfterSecond];
}

/**
 *  显示等待指示器
 */
+ (void)showHudWithLoding:(UIView *)view {
    
    [LoanBaseHudTips hideHud:view];
    [LoanBaseHudTips showHudWithLoding:view title:@"正在加载..."];
}

/**
 *  显示等待指示器
 */
+ (void)showHudWithLoding:(UIView *)view title:(NSString *)title {
    if (view == nil) {
        return;
    }
    [LoanBaseHudTips hideHud:view];;
    MBProgressHUD *HUD = [MBProgressHUD bwm_showHUDAddedTo:view title:kBWMMBProgressHUDMsgLoading];
    HUD.labelText = nil;
    HUD.detailsLabelText = title;
}

/**
 *   操作成功
 *
 *  @param title
 *  @param view
 */
+ (void)showHudWithSuccessful:(NSString *)title view:(UIView *)view {
    
    [LoanBaseHudTips showHud:title tipsType:BWMMBProgressHUDMsgTypeSuccessful view:view];
}

/**
 *   操作失败
 *
 *  @param title
 *  @param view
 */
+ (void)showHudWithfail:(NSString *)title view:(UIView *)view {
    
    if (view == nil) {
        return;
    }
    [LoanBaseHudTips showHud:title tipsType:BWMMBProgressHUDMsgTypeError view:view];
}

/**
 *   显示进度条
 *
 *  @param title
 *  @param detail
 *  @param view
 */
+ (MBProgressHUD *)showHubWithProgressTitle:(NSString *)title detail:(NSString *)detail view:(UIView *)view {
    if(view == nil) {
        return nil;
    }
    [LoanBaseHudTips hideHud:view];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.labelText = title;
    hud.detailsLabelText = detail;
    hud.progress = 0.01;//设置为0.0会出现进度条无法更新的问题
    hud.animationType = MBProgressHUDAnimationZoomIn;
    [view addSubview:hud];
    [hud show:YES];
    return hud;
}

/**
 *  隐藏指示器
 *
 *  @param view
 */
+ (void)hideHud:(UIView *)view {
    
    if (view == nil) {
        return;
    }
    
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}
@end
