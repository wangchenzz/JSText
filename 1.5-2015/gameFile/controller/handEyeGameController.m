//
//  handEyeGameController.m
//  1.5-2015
//
//  Created by Mac on 16/2/16.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "handEyeGameController.h"

@implementation handEyeGameController


-(void)viewDidLoad{

    [super viewDidLoad];
    
    handEyeCoordinationView *view = [[handEyeCoordinationView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:view];
    
    view.delegate = self;
    
    [view start];
}

-(void)handEyeCoordinationView:(handEyeCoordinationView *)handeye didFinsihGameWithTime:(float)timetravel{

    /**
     *  这个代理可能会调用多次, 不要做太多的操作;
     */
    
    NSLog(@"%f",timetravel);
    
    [self.navigationController popViewControllerAnimated:YES];

}

@end
