//
//  handEyeGameController.m
//  1.5-2015
//
//  Created by Mac on 16/2/16.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "handEyeGameController.h"

#import "JSPageController.h"

#import "JSPresentBut.h"

#import "JSWriteAnimationView.h"

@implementation handEyeGameController


-(void)viewDidLoad{

    [super viewDidLoad];
    
//    handEyeCoordinationView *view = [[handEyeCoordinationView alloc] initWithFrame:self.view.bounds];
//    
//    [self.view addSubview:view];
//    
//    view.delegate = self;
//    
//    [view start];
//    [self.view setBackgroundColor:[UIColor blackColor]];
//    
//    JSPageController *pa = [[JSPageController alloc] initWithFrame:CGRectMake(0, 20, 300, 38)];
//    
//    [pa setNumberOfPages: 5];
//
//    [pa setCurrentPage:3];
//    
//    [self.view addSubview:pa];
//    
//    [pa setTag:1];
    
    JSWriteAnimationView *write = [[JSWriteAnimationView alloc] initWithFrame:CGRectMake(0, 0, 350, 500)];
    
    [self.view addSubview:write];
    
    [write startAnimation];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [JSLoading loadSuccess];
    
}

-(void)handEyeCoordinationView:(handEyeCoordinationView *)handeye didFinsihGameWithTime:(float)timetravel{

    /**
     *  这个代理可能会调用多次, 不要做太多的操作;
     */
    
    NSLog(@"%f",timetravel);
    
    [self.navigationController popViewControllerAnimated:YES];

}

@end
