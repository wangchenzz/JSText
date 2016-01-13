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

/**
 *  单独出现的label
 */
@property (nonatomic,weak) UILabel *labelFocus;

/**
 *  focuslabel 的tag值
 */
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

/** roll的x */
@property (nonatomic,assign) NSInteger centrollx;


/** roll的y */
@property (nonatomic,assign) NSInteger centrolly;

/** 导航栏的高度 */
@property (nonatomic,assign) NSInteger naviH;


/** label 的x */
@property (nonatomic,assign) CGFloat labelcenterx;


/** label 的y */
@property (nonatomic,assign) CGFloat labelcentery;


/** 是否重叠 */
@property (nonatomic,readonly,getter=isCD) BOOL CD;

/** 时间 */
@property (nonatomic,assign) double timeCount;

/** 持有控制器 */
@property (nonatomic,weak) UIViewController *control;

/** 10个数字的存放数组 */
@property (nonatomic,retain) NSMutableArray *numberContainAry;

/** 10个label 的位置 */
@property (nonatomic,retain) NSMutableArray *sizeAty;

/** 测试内容存放的数组 */
@property (nonatomic,retain) NSMutableArray *testInfoAry;


/**
 *  混合测试内容的数组
 */
@property (nonatomic,retain) NSMutableArray *soundInfoAry;

/** 测试的当前次数 */
@property (nonatomic,assign) NSInteger testCount;

@end
#define labelWidth JSFrame.size.width*.1
//struct JSSize {
//    CGFloat  centerx;
//    CGFloat  centery;
//};
//typedef struct JSSize JSSize;

//
//JSSizeMake(CGFloat width, CGFloat height)
//{
//    JSSize size; size.centerx = width; size.centery = height; return size;
//}


@implementation AttentionSpanTest

-(UILabel *)labelFocus{

    if (!_labelFocus) {
        
        UILabel *label = [[UILabel alloc]init];
        
        label.height = labelWidth;
        label.width = labelWidth;
        label.centerX = JSFrame.size.width *.5;
        label.centerY = JSFrame.size.height *.5;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        //[label setBackgroundColor:[UIColor redColor]];
        [self.control.view addSubview:label];
        self.labelFocus = label;
    }
    return _labelFocus;

}

-(UILabel *)label0{

    if (!_label0) {
        UILabel *label = [[UILabel alloc]init];
        label.width = labelWidth;
        label.height = labelWidth;
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
        label.width = labelWidth;
        label.height = labelWidth;
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
        label.width = labelWidth;
        label.height = labelWidth;
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
        label.width = labelWidth;
        label.height = labelWidth;
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
        label.width = labelWidth;
        label.height = labelWidth;
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
        label.width = labelWidth;
        label.height = labelWidth;
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
        label.width = labelWidth;
        label.height = labelWidth;
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
        label.width = labelWidth;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.height = labelWidth;
        [self.control.view addSubview:label];
        self.label7 = label;
    }
    return _label7;
}
-(UILabel *)label8{
    
    if (!_label8) {
        UILabel *label = [[UILabel alloc]init];
        label.width = labelWidth;
        label.height = labelWidth;
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
        label.width = labelWidth;
        [label setFont:JSFont(30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.height = labelWidth;
        [self.control.view addSubview:label];
        self.label9 = label;
    }
    return _label9;
}

-(NSMutableArray *)testInfoAry{

    if (!_testInfoAry) {
        self.testInfoAry = [NSMutableArray new];
    }
    return _testInfoAry;
}

-(instancetype)initWithController:(UIViewController*)control{

    if (self = [super init]) {
        self.control = control;
        //屏幕宽高；
        NSInteger wid = JSFrame.size.width;
        NSInteger heig = JSFrame.size.height;
        
        //导航栏宽高；
        CGRect rect = self.control.navigationController.navigationBar.frame;
        //导航栏高度
        NSInteger navigationY = rect.origin.y;
        NSInteger navigationHeig = rect.size.height;
        // 总高度；
        NSInteger navigationH = navigationHeig + navigationY;
        NSInteger labelw = labelWidth;
        
        //

        self.naviH = navigationH;
        self.centrollx = wid - labelw;
        self.centrolly = heig - navigationH - labelw;
    }
    return self;
}


/*
 
 第一阶段测试过程
 
 */

-(void)show{

    //1.无干扰的出现0－9 10个数字随机出现， 出现4时触发；
    
    [self rollLabel];
    
    self.timeCount = 0;
    
    self.testCount = 0;
    
    self.testInfoAry = nil;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(firstTestClick:)];
    
    [self.control.view addGestureRecognizer:tap];
    
    self.tap = tap;
    
    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BeginFirstTest:) userInfo:nil repeats:YES];
    
    self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(CaculateFirstTest:) userInfo:nil repeats:YES];
    
}
/**
 *  每过一段时间就会赋值label
 *
 *  @param timer 定时器
 */
-(void)CaculateFirstTest:(NSTimer*)timer{
    
    [self rollLabel];
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
    
   // JSLog(@"beginfirsttest run");
    self.timeCount = self.timeCount + 0.01;
    
    if (self.timeCount >= 10){
        [self.timeCountTimer invalidate];
        [self.actionTimer invalidate];
        [self.control.view removeGestureRecognizer:self.tap];
        [self.labelFocus removeFromSuperview];
        if ([self.delegate respondsToSelector:@selector(AttentionSpanTestFinishFirstTest:testArray:)]) {
            [self.delegate AttentionSpanTestFinishFirstTest:self testArray:self.testInfoAry];
        }
    }
}

