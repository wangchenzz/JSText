//
//  testcontroller.m
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "testcontroller.h"

#import "AttentionTransferSide.h"

@interface testcontroller ()

@end

@implementation testcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    AttentionTransferSide *seide = [[AttentionTransferSide alloc]initWithFrame:[self.view bounds]];
    
    [self.view addSubview:seide];
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
