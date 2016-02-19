//
//  testcontroller.m
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "AttensionTranSideDiffController.h"

#import "AttensionTranSideDiff.h"

@interface AttensionTranSideDiffController ()


@end

@implementation AttensionTranSideDiffController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [self.tabBarController.tabBar setHidden:YES];

    [self setUpTest];
}

-(void)setUpTest{
    
    CGFloat navih = CGRectGetMaxY(JSNavigationBounds);
    

    AttensionTranSideDiff *deft = [[AttensionTranSideDiff alloc]initWithFrame:CGRectMake(0, navih, self.view.width, self.view.height - navih)];
    
    [self.view addSubview:deft];

}
@end
