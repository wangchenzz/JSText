//
//  AttentionTransferSideController.m
//  1.5-2015
//
//  Created by Mac on 16/1/28.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionTransferSideController.h"

#import "AttentionTransferSide.h"

@interface AttentionTransferSideController ()<AttentionTransferSideDelegate>


@end

@implementation AttentionTransferSideController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [self.tabBarController.tabBar setHidden:YES];
    
    [self setUpTest];
}

-(void)setUpTest{
    
    CGFloat navih = CGRectGetMaxY(JSNavigationBounds);
    

    AttentionTransferSide *side = [[AttentionTransferSide alloc]initWithFrame:CGRectMake(0, navih, self.view.width, self.view.height - navih)];
    
    side.delegate = self;
    
    [self.view addSubview:side];

    [side test];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AttentionTransferSideDelegate;

-(void)AttentionTransferSideDidFinish:(AttentionTransferSide *)test forDataArray:(NSMutableArray *)ary{



}
@end
