
//
//  attentionDistributionTestController.m
//  1.5-2015
//
//  Created by Mac on 16/1/27.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "attentionDistributionTestController.h"

#import "AttentionDistributionTest.h"

#import "AttentionDistributionModel.h"


@interface attentionDistributionTestController () <AttentionDistributionDelegate>

@end

@implementation attentionDistributionTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTest];
    
    


    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}


/**
 *  创建测试
 */
-(void)setUpTest{
    AttentionDistributionTest *test = [[AttentionDistributionTest alloc]initWithFrame:self.view.bounds];
    
    test.delegate = self;
    
    [self.view addSubview:test];
    
    [test beginTest:2];
}

/**
 *  测试完成后的回调
 *
 *  @param test  自身
 *  @param array 数据数组
 */


-(void)AttentionDistributionDidFinish:(AttentionDistributionTest *)test andArray:(NSMutableArray *)array{
    JSLog(@"312");
}





@end
