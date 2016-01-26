//
//  nEWtESToNE.m
//  1.5-2015
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "nEWtESToNE.h"
#import "ErrorProofingTest.h"
#import "PictureAndPointTest.h"

@implementation nEWtESToNE


-(void)viewDidLoad{

    [super viewDidLoad];
    
    
    //    [self.view setBackgroundColor:[UIColor whiteColor]];
    //    self.navigationController.navigationBar.translucent = YES;
    //    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    //    self.navigationController.navigationBar.alpha = 0;
    //    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    /**
     上一个测试;
     */
//    ErrorProofingTest *test = [[ErrorProofingTest alloc]initWithFrame:CGRectMake(0, 0, self.view.width,self.view.height)];
//    [self.view addSubview:test];

    PictureAndPointTest *test = [[PictureAndPointTest alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    
    [self.view addSubview:test];
    
    [test beginTestForCount:4];
    
}

@end
