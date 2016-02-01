//
//  AttentionSpanContoller.m
//  1.5-2015
//
//  Created by Mac on 16/1/11.
//  Copyright © 2016年 竟思. All rights reserved.
//


#import "AttentionSpanContoller.h"

#import "AttentionSpanTest.h"

#import "AttentionTransferTest.h"

#import "AttensionTransferModel.h"

@interface AttentionSpanContoller ()<AttentionSpanTestDelegate,AttentionTransferTestDelegate>

@property (nonatomic,retain) AttentionSpanTest *attentionTest;

@end

@implementation AttentionSpanContoller

-(void)viewDidLoad{

    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.attentionTest = [[AttentionSpanTest alloc]initWithController:self];
    self.attentionTest.delegate = self;
    [self.attentionTest show];

    self.tabBarController.tabBar.hidden = YES;
}


#pragma mark - AttentionSpanTestDelegate



//第一项测试时。 点击回调用
-(void)AttentionSpanTestClick:(AttentionSpanTest *)test testTime:(float)time label:(UILabel *)label {

    JSLog(@"%ld",label.tag);
    JSLog(@"%@",label.text);

}

//第一项测试结束时候调用    。。。 ary里面存放有单个词测试的所有数字；
-(void)AttentionSpanTestFinishFirstTest:(AttentionSpanTest *)test testArray:(NSMutableArray *)ary{

    JSLog(@"%@",ary);
    
    [test showSecond];
}
//第二项测试时。点击调用
-(void)AttentionSpanTestClick:(AttentionSpanTest *)test secondTestTime:(float)time numAry:(NSString *)numary testCount:(NSInteger)count{
    
    JSLog(@"%@",numary);
    
    
}
//第二次测试结束时候调用

/**
 *  第二项测试会重复测试,如何解决,
 *
 *  @param test 自身
 *  @param ary  测试数组 数组里面包含的数组是每次屏幕上显示的所有数字;
 */
-(void)AttentionSpanTestFinishSecondTest:(AttentionSpanTest *)test testArray:(NSMutableArray *)ary{
    
    [test soundTest];

    JSLog(@"%@",ary);
}

-(void)AttentionSpanTestClick:(AttentionSpanTest *)test soundTestTime:(float)time soundCount:(NSInteger)sound testCount:(NSInteger)count{

    JSLog(@"%ld",sound);

}

-(void)AttentionSpanTestFinishSoundTest:(AttentionSpanTest *)test testArray:(NSMutableArray *)ary{

    JSLog(@"%@",ary);
    [test showSoundWatchTest];

}



@end
