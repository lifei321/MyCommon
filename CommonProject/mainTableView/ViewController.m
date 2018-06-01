//
//  ViewController.m
//  CommonProject
//
//  Created by ShanCheli on 16/7/4.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "ViewController.h"
#import "mainModel.h"


#import "JJLabelViewController.h"
#import "BannerViewController.h"
#import "NewFeatureViewController.h"
#import "SearchBarController.h"
#import "LaunchViewController.h"
#import "ScrollLightController.h"
#import "PhotoViewController.h"
#import "SDDownLoadViewController.h"
#import "NewsViewController.h"
#import "FloatViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabelView;

@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataSource = [NSMutableArray arrayWithCapacity:5];
        self.title = @"类型列表";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tabelView];
    
    mainModel *JJLabelModel = [[mainModel alloc] init];
    JJLabelModel.name = @"JJLabel";
    JJLabelModel.descrip = @"百变类型的label";
    JJLabelModel.pushController = NSStringFromClass([JJLabelViewController class]);
    
    mainModel *bannerModel = [[mainModel alloc] init];
    bannerModel.name = @"bannerView";
    bannerModel.descrip = @"头部无限循环的banner，用来展示图片";
    bannerModel.pushController = NSStringFromClass([BannerViewController class]);
    
    
    mainModel *featureModel = [[mainModel alloc] init];
    featureModel.name = @"NewFeatureMovieGuide";
    featureModel.descrip = @"一个视频引导页";
    featureModel.pushController = NSStringFromClass([NewFeatureViewController class]);
    
    
    mainModel *searchModel = [[mainModel alloc] init];
    searchModel.name = @"searchController";
    searchModel.descrip = @"搜索中英文的搜索框";
    searchModel.pushController = NSStringFromClass([SearchBarController class]);

    mainModel *launchModel = [[mainModel alloc] init];
    launchModel.name = @"LaunchViewController";
    launchModel.descrip = @"启动页广告";
    launchModel.pushController = NSStringFromClass([LaunchViewController class]);
    
    mainModel *lightModel = [[mainModel alloc] init];
    lightModel.name = @"ScrollLightController";
    lightModel.descrip = @"跑马灯";
    lightModel.pushController = NSStringFromClass([ScrollLightController class]);
    
    
    mainModel *photoModel = [[mainModel alloc] init];
    photoModel.name = @"photoSelect";
    photoModel.descrip = @"相册多选照片";
    photoModel.pushController = NSStringFromClass([PhotoViewController class]);
    
    mainModel *SDmodel = [[mainModel alloc] init];
    SDmodel.name = @"SD";
    SDmodel.descrip = @"SD下载图片";
    SDmodel.pushController = NSStringFromClass([SDDownLoadViewController class]);
    
    
    mainModel *Newsmodel = [[mainModel alloc] init];
    Newsmodel.name = @"头条";
    Newsmodel.descrip = @"头条框架";
    Newsmodel.pushController = NSStringFromClass([NewsViewController class]);

    mainModel *floatmodel = [[mainModel alloc] init];
    floatmodel.name = @"浮动图片";
    floatmodel.descrip = @"浮动的图片";
    floatmodel.pushController = NSStringFromClass([FloatViewController class]);
    
    [self.dataSource addObject:JJLabelModel];
    [self.dataSource addObject:bannerModel];
    [self.dataSource addObject:featureModel];
    [self.dataSource addObject:searchModel];
    [self.dataSource addObject:launchModel];
    [self.dataSource addObject:lightModel];
    [self.dataSource addObject:photoModel];
    [self.dataSource addObject:SDmodel];
    [self.dataSource addObject:Newsmodel];
    [self.dataSource addObject:floatmodel];

}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    mainModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.descrip;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    mainModel *model = self.dataSource[indexPath.row];
    
    if (indexPath.row == 2) {
        NewFeatureViewController *newFeatureVC = [[NSClassFromString(model.pushController) alloc] init];
        // 设置本地视频路径数组
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i<4; i++) {
            [array addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"guide%d",i] ofType:@"mp4"]];
        }
        newFeatureVC.guideMoviePathArr = array;
        // 设置封面图片数组
        newFeatureVC.guideImagesArr = @[@"guide0", @"guide1", @"guide2", @"guide3"];
        // 设置最后一个视频播放完成之后的block
        [newFeatureVC setLastOnePlayFinished:^{
            UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
            [UIApplication sharedApplication].keyWindow.rootViewController = rootNav;
        }];

        [self.navigationController pushViewController:newFeatureVC animated:YES];
        
    } else {
        UIViewController *VC = [[NSClassFromString(model.pushController) alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }

}

- (UITableView *)tabelView {

    if (_tabelView == nil) {
        _tabelView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
        _tabelView.tableFooterView = [[UIView alloc] init];
    }
    return _tabelView;
}

@end
