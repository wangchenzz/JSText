//
//  ClickTest.m
//  1.5-2015
//
//  Created by Mac on 16/1/5.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "ClickTest.h"

@interface ClickTest ()

@property (nonatomic,weak) UIViewController *control;

@property (nonatomic,assign) NSInteger clickCount;

@property (nonatomic,weak) UITapGestureRecognizer *onlyTap;

@end


@implementation ClickTest


//初始化
-(instancetype)initWithController:(UIViewController*)control{

    if (self = [super init]) {
        self.control = control;
    }
    return self;
}
//开始测试方法
-(void)beganTest{
    
    UILabel *label = [[UILabel alloc]init];
    
   [label setFrame:CGRectMake(JSFrame.size.width*.5-150, 200, 300, 200)];
    

    
    label.text = @"点击屏幕开始后疯狂敲击键盘";
    
    [self.control.view addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(beganClick:)];
    
    [self.control.view addGestureRecognizer:tap];
    
}
//关闭提示消息，开始游戏；
-(void)beganClick:(UITapGestureRecognizer*)tap{

    
    [self.control.view.subviews.firstObject removeFromSuperview];
    
    [self.control.view removeGestureRecognizer:tap];
    
    UITapGestureRecognizer *taps = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCountCacu)];
    
    [self.control.view addGestureRecognizer:taps];
    
    self.onlyTap = taps;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(click:) userInfo:nil repeats:YES];
    
    [timer fire];
    
}
//计算点击次数方法；
-(void)clickCountCacu{

    self.clickCount ++;

    JSLog(@"i'm click");
    
}
//计时方法；
-(void)click:(NSTimer*)timer{
    
    static NSInteger count = 0;

    if (count != 0) {
        JSLog(@"%ld",self.clickCount);
        count = 0;
        if ([self.delegate respondsToSelector:@selector(clickTestDidFinish:)]) {
            [self.delegate clickTestDidFinish:self];
        }
        [self.control.view removeGestureRecognizer:self.onlyTap];
        
        [timer invalidate];
        
        return;
    }
    

    
    count ++;
}
//检测退出；
-(void)dealloc{
    JSLog(@"clickTest is dealloc");
}

@end
