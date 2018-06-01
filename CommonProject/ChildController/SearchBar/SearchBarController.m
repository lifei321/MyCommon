//
//  SearchBarController.m
//  CommonProject
//
//  Created by ShanCheli on 16/7/5.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "SearchBarController.h"

#import "SecondSearchViewController.h"
#import "AnotherSearchViewController.h"
#import "TextSearchViewController.h"


@interface SearchBarController ()

@end

@implementation SearchBarController

- (void)viewDidLoad {
    self.navigationItem.title = @"搜索框选择";
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    [button1 setTitle:@"固定的搜索框" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(clickedBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 50)];
    [button2 setTitle:@"随着滚动的搜索框" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(CilckedBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 50)];
    [button3 setTitle:@"实时搜索" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(CilckedBtn3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 50)];
    [button4 setTitle:@"随着滚动的搜索框" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(CilckedBtn4:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
}


- (void)clickedBtn1:(id)sender {
    AnotherSearchViewController *another = [AnotherSearchViewController new];
    [self.navigationController pushViewController:another animated:YES];
}

- (void)CilckedBtn2:(id)sender {
    SecondSearchViewController *search = [SecondSearchViewController new];
    [self.navigationController pushViewController:search animated:YES];
}

- (void)CilckedBtn3:(id)sender {
    TextSearchViewController *vc = [[TextSearchViewController alloc] init];
    
    vc.searchMode = SearchModeRealTime;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)CilckedBtn4:(id)sender {
    TextSearchViewController *vc = [[TextSearchViewController alloc] init];
    
    vc.searchMode = SearchModeAction;
    
    [self.navigationController pushViewController:vc animated:YES];
}



@end
