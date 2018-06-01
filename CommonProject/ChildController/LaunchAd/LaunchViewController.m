//
//  LaunchViewController.m
//  CommonProject
//
//  Created by ShanCheli on 16/7/5.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "LaunchViewController.h"
#import "XHLaunchAd.h"


@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //1.初始化启动页广告(初始化后,自动添加至视图,不用手动添加)
    XHLaunchAd *launchAd = [[XHLaunchAd alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height-150) andDuration:5];
    
    //2.设置启动页广告图片的url(必须)
    NSString *imgUrlString =@"http://img.taopic.com/uploads/allimg/120906/219077-120Z616330677.jpg";
    
    [launchAd imgUrlString:imgUrlString options:XHWebImageRefreshCached completed:^(UIImage *image, NSURL *url) {
        //异步加载图片完成回调(若需根据图片实际尺寸,刷新广告frame,可在这里操作)
        //launchAd.adFrame = ...;
    }];
    
    //是否影藏'倒计时/跳过'按钮[默认显示](可选)
    launchAd.hideSkip = NO;
    
    //广告点击事件(可选)
    launchAd.clickBlock = ^()
    {
        NSString *url = @"https://www.baidu.com";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    };
    
    //库文件 是通过 接收launchFinished 通知，这时添加到window上的
    [[[UIApplication sharedApplication].delegate window] addSubview:launchAd];
}

@end
