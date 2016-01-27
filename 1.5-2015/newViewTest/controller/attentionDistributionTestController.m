
//
//  attentionDistributionTestController.m
//  1.5-2015
//
//  Created by Mac on 16/1/27.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "attentionDistributionTestController.h"

#import "AttentionDistributionTest.h"

@interface attentionDistributionTestController ()

@end

@implementation attentionDistributionTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AttentionDistributionTest *test = [[AttentionDistributionTest alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:test];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
