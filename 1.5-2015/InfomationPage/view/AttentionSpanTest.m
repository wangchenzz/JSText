//
//  AttentionSpanTest.m
//  1.1-2015
//
//  Created by Mac on 16/1/11.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionSpanTest.h"

@interface AttentionSpanTest ()
@property (nonatomic,weak) UILabel *labelFocus;


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

@property (nonatomic,retain) NSTimer *timer;


@property (nonatomic,weak) UIViewController *control;


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
        [label setText:@"0"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label0 = label;
    }
    return _label0;
}
-(UILabel *)label1{
    
    if (!_label1) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"1"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label1 = label;
    }
    return _label1;
}
-(UILabel *)label2{
    
    if (!_label2) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"2"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label2 = label;
    }
    return _label2;
}
-(UILabel *)label3{
    
    if (!_label3) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"3"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label3 = label;
    }
    return _label3;
}
-(UILabel *)label4{
    
    if (!_label4) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"4"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label4 = label;
    }
    return _label4;
}
-(UILabel *)label5{
    
    if (!_label5) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"5"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label5 = label;
    }
    return _label5;
}
-(UILabel *)label6{
    
    if (!_label6) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"6"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label6 = label;
    }
    return _label6;
}
-(UILabel *)label7{
    
    if (!_label7) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"7"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label7 = label;
    }
    return _label7;
}
-(UILabel *)label8{
    
    if (!_label8) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"8"];
        label.width = JSFrame.size.width * .1;
        label.height = JSFrame.size.width *.1;
        [self.control.view addSubview:label];
        self.label8 = label;
    }
    return _label8;
}
-(UILabel *)label9{
    
    if (!_label9) {
        UILabel *label = [[UILabel alloc]init];
        [label setText:@"9"];
        label.width = JSFrame.size.width * .1;
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

-(void)show{

    //1.无干扰的出现0－9 10个数字随机出现， 出现4时触发；
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(BeginFirstTest:) userInfo:nil repeats:YES];
    
}

-(void)BeginFirstTest:(NSTimer*)timer{

    NSInteger arcnum = arc4random()%10;
    
    [self.labelFocus setText:[NSString stringWithFormat:@"%ld",arcnum]];
    

}

-(void)dealloc{

    JSLog(@"AttentionSpanTest--dealloc");ssssss

}
@end
