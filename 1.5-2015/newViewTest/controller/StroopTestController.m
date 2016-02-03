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

/**
 *  这个控制器 用来控制 干扰训练的测试过程, 以及对结果的处理;
 */
-(void)viewDidLoad{

    [super viewDidLoad];
    
    StroopTest *test = [[StroopTest alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:test];
    
    [test setClipsToBounds:YES];
    
}
                                     
@end
