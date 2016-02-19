//
//  PictureAndPointController.m
//  1.5-2015
//
//  Created by Mac on 16/1/28.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "PictureAndPointController.h"

#import "PictureAndPointTest.h"

@interface PictureAndPointController ()

@end

@implementation PictureAndPointController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [self.tabBarController.tabBar setHidden:YES];
    
    [self setUpTest];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

-(void)setUpTest{
    
    
    CGFloat navih = CGRectGetMaxY(JSNavigationBounds);
    
    PictureAndPointTest *test = [[PictureAndPointTest alloc]initWithFrame:CGRectMake(0, navih, self.view.width, self.view.height - navih)];
    
    [self.view addSubview:test];
    
    [test beginTestForCount:4];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
