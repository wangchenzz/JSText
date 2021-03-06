//
//  AttentionSpanTest.m
//  1.1-2015
//
//  Created by Mac on 16/1/11.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "AttentionSpanTest.h"

@interface AttentionSpanTest ()

//控件属性；

/**
 *  单独出现的label
 */
@property (nonatomic,weak) UILabel *labelFocus;

/**
 *  focuslabel 的tag值
 */
@property (nonatomic,assign) NSInteger labelTag;


@property (nonatomic,assign) SystemSoundID avid0;
@property (nonatomic,assign) SystemSoundID avid1;
@property (nonatomic,assign) SystemSoundID avid2;
@property (nonatomic,assign) SystemSoundID avid3;
@property (nonatomic,assign) SystemSoundID avid4;
@property (nonatomic,assign) SystemSoundID avid5;
@property (nonatomic,assign) SystemSoundID avid6;
@property (nonatomic,assign) SystemSoundID avid7;
@property (nonatomic,assign) SystemSoundID avid8;
@property (nonatomic,assign) SystemSoundID avid9;


//定时器和手势；
@property (nonatomic,retain) NSTimer *actionTimer;

@property (nonatomic,retain) NSTimer *timeCountTimer;

@property (nonatomic,weak) UITapGestureRecognizer *tap;


//重要属性

/**
 *  播放音乐标记;
 */
@property (nonatomic,assign) NSInteger soundCount;


/** 时间 */
@property (nonatomic,assign) float timeCount;

/** 持有控制器 */
@property (nonatomic,weak) UIViewController *control;



/** 测试内容存放的数组 */
@property (nonatomic,retain) NSMutableArray *testInfoAry;


/**
 *  混合测试内容的数组
 */
@property (nonatomic,retain) NSMutableArray *soundInfoAry;

/** 测试的当前次数 */
@property (nonatomic,assign) NSInteger testCount;

@end
#define labelWidth JSFrame.size.width*.5


@implementation AttentionSpanTest

-(UILabel *)labelFocus{

    if (!_labelFocus) {
        
        UILabel *label = [[UILabel alloc]init];
        label.height = labelWidth;
        label.width = labelWidth;
        label.centerX = JSFrame.size.width *.5;
        label.centerY = JSFrame.size.height *.5;
        [label setFont:[UIFont boldSystemFontOfSize:58]];
        label.textAlignment = NSTextAlignmentCenter;
        [label setBackgroundColor:[UIColor clearColor]];
        [self.control.view addSubview:label];
        label.adjustsFontSizeToFitWidth = YES;
        self.labelFocus = label;
    }
    return _labelFocus;
}


-(NSMutableArray *)testInfoAry{

    if (!_testInfoAry) {
        self.testInfoAry = [NSMutableArray array];
    }
    return _testInfoAry;
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
    
//    [self rollLabel];
    
    self.timeCount = 0;
    
    self.testCount = 0;
    
    self.testInfoAry = nil;
    
    
    UIImage *image1 =[UIImage imageNamed:@"span2"];
    
    UIColor *color1 = [image1 imageToColor];
    
    [self.control.view setBackgroundColor:color1];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(firstTestClick:)];
    
    [self.control.view addGestureRecognizer:tap];
    
    self.tap = tap;
    
    self.timeCountTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(BeginFirstTest:) userInfo:nil repeats:YES];
    
    self.actionTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(calculateFirstTest:) userInfo:nil repeats:YES];
    
    timerTool *tool = [timerTool tool];
    
    [tool fireInTheHoll:self.timeCountTimer];
    
    [tool fireInTheHoll:self.actionTimer];
    
    
}
/**
 *  每过一段时间就会赋值label
 *
 *  @param timer 定时器
 */
-(void)calculateFirstTest:(NSTimer*)timer{
    
    
//    [self.labelFocus setTextColor:[UIColor whiteColor]];
    [self rollLabel];
    
    if (self.labelFocus.text) {
        
        [self.testInfoAry addObject:self.labelFocus.text];
    }
    

    
}

/**
 *  点击屏幕的事件；
 *
 *  @param tap 手势
 */
-(void)firstTestClick:(UITapGestureRecognizer*)tap{

    if ([self.delegate respondsToSelector:@selector(AttentionSpanTestClick:testTime:label:)]) {
        [self.delegate AttentionSpanTestClick:self testTime:self.timeCount label:self.labelFocus];
    }
}
/**
 *  开始第一次的测试，计算时间。
 *
 *  @param timer 定时器
 */
