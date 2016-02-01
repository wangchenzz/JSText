//
//  StroopTestController.m
//  1.5-2015
//
//  Created by Mac on 16/2/1.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "StroopTestController.h"

#import "StroopTest.h"

@interface StroopTestController ()



@end

@implementation StroopTestController

-(void)viewDidLoad{

    [super viewDidLoad];
    
    StroopTest *test = [[StroopTest alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:test];
    
    
}

@end
