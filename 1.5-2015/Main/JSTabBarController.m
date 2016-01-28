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

#import "nEWtESToNE.h"


#import "attentionDistributionTestController.h"

/**
 *  测试的控制器
 *
 *  @param void ..
 *
 *  @return 0..
 */
#import "testcontroller.h"

@interface JSTabBarController ()

@end

@implementation JSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//     57 104 55
//     self.tabBar.tintColor = JSColor(255, 59, 70);


    ChoseTestTypeController *test = [[ChoseTestTypeController alloc] init];
    
    [self addJSChildViewController:test];
    
    
//    RegistInfoController *ric = [[RegistInfoController alloc]initWithStyle:UITableViewStyleGrouped];
//    
//    
//    [self addJSChildViewController:ric];
    //
//    MainViewController *mvc = [[MainViewController alloc]init];
//    
//    [self addJSChildViewController:mvc];
    
//    SRTViewController *SRT = [[SRTViewController alloc]init];
//    
//    [self addJSChildViewController:SRT];
    
    AttentionSpanContoller *asc = [[AttentionSpanContoller alloc]init];
    
    [self addJSChildViewController:asc];
 
    testcontroller *das = [[testcontroller alloc]init];
    
    [self addJSChildViewController:das];
    
    nEWtESToNE * ne = [[nEWtESToNE alloc]init];
    
    [self addJSChildViewController:ne];
    
    attentionDistributionTestController *adtc = [[attentionDistributionTestController alloc] init];
    
    [self addJSChildViewController:adtc];
    
}

/**
 *  添加试图控制器
 *
 *  @param childController 创建好的试图控制器
 */

-(void)addJSChildViewController:(UIViewController *)childController{
    
    childController.title = @"竞思教育";
    
    //tabbar 主题；
    
    //设置tabbar item 的颜色；
    self.tabBar.barTintColor = JSCOLOR;

    
    //设置普通状态下的tabbaritem字体；
           //tintcolor 即是字体选中颜色；未设置情况下。
   // self.tabBar.tintColor = [UIColor whiteColor];
    
    NSMutableDictionary *normalAttri = [NSMutableDictionary dictionary];
    
    normalAttri[NSFontAttributeName] = JSFont(10);
    
    normalAttri[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    //设置选中状态下的tabbaritem的字体；
    NSMutableDictionary *selectAttri = [NSMutableDictionary dictionary];
    
    selectAttri[NSFontAttributeName] = JSFont(10);
    
    selectAttri[NSForegroundColorAttributeName] = [UIColor whiteColor];

    
    //此处预留的设置选中和普通状态的图片
//    childController.tabBarItem.selectedImage =
//    childController.tabBarItem.image =
    
    
    //设置tabbar 的item的字体。
    

//    [childController.tabBarItem setTitleTextAttributes:selectAttri forState:UIControlStateSelected];
//    [childController.tabBarItem setTitleTextAttributes:normalAttri forState:UIControlStateNormal];

    [[UITabBarItem appearance] setTitleTextAttributes:selectAttri forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:normalAttri forState:UIControlStateNormal];
    
    
    //导航栏主题
    
    //设置导航栏title 字体颜色；
    NSMutableDictionary *navigationTitle = [NSMutableDictionary dictionary];
    
    navigationTitle[NSFontAttributeName] = JSFont(23);
    
    navigationTitle[NSForegroundColorAttributeName] = [UIColor whiteColor];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:childController];
    
    [navi.navigationBar setTitleTextAttributes:navigationTitle];
    
    
    //设置导航栏颜色；
    [navi.navigationBar setBarTintColor:JSCOLOR];
    
    //修改状态栏主题
    [navi.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    [self addChildViewController:navi];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}


@end