/**
 *  随机给label 赋值；
 */
-(void)rollLabel{
    
    NSInteger arcnum = arc4random()%13;
    
   // [self.labelFocus removeFromSuperview];
    
    [self.labelFocus setTag:self.labelTag];

    self.labelTag ++;

    if (arcnum > 9) {
        [self.labelFocus setText:@"4"];
    }else{
        [self.labelFocus setText:[NSString stringWithFormat:@"%ld",arcnum]];
    }
    [self.testInfoAry addObject:self.labelFocus.text];
}


/*
 
 第二阶段测试结果
 
 */


/**
 *  显示第二阶段测试;
 */

-(void)showSecond{

    [self rollAllLabel];
    
    self.testInfoAry = nil;
    
    self.timeCount = 0;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(secondTestClick:)];
    
    [self.control.view addGestureRecognizer:tap];
    
    self.tap = tap;

    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(secondTestBegan:) userInfo:nil repeats:YES];
    self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(caculatSecondTest) userInfo:nil repeats:YES];
}

-(void)secondTestClick:(UITapGestureRecognizer*)tap{

    if ([self.delegate respondsToSelector:@selector(AttentionSpanTestClick:secondTestTime:numAry:testCount:)]) {
        [self.delegate AttentionSpanTestClick:self secondTestTime:self.timeCount numAry:self.numberContainAry testCount:self.testCount];
    }
    
}

/**
 *  循环的排布所有label的位置
 */

-(void)caculatSecondTest{
    self.testCount ++;
    
    [self rollAllLabel];

}

/**
 *  计时第二次测试的时间
 *
 *  @param timer 定时器
 */

-(void)secondTestBegan:(NSTimer*)timer{
    
    self.timeCount = self.timeCount + 0.01;
    
    if (self.timeCount >= 10) {
        [self.timeCountTimer invalidate];
        [self.actionTimer invalidate];
        [self.control.view removeGestureRecognizer:self.tap];
        if ([self.delegate respondsToSelector:@selector(AttentionSpanTestFinishSecondTest:testArray:)]) {
            [self.delegate AttentionSpanTestFinishSecondTest:self testArray:self.testInfoAry];
        }
    }
}

-(NSMutableArray *)numberContainAry{

    if (!_numberContainAry) {
        self.numberContainAry = [NSMutableArray new];
    }
    return _numberContainAry;
}
-(NSMutableArray *)sizeAty{
    if (!_sizeAty) {
        self.sizeAty = [NSMutableArray new];
    }
    return _sizeAty;
}


/**
 *  给所有的label 赋位置；
 */
-(void)rollAllLabel{
    self.numberContainAry = nil;
    self.sizeAty = nil;
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
    [self.testInfoAry addObject:self.numberContainAry];
}

/**
 *  随机位置 和数字
 *
 *  @param label
 */
-(void)setLabelFrame:(UILabel*)label{
    
//    (heig-labelWidth-navigationH)
    
    //判断位置是否占有;
    
    while (self.CD == NO) {
      
        
    }
    label.centerX = self.labelcenterx;
    label.centerY = self.labelcentery;
    
    CGRect labelrect = CGRectMake(label.centerX, label.centerY, 0, 0);

    NSValue *rect = [NSValue valueWithCGRect:labelrect];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:rect forKey:@"size"];
    
    [self.sizeAty addObject:dic];

    [label setBackgroundColor:[UIColor redColor]];
    
    NSString *labeltext = [NSString stringWithFormat:@"%u",(arc4random()%10)];
    
    [label setText:labeltext];
    
    [self.numberContainAry addObject:labeltext];
}

/**
 *  以此判断roll的值是否会和其他的重叠；
 *
 *  @return panduan
 */
-(BOOL)isCD{
    NSInteger conterx = arc4random()%(self.centrollx);
    NSInteger centery = arc4random()%(self.centrolly);
    CGFloat centerX = conterx+labelWidth*.5;
    CGFloat centerY = centery+labelWidth*.5+self.naviH;
    if (self.sizeAty.count == 0) {
        self.labelcenterx = centerX;
        self.labelcentery = centerY;
        return YES;
    }
    
    for (NSDictionary *objectDic in self.sizeAty) {
        
        NSValue *value = [objectDic objectForKey:@"size"];
        CGRect obrect = [value CGRectValue];
        
        if (ABS(obrect.origin.x - centerX) < labelWidth) {
            if (ABS(obrect.origin.y - centerY) < labelWidth) {
                return NO;
            }
        }
    }
    self.labelcenterx = centerX;
    self.labelcentery = centerY;
    return YES;
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
    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(beginSoundTest) userInfo:nil repeats:YES];
    self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(caculateSoundTest) userInfo:nil repeats:YES];
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
    
        [self.timeCountTimer invalidate];
        [self.actionTimer invalidate];
        [self.control.view removeGestureRecognizer:self.tap];

    }
}

/**
 *  开始循环进行语音的播放
 */
-(void)caculateSoundTest{
    NSInteger rollNum = arc4random()%10 - 1;
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
 *  视觉听觉混合测试;
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
    [self caculateSoundTest];
    
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


/**
 *  观察是否销毁。
 */
-(void)dealloc{
    
    JSLog(@"AttentionSpanTest--dealloc");

}
@end