-(void)BeginFirstTest:(NSTimer*)timer{
    self.timeCount = self.timeCount + 0.01;
    
    if (self.timeCount >= 10){

        [self.actionTimer invalidate];
        [self.timeCountTimer invalidate];
        [self.control.view removeGestureRecognizer:self.tap];
        [self.labelFocus removeFromSuperview];
        if ([self.delegate respondsToSelector:@selector(AttentionSpanTestFinishFirstTest:testArray:)]) {
            
            NSMutableArray *ary = [NSMutableArray arrayWithArray:self.testInfoAry];
            [self.delegate AttentionSpanTestFinishFirstTest:self testArray:ary];
        }

    }
}

/**
 *  随机给label 赋值；
 */
-(void)rollLabel{
    NSInteger arcnum = arc4random()%13;

    [self.labelFocus setTag:self.labelTag];

    self.labelTag ++;

    if (arcnum > 9) {
        [self setLabelTitle:@"4"];
    }else{
        [self setLabelTitle:[NSString stringWithFormat:@"%ld",arcnum]];
    }
}


/*
 
 第二阶段测试结果
 
 */


/**
 *  显示第二阶段测试;
 */

-(void)showSecond{

    self.testInfoAry = nil;
    
    self.timeCount = 0;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(secondTestClick:)];
    
    [self.control.view addGestureRecognizer:tap];
    
    self.tap = tap;

    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(secondTestBegan:) userInfo:nil repeats:YES];
    self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(caculatSecondTest) userInfo:nil repeats:YES];
}

-(void)secondTestClick:(UITapGestureRecognizer*)tap{

    if ([self.delegate respondsToSelector:@selector(AttentionSpanTestClick:secondTestTime:numAry:testCount:)]&&self.testCount >= 1) {
        [self.delegate AttentionSpanTestClick:self secondTestTime:self.timeCount numAry:self.testInfoAry[self.testCount-1] testCount:self.testCount];
    }
    
}

/**
 *  循环的排布所有label的位置
 */

-(void)caculatSecondTest{
    
    
    [self rollNighgNum];
    
    if (self.labelFocus.text) {
        
        [self.testInfoAry addObject:self.labelFocus.text];
    }
    
    self.testCount ++;

}

/**
 *  计时第二次测试的时间
 *
 *  @param timer 定时器
 */

-(void)secondTestBegan:(NSTimer*)timer{
    
    self.timeCount = self.timeCount + 0.01;
    
    if (self.timeCount >= 12) {
        [self.actionTimer invalidate];
        [self.timeCountTimer invalidate];
        [self.labelFocus removeFromSuperview];
        [self.control.view removeGestureRecognizer:self.tap];
        if ([self.delegate respondsToSelector:@selector(AttentionSpanTestFinishSecondTest:testArray:)]) {
            [self.delegate AttentionSpanTestFinishSecondTest:self testArray:self.testInfoAry];
        }
    }
}



/**
 *  给所有的label 赋位置；
 */
-(void)rollNighgNum{
    NSString *labelString = [NSString string];
    NSInteger isThereNum =  arc4random()%10;
    if (isThereNum >4) {
        labelString = @"3";
    }else{
        
        labelString = [NSString stringWithFormat:@"%d",arc4random()%10];
    }

    NSString *firstString = [labelString substringToIndex:1];
    for (int i = 0; i < 9; i ++) {
        NSInteger otherNum = arc4random()%10;
        if ([firstString isEqualToString:@"3"]) {
            if (otherNum == 3) {
                labelString = [labelString stringByAppendingString:[NSString stringWithFormat:@"%ld",otherNum +1]];
            }else{
                 labelString = [labelString stringByAppendingString:[NSString stringWithFormat:@"%ld",otherNum]];
            }
        }else{
        labelString = [labelString stringByAppendingString:[NSString stringWithFormat:@"%ld",otherNum]];
        }
    }
    
    [self setLabelTitle:labelString];
}


/**
 *  语音测试
 *
 *  @return ..
 */
-(void)soundTest{
    //这里先将所有语音全部进行注册；
    [self letSoundOk];
    
    self.timeCount = 0;
    self.testCount = 0;
    self.testInfoAry = nil;
    
    UIImage *image =[UIImage imageNamed:@"music"];
    
    UIColor *color = [image imageToColor];
    
    [self.control.view setBackgroundColor:color];
    
    self.testCount = 0;
    self.timeCount = 0;
    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(beginSoundTest) userInfo:nil repeats:YES];
    self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(soundTestAction) userInfo:nil repeats:YES];
     UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(soundTestClick)];
    
    [self.control.view addGestureRecognizer:tap];
    self.tap = tap;
}

