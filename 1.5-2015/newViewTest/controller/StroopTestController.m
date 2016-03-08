//
//  StroopTestController.m
//  1.5-2015
//
//  Created by Mac on 16/2/1.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "StroopTestController.h"

#import "StroopTest.h"

@interface StroopTestController ()<StroopTestDelegate>



@end

@implementation StroopTestController

/**
 *  这个控制器 用来控制 干扰训练的测试过程, 以及对结果的处理;
 */
-(void)viewDidLoad{

    [super viewDidLoad];
    
    StroopTest *test = [[StroopTest alloc] initWithFrame:self.view.bounds];
    
    test.delegate = self;
    
    [self.view addSubview:test];
    
    [test setClipsToBounds:YES];

    [test showTestWithCount:6];
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
//    NSLog(@"%@", languages);
    
}


#pragma mark - stroopTestDelegate

-(void)stroopTestDidFinsih:(NSMutableArray *)array{

    

}

@end
