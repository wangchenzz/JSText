//
//  nEWtESToNE.m
//  1.5-2015
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "ErrorProofingTestController.h"
#import "ErrorProofingTest.h"
#import "PictureAndPointTest.h"

@implementation ErrorProofingTestController


-(void)viewDidLoad{

    [super viewDidLoad];
    
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [self.tabBarController.tabBar setHidden:YES];
    
    [self setUpTest];
    

    
}

-(void)setUpTest{
    
    CGFloat navih = CGRectGetMaxY(JSNavigationBounds);
    
    ErrorProofingTest *test = [[ErrorProofingTest alloc]initWithFrame:CGRectMake(0, navih, self.view.width, self.view.height - navih)];
    [self.view addSubview:test];
}

@end
