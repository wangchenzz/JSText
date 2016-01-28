//
//  testcontroller.m
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttensionTranSideDiffController.h"

#import "AttentionTransferSide.h"

#import "AttensionTranSideDiff.h"

@interface AttensionTranSideDiffController ()

@property (nonatomic,retain) AttentionTransferSide *de;

@end

@implementation AttensionTranSideDiffController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    _de= [[AttentionTransferSide alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 680)];
    
    [self.view addSubview:_de];
    
    AttensionTranSideDiff *deft = [[AttensionTranSideDiff alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 680)];

    [self.view addSubview:deft];
}

@end
