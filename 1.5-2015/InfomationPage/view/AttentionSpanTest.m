//
//  AttentionSpanTest.m
//  1.1-2015
//
//  Created by Mac on 16/1/11.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionSpanTest.h"

@interface AttentionSpanTest ()

//控件属性；
@property (nonatomic,weak) UILabel *labelFocus;
@property (nonatomic,assign) NSInteger labelTag;

@property (nonatomic,weak) UILabel *label1;
@property (nonatomic,weak) UILabel *label2;
@property (nonatomic,weak) UILabel *label3;
@property (nonatomic,weak) UILabel *label4;
@property (nonatomic,weak) UILabel *label5;
@property (nonatomic,weak) UILabel *label6;
@property (nonatomic,weak) UILabel *label7;
@property (nonatomic,weak) UILabel *label8;
@property (nonatomic,weak) UILabel *label9;
@property (nonatomic,weak) UILabel *label0;


//定时器和手势；
@property (nonatomic,retain) NSTimer *actionTimer;

@property (nonatomic,retain) NSTimer *timeCountTimer;

@property (nonatomic,weak) UITapGestureRecognizer *tap;


//重要属性
@property (nonatomic,assign) double timeCount;

@property (nonatomic,weak) UIViewController *control;

@property (nonatomic,retain) NSMutableArray *numberContainAry;

@end

@implementation AttentionSpanTest

-(UILabel *)labelFocus{

    if (!_labelFocus) {
        
        UILabel *label = [[UILabel alloc]init];
        
        label.height = JSFrame.size.width *.1;
        label.width = JSFrame.size.width *.1;
        label.centerX = JSFrame.size.width *.5;
        label.centerY = JSFrame.size.height *.5;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [label setBackgroundColor:[UIColor redColor]];
        [self.control.view addSubview:label];
        self.labelFocus = label;
    }
    return _labelFocus;

}

-(UILabel *)label0{

    if (!_label0) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.control.view addSubview:label];
        self.label0 = label;
    }
    return _label0;
}
-(UILabel *)label1{
    
    if (!_label1) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.control.view addSubview:label];
        self.label1 = label;
    }
    return _label1;
}
-(UILabel *)label2{
    
    if (!_label2) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.control.view addSubview:label];
        self.label2 = label;
    }
    return _label2;
}
-(UILabel *)label3{
    
    if (!_label3) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.control.view addSubview:label];
        self.label3 = label;
    }
    return _label3;
}
-(UILabel *)label4{
    
    if (!_label4) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.control.view addSubview:label];
        self.label4 = label;
    }
    return _label4;
}
-(UILabel *)label5{
    
    if (!_label5) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.control.view addSubview:label];
        self.label5 = label;
    }
    return _label5;
}
-(UILabel *)label6{
    
    if (!_label6) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.control.view addSubview:label];
        self.label6 = label;
    }
    return _label6;
}
-(UILabel *)label7{
    
    if (!_label7) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label7 = label;
    }
    return _label7;
}
-(UILabel *)label8{
    
    if (!_label8) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.control.view addSubview:label];
        self.label8 = label;
    }
    return _label8;
}
-(UILabel *)label9{
    
    if (!_label9) {
        UILabel *label = [[UILabel alloc]init];
        label.width = JSFrame.size.width * .1;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label9 = label;
    }
    return _label9;
}
-(instancetype)initWithController:(UIViewController*)control{

    if (self = [super init]) {
        self.control = control;
    }
    return self;
}


/*
 
 第一阶段测试过程
 
 */

-(void)show{

    //1.无干扰的出现0－9 10个数字随机出现， 出现4时触发；
    
    self.timeCount = 0;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(firstTestClick:)];
    
    [self.control.view addGestureRecognizer:tap];
    
    self.tap = tap;
    
    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BeginFirstTest:) userInfo:nil repeats:YES];
    
    self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(CaculateFirstTest:) userInfo:nil repeats:YES];
    
}
//每过一段时间就会赋值label
-(void)CaculateFirstTest:(UITapGestureRecognizer*)tap{

    [self rollLabel];
    
}

//点击屏幕的事件；
-(void)firstTestClick:(UITapGestureRecognizer*)tap{

    if ([self.delegate respondsToSelector:@selector(AttentionSpanTestClick:testTime:label:)]) {
        [self.delegate AttentionSpanTestClick:self testTime:self.timeCount label:self.labelFocus];
    }

}
//开始第一次的测试，计算时间。
-(void)BeginFirstTest:(NSTimer*)timer{
    
   // JSLog(@"beginfirsttest run");
    self.timeCount = self.timeCount + 0.01;
    
    if (self.timeCount >= 10){
        [self.timeCountTimer invalidate];
        [self.actionTimer invalidate];
        [self.control.view removeGestureRecognizer:self.tap];
        [self.labelFocus removeFromSuperview];
        if ([self.delegate respondsToSelector:@selector(AttentionSpanTestFinishFirstTest:)]) {
            [self.delegate AttentionSpanTestFinishFirstTest:self];
        }
    }
}


//随机给label 赋值；
-(void)rollLabel{
    
    NSInteger arcnum = arc4random()%13;
    
    [self.labelFocus setTag:self.labelTag];

    self.labelTag ++;

    if (arcnum > 9) {
        [self.labelFocus setText:@"4"];
    }else{
        [self.labelFocus setText:[NSString stringWithFormat:@"%ld",arcnum]];
    }
}


/*
 
 第二阶段测试结果
 
 */


//显示第二阶段测试;

-(void)showSecond{

    [self rollAllLabel];
    
    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(secondTestBegan:) userInfo:nil repeats:YES];
}

-(void)secondTestBegan:(NSTimer*)timer{ 

    
    
}

-(NSMutableArray *)numberContainAry{

    if (!_numberContainAry) {
        self.numberContainAry = [NSMutableArray new];
    }
    return _numberContainAry;
}

//给所有的label 赋位置；
-(void)rollAllLabel{

    self.numberContainAry = nil;
    [self setLabelFrame:self.label0];
    [self setLabelFrame:self.label1];
    [self setLabelFrame:self.label2];
    [self setLabelFrame:self.label3];
    [self setLabelFrame:self.label4];
    [self setLabelFrame:self.label5];
    [self setLabelFrame:self.label6];
    [self setLabelFrame:self.label7];
    [self setLabelFrame:self.label8];
    [self setLabelFrame:self.label9];
}

-(void)setLabelFrame:(UILabel*)label{
    NSInteger wid = JSFrame.size.width;
    NSInteger heig = JSFrame.size.height;
    NSInteger conterx = arc4random()%wid;
    NSInteger centery = arc4random()%heig;
    label.centerX = conterx;
    label.centerY = centery;
    [label setBackgroundColor:[UIColor redColor]];
    NSString *labeltext = [NSString stringWithFormat:@"%u",(arc4random()%10)];
    [label setText:labeltext];
    [self.numberContainAry addObject:labeltext];
}


-(void)dealloc{

    JSLog(@"AttentionSpanTest--dealloc");

}
@end