/**
 *  准备所有音乐;
 */

-(void)letSoundOk{

    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avid0);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"2.caf"]), &_avid1);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"3.caf"]), &_avid2);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avid3);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"2.caf"]), &_avid4);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"3.caf"]), &_avid5);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avid6);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"2.caf"]), &_avid7);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"3.caf"]), &_avid8);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avid9);
    
}

/**
 *  声音测试中的点击事件；
 */
-(void)soundTestClick{
    
    if ([self.delegate respondsToSelector:@selector(AttentionSpanTestClick:soundTestTime:soundCount:testCount:)]&&self.testCount >= 1) {
        [self.delegate AttentionSpanTestClick:self soundTestTime:self.timeCount soundCount:self.soundCount testCount:self.testCount];
    }
}

//注册语音的语音URL；
/**
 *  得到注册音效的 URL
 *
 *  @param filename  文件名
 *
 *  @return 文件 URL
 */
-(NSURL *)regsoundForFile:(NSString*)filename{
    NSString *path = [[NSBundle mainBundle]resourcePath];
    path = [path stringByAppendingPathComponent:filename];
    NSURL *url = [NSURL fileURLWithPath:path];
    return url;
}

/**
 *  开始语音的计时.每0.01s
 */
-(void)beginSoundTest{
    self.timeCount = self.timeCount + 0.01;
    
    if (self.timeCount >= 10) {
        [self.actionTimer invalidate];
        [self.timeCountTimer invalidate];
        self.timeCountTimer = nil;
        self.actionTimer = nil;
        [self.control.view removeGestureRecognizer:self.tap];
        if ([self.delegate respondsToSelector:@selector(AttentionSpanTestFinishSoundTest:testArray:)]) {
            [self.delegate AttentionSpanTestFinishSoundTest:self testArray:self.testInfoAry];
        }
    }
}

-(void)soundTestAction{

    [self calculateSoundTest];
    [self.testInfoAry addObject:@(self.soundCount)];
    
    self.testCount ++;

}

/**
 *  开始循环进行语音的播放
 */
-(void)calculateSoundTest{
    NSInteger rollNum = arc4random()%10;
    self.soundCount = rollNum;
    switch (rollNum) {
        case 0:
            AudioServicesPlayAlertSound(self.avid0);
            break;
        case 1:
            AudioServicesPlayAlertSound(self.avid1);
            break;
        case 2:
            AudioServicesPlayAlertSound(self.avid2);
            break;
        case 3:
            AudioServicesPlayAlertSound(self.avid3);
            break;
        case 4:
            AudioServicesPlayAlertSound(self.avid4);
            break;
        case 5:
            AudioServicesPlayAlertSound(self.avid5);
            break;
        case 6:
            AudioServicesPlayAlertSound(self.avid6);
            break;
        case 7:
            AudioServicesPlayAlertSound(self.avid7);
            break;
        case 8:
            AudioServicesPlayAlertSound(self.avid8);
            break;
        case 9:
            AudioServicesPlayAlertSound(self.avid9);
            break;
        default:
            break;
    }
}

/**
 *  视觉听觉混合测试;           333333333333333333
 */
-(void)showSoundWatchTest{
    [self letSoundOk];
    
    self.timeCount = 0;
    
    self.testCount = 0;
    
    self.testInfoAry = nil;

    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(superTimerCount) userInfo:nil repeats:YES];
    self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(superCaculatTest) userInfo:nil repeats:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(superTestClick)];
    self.tap = tap;
}
/**
 *  混合测试时间计算
 */
-(void)superTimerCount{

    self.timeCount = self.timeCount + 0.01;
    
}

/**
 *  混合测试事件安排
 */
-(void)superCaculatTest{

    [self rollLabel];
    [self calculateSoundTest];
    
    NSString *count = [NSString stringWithFormat:@"%ld",self.soundCount];
    
    if ([count isEqualToString:self.labelFocus.text]) {
        [self.soundInfoAry addObject:@1];
        
    }else{
        
        [self.soundInfoAry addObject:@0];
    }
}

/**
 *  混合测试点击事件
 */
-(void)superTestClick{
    
    
    
}

-(void)setLabelTitle:(NSString *)string{
    
    [self.labelFocus jsLabel_AnimatgionRollDirctionToText:string andColor:nil];
}

/**
 *  观察是否销毁。
 */
-(void)dealloc{
    
    JSLog(@"AttentionSpanTest--dealloc");

}
@end
