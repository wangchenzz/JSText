//
//  AttentionSpanContoller.m
//  1.5-2015
//
//  Created by Mac on 16/1/11.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionSpanContoller.h"

#import "AttentionSpanTest.h"
@interface AttentionSpanContoller ()<AttentionSpanTestDelegate>

@property (nonatomic,retain) AttentionSpanTest *attentionTest;

@end


@implementation AttentionSpanContoller

-(void)viewDidLoad{

    [super viewDidLoad];
    
#warning  delete
    
    self.tabBarController.tabBar.hidden = YES;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.attentionTest = [[AttentionSpanTest alloc]initWithController:self];
    
    self.attentionTest.delegate = self;
    
    [self.attentionTest show];
    
}

//第一项测试时。 点击回调用
-(void)AttentionSpanTestClick:(AttentionSpanTest *)test testTime:(double)time label:(UILabel *)label {

    JSLog(@"%ld",label.tag);
    JSLog(@"%@",label.text);

}

//第一项测试结束时候调用    。。。 ary里面存放有单个词测试的所有数字；
-(void)AttentionSpanTestFinishFirstTest:(AttentionSpanTest *)test testArray:(NSMutableArray *)ary{

    JSLog(@"%@",ary);
    [test showSecond];
}
//第二项测试时。点击调用
-(void)AttentionSpanTestClick:(AttentionSpanTest *)test secondTestTime:(double)time numAry:(NSMutableArray *)numary testCount:(NSInteger)count{

    
}
//第二次测试结束时候调用
-(void)AttentionSpanTestFinishSecondTest:(AttentionSpanTest *)test testArray:(NSMutableArray *)ary{

    [test soundTest];

    JSLog(@"%@",ary);
}
@end
