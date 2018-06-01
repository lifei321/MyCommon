//
//  NewsViewController.m
//  CommonProject
//
//  Created by ShanCheli on 16/10/17.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "NewsViewController.h"
#import "HYTabbarView.h"
#import "NewsOneViewController.h"
#import "NewsTestViewController.h"

@interface NewsViewController ()

@property (nonatomic,strong) HYTabbarView * tabbarView;


@end

@implementation NewsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"头条首页框架";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tabbarView];
    
}

//懒加载
- (HYTabbarView *)tabbarView{
    
    if (!_tabbarView) {
        _tabbarView = ({
            
            HYTabbarView * tabbar = [[HYTabbarView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
            
            NewsTestViewController * vc0 = [[NewsTestViewController alloc]init];
            vc0.title = @"推荐";
            [tabbar addSubItemWithViewController:vc0];
            
            NewsTestViewController * vc1 = [[NewsTestViewController alloc]init];
            vc1.title = @"热点";
            [tabbar addSubItemWithViewController:vc1];
            
            NewsTestViewController * vc2 = [[NewsTestViewController alloc]init];
            vc2.title = @"视频";
            [tabbar addSubItemWithViewController:vc2];
            
            NewsTestViewController * vc3 = [[NewsTestViewController alloc]init];
            vc3.title = @"中国好声音";
            [tabbar addSubItemWithViewController:vc3];
            
            NewsTestViewController * vc4 = [[NewsTestViewController alloc]init];
            vc4.title = @"数码";
            [tabbar addSubItemWithViewController:vc4];
            
            NewsTestViewController * vc5 = [[NewsTestViewController alloc]init];
            vc5.title = @"头条号";
            [tabbar addSubItemWithViewController:vc5];
            
            NewsTestViewController * vc6 = [[NewsTestViewController alloc]init];
            vc6.title = @"房产";
            [tabbar addSubItemWithViewController:vc6];
            
            NewsTestViewController * vc7 = [[NewsTestViewController alloc]init];
            vc7.title = @"奥运会";
            [tabbar addSubItemWithViewController:vc7];
            
            NewsTestViewController * vc8 = [[NewsTestViewController alloc]init];
            vc8.title = @"时尚";
            [tabbar addSubItemWithViewController:vc8];
            
            NewsOneViewController * vc9 = [[NewsOneViewController alloc]init];
            vc9.title = @"自定义控制器";
            [tabbar addSubItemWithViewController:vc9];
            
            tabbar;
        });
    }
    return _tabbarView;
}


@end
