//
//  nEWtESToNE.m
//  1.5-2015
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "nEWtESToNE.h"
#import "ErrorProofingTest.h"

@implementation nEWtESToNE


-(void)viewDidLoad{

    [super viewDidLoad];
    ErrorProofingTest *test = [[ErrorProofingTest alloc]initWithFrame:CGRectMake(0, 0, self.view.width,self.view.height)];
    
//    [self.view setBackgroundColor:[UIColor whiteColor]];
//    self.navigationController.navigationBar.translucent = YES;
//    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
//    self.navigationController.navigationBar.alpha = 0;
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    [self.view addSubview:test];
}

@end
