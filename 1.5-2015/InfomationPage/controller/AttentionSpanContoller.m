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
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.attentionTest = [[AttentionSpanTest alloc]initWithController:self];
    
    self.attentionTest.delegate = self;
    
    [self.attentionTest show];
    
}

-(void)AttentionSpanTestClick:(AttentionSpanTest *)test testTime:(double)time label:(UILabel *)label {

    JSLog(@"%ld",label.tag);
    JSLog(@"%@",label.text);

}

-(void)AttentionSpanTestFinishFirstTest:(AttentionSpanTest *)test{

    [test showSecond];

}
@end
