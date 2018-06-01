//
//  SDDownLoadViewController.m
//  CommonProject
//
//  Created by ShanCheli on 16/8/16.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "SDDownLoadViewController.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "Reachability.h"


@interface SDDownLoadViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SDDownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showImageInView];
    
    NSURL *imageUrl = [NSURL URLWithString:@"http://img4q.duitang.com/uploads/item/201211/13/20121113211435_iRPeu.jpeg"];
    
    SDWebImageManager *mgr = [SDWebImageManager sharedManager];
    BOOL isExist = [mgr cachedImageExistsForURL:imageUrl];
    if (isExist) {
        NSLog(@"图片存在");
        [self.imageView sd_setImageWithURL:imageUrl placeholderImage:nil];
    }else {
        // 如果是wifi环境则下载推广图片，否则不下载
        if ([Reachability isEnableWIFI]) {
            NSLog(@"图片不存在，即将下载");
            [mgr downloadImageWithURL:imageUrl options:SDWebImageAvoidAutoSetImage progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                NSLog(@"图片下载完成");
                self.imageView.image = image;
            }];
        }
    }
}

- (void)showImageInView {
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.imageView];
    
}



@end
