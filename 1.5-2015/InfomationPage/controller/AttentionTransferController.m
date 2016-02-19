//
//  AttentionTransferController.m
//  1.5-2015
//
//  Created by Mac on 16/1/28.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "AttentionTransferController.h"

#import "AttentionTransferTest.h"

@interface AttentionTransferController ()<AttentionTransferTestDelegate>

@end

@implementation AttentionTransferController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    self.tabBarController.tabBar.hidden = YES;
    
    [self.view setBackgroundColor:JSCOLOR];
    

    [self setUpTest];
    
}

-(void)setUpTest{

    AttentionTransferTest *test = [[AttentionTransferTest alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height * .6)];
    
    [test gameBegan];
    
    test.delegate = self;
    
    [self.view addSubview:test];

}


#pragma mark - AttentionTransferTestdelegate;
-(void)AttentionTransferTestDidFinish:(AttentionTransferTest *)test listArray:(NSMutableArray *)array{

    
}


@end
