//
//  JSTabBarController.m
//  1.5-2015
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "JSTabBarController.h"

#import "MainViewController.h"

#import "RegistInfoController.h"

#import "SRTViewController.h"

#import "ChoseTestTypeController.h"

#import "AttentionSpanContoller.h"

@interface JSTabBarController ()

@end

@implementation JSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//     self.tabBar.tintColor = JSColor(255, 59, 70);

    ChoseTestTypeController *sttc = [[ChoseTestTypeController alloc]init];
    
    [self addJSChildViewController:sttc];
    
    RegistInfoController *ric = [[RegistInfoController alloc]initWithStyle:UITableViewStyleGrouped];
    
    
    [self addJSChildViewController:ric];
    //
    MainViewController *mvc = [[MainViewController alloc]init];
    
    [self addJSChildViewController:mvc];
    
    SRTViewController *SRT = [[SRTViewController alloc]init];
    
    [self addJSChildViewController:SRT];
    
    AttentionSpanContoller *asc = [[AttentionSpanContoller alloc]init];
    
    [self addJSChildViewController:asc];
    
}

-(void)addJSChildViewController:(UIViewController *)childController{
    
    childController.title = @"竞思教育";
    
    //tabbar 主题；

    //设置普通状态下的tabbaritem字体；
    NSMutableDictionary *normalAttri = [NSMutableDictionary new];
    
    normalAttri[NSFontAttributeName] = JSFont(18);
    
    normalAttri[NSForegroundColorAttributeName] = JSColor(1, 1, 1);
    
    
    //此处预留的设置选中和普通状态的图片
//    childController.tabBarItem.selectedImage =
//    childController.tabBarItem.image =
    
    //设置tabbar 的item的字体。
    [childController.tabBarItem setTitleTextAttributes:normalAttri forState:UIControlStateNormal];
    
    //还应设置选中状态下的字体颜色和大小。
    
    
    //导航栏主题
    
    //设置导航栏title 字体颜色；
    NSMutableDictionary *navigationTitle = [NSMutableDictionary new];
    
    navigationTitle[NSFontAttributeName] = JSFont(23);
    
    navigationTitle[NSForegroundColorAttributeName] = [UIColor whiteColor];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:childController];
    
    [navi.navigationBar setTitleTextAttributes:navigationTitle];
    
    
    //设置导航栏颜色；
    [navi.navigationBar setBarTintColor:JSColor(255, 59, 70)];
    
    //修改状态栏主题
    [navi.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    [self addChildViewController:navi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
