//
//  JSTabBarController.m
//  1.5-2015
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "JSTabBarController.h"

#import "ChoseTestTypeController.h"

#import "attentionDistributionTestController.h"

#import "StroopTestController.h"

#import "JSPersonFileController.h"


/**
 *  测试的控制器
 *
 *  @param void ..
 *
 *  @return 0..
 */

@interface JSTabBarController ()

@end

@implementation JSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ChoseTestTypeController *test = [[ChoseTestTypeController alloc] init];
    
    [self addJSChildViewController:test withNormalImage:@"page1" selectImage:@"page1"  title:@"测评"];
    
    attentionDistributionTestController *adtc = [[attentionDistributionTestController alloc] init];
    
    [self addJSChildViewController:adtc withNormalImage:@"page2" selectImage:@"page2"  title:@"试验"];
    
    StroopTestController *tt= [[StroopTestController alloc] init];
    
    [self addJSChildViewController:tt withNormalImage:nil selectImage:nil title:@"pa"];
    

    JSPersonFileController *per = [[ JSPersonFileController alloc] init ];
    
    [self addJSChildViewController:per withNormalImage:nil selectImage:nil title:@"我"];
  
}

/**
 *  添加试图控制器
 *
 *  @param childController 创建好的试图控制器
 */

-(void)addJSChildViewController:(UIViewController *)childController withNormalImage:(NSString *)nname selectImage:(NSString *)sname title:(NSString *)title{
    
    childController.title = title;
    
    //tabbar 主题；
    
    //设置tabbar item 的颜色；
    self.tabBar.barTintColor = JSCOLOR;

    
    //设置普通状态下的tabbaritem字体；
           //tintcolor 即是字体选中颜色；未设置情况下。
   self.tabBar.tintColor = [UIColor whiteColor];
    
    NSMutableDictionary *normalAttri = [NSMutableDictionary dictionary];
    
    normalAttri[NSFontAttributeName] = JSFont(11);
    
    normalAttri[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //设置选中状态下的tabbaritem的字体；
    NSMutableDictionary *selectAttri = [NSMutableDictionary dictionary];
    
    selectAttri[NSFontAttributeName] = JSFont(11);
    
    selectAttri[NSForegroundColorAttributeName] = [UIColor whiteColor];

    
    //此处预留的设置选中和普通状态的图片
  
    childController.tabBarItem.image = [UIImage imageNamed:nname];
    
    childController.tabBarItem.selectedImage = [UIImage imageWithRenderNamed:sname];
  
    //设置tabbar 的item的字体。
    


    [[UITabBarItem appearance] setTitleTextAttributes:selectAttri forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:normalAttri forState:UIControlStateNormal];
    
    
    /**
     *  导航栏主题
     */
    
    //设置导航栏title 字体颜色；
    NSMutableDictionary *navigationTitle = [NSMutableDictionary dictionary];
    
    navigationTitle[NSFontAttributeName] = JSFont(23);
    
    navigationTitle[NSForegroundColorAttributeName] = [UIColor whiteColor];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:childController];
    
    [navi.navigationBar setTitleTextAttributes:navigationTitle];
    
    /**
     *  导航栏返回键颜色
     */
    
    [navi.navigationBar setTintColor:[UIColor whiteColor]];
    
    //设置导航栏 主体颜色；
    [navi.navigationBar setBarTintColor:JSCOLOR];
    
    //修改状态栏主题
    [navi.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    [self addChildViewController:navi];
}


@end
