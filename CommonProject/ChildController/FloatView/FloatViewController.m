//
//  FloatViewController.m
//  CommonProject
//
//  Created by ShanCheli on 2017/7/6.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "FloatViewController.h"
#import "FloatView.h"

@interface FloatViewController ()<UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) FloatView* floatView;


@end

@implementation FloatViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    //    self.floatView = [[FloatView alloc] initWithImage:[UIImage imageNamed:@"FloatBonus"]];
    self.floatView = [FloatView new];
    [self.floatView setImageWithName:@"FloatBonus"];
    self.floatView.stayMode = STAYMODE_LEFTANDRIGHT;
    [self.floatView setTapActionWithBlock:^{
        NSLog(@"跳转到邀请好友界面");
    }];
    [self.view addSubview:self.floatView];
    //    [self.view bringSubviewToFront:self.floatView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.floatView moveTohalfInScreenWhenScrolling];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.floatView setCurrentAlpha:0.5];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.floatView setCurrentAlpha:1];
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
    }
    return _tableView;
}



@end
