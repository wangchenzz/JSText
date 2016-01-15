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
    
#warning  delete
    
    self.attentionTest = [[AttentionSpanTest alloc]initWithController:self];
    
    self.attentionTest.delegate = self;
    
   // [self.attentionTest show];
    
    AttentionTransferTest *trans = [[AttentionTransferTest alloc]initWithFrame:CGRectMake(50, 100, 300, 300)];
    trans.delegate = self;
    
    [self.view addSubview:trans];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [trans gameBegan];
}

-(void)dopa{

    JSLog(@"dopa");

}

//第一项测试时。 点击回调用
-(void)AttentionSpanTestClick:(AttentionSpanTest *)test testTime:(double)time label:(UILabel *)label {

    JSLog(@"%ld",label.tag);
    JSLog(@"%@",label.text);

}

//第一项测试结束时候调用    。。。 ary里面存放有单个词测试的所有数字；
-(void)AttentionSpanTestFinishFirstTest:(AttentionSpanTest *)test testArray:(NSMutableArray *)ary{

    JSLog(@"%@",ary);
    //[test showSecond];
    [test showSecond];
}
//第二项测试时。点击调用
-(void)AttentionSpanTestClick:(AttentionSpanTest *)test secondTestTime:(double)time numAry:(NSMutableArray *)numary testCount:(NSInteger)count{

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



#pragma mark - AttentionTransferTestDelegate

-(void)AttentionTransferTestDidFinish:(AttentionTransferTest *)test listArray:(NSMutableArray *)array{

    for (AttensionTransferModel *model in array) {
        JSLog(@"%d   -%f    =%@",model.isWriteX,model.time,model.iamge);
    }
    

}


@end
