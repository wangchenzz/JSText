//
//  AttentionConcentrationView.m
//  1.5-2015
//
//  Created by Mac on 16/2/23.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionConcentrationView.h"

@interface AttentionConcentrationView ()

/**
 *  3个定时器
 */
@property (nonatomic,retain) NSTimer *pressTimer;

@property (nonatomic,retain) NSTimer *unPressTimer;

@property (nonatomic,retain) NSTimer *moveTimer;

/**
 *  错误的次数
 */
@property (nonatomic,assign) NSInteger wrongCount;

/**
 *  计算的三种时间
 */
@property (nonatomic,assign) float moveTime;

@property (nonatomic,assign) float pressTime;

@property (nonatomic,assign) float unPressTime;

/**
 *  移动的那个色块
 */
@property (retain, nonatomic)  UIView *moveView;

/**
 *  是否是第一次正确点击
 */
@property (nonatomic,assign) BOOL isBegin;

/**
 *  色块是否可见
 */
@property (nonatomic,assign,readonly)BOOL isCountain;

/**
 *  控制移动的.
 */
@property (nonatomic,assign) CGPoint moveToPoint;

/**
 *  色块的 x 移动距离
 */
@property (nonatomic,assign) float transformX;

/**
 *  色块的 y 移动距离
 */
@property (nonatomic,assign) float transformY;


@end

@implementation AttentionConcentrationView

-(instancetype)init{

    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
    

}

-(void)setUpInit{

    
    self.moveView = [[UIView alloc] init];
    self.moveView.height = self.moveView.width = JSFrame.size.width * .13;
    
    [self.moveView setBackgroundColor:[UIColor blueColor]];
    
    self.moveView.centerX = self.width * .5;
    
    self.moveView.centerY = self.height * .5;
    
    [self addSubview:self.moveView];

}


-(void)beginGame{
    
    [self setUpInit];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(detectionTouch:)];
    
    [self addGestureRecognizer:pan];
    
    self.moveTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(runView) userInfo:nil repeats:YES];
    
    [self runSize];

}

-(BOOL)isCountain{
    
    CGRect moveViewRect = self.moveView.frame;
    
    return CGRectContainsRect(self.bounds,moveViewRect);
}


/**
 *  transionInView 是手势在改 view 上移动的位置, 从点击开始的地方算起
 */
-(void)runView{
    
    self.moveTime += 0.01;
    
    if (self.isCountain) {
        
        self.moveView.transform = CGAffineTransformTranslate(self.moveView.transform, self.transformX,self.transformY);
        
    }else{
        
        [self runSize];
        
        self.moveView.transform = CGAffineTransformTranslate(self.moveView.transform, self.transformX,self.transformY);
    }
}

-(void)runSize{
    self.moveToPoint = [self rollOnePoint];
    float _x;
    float _y;
    
    _x = self.moveToPoint.x - self.moveView.frame.origin.x;
    _y = self.moveToPoint.y - self.moveView.frame.origin.y;
    
    if (fabsf(_x) > fabsf(_y)) {
        self.transformX = _x / fabsf(_x);
        self.transformY = _y / _x;
    }else{
        
        self.transformX = _x / _y;
        self.transformY = _y / fabsf(_y);
    }
}

-(CGPoint)rollOnePoint{
    
    CGSize viewsize = self.frame.size;
    
    int allnum = (viewsize.width + viewsize.height) * 2;
    
    float froll = arc4random()%allnum;
    
    CGRect rectn;
    /**
     *
     */
    if (froll <= viewsize.width) {
        rectn =CGRectMake(froll, 0, 45, 45);
    }else if (froll <= viewsize.width + viewsize.height) {
        rectn = CGRectMake(viewsize.width, froll-viewsize.width, 45, 45);
    }else if (froll <= viewsize.width *2 + viewsize.height){
        rectn =CGRectMake(viewsize.width *2 + viewsize.height-froll, viewsize.height, 45, 45 );
    }else{
        rectn =CGRectMake(0, allnum - froll, 45, 45);
    }
    CGPoint rollPoint = rectn.origin;
    
    return rollPoint;
}

-(void)detectionTouch:(UIPanGestureRecognizer *)pan{
    
    /**
     *  检查是否是首次开始手势 ..
     */
    
    if (!self.isBegin && [self YoNwith:pan]) {
        /**
         *  第一次点击上去了 .
         */
        self.TouchState = JSTouchStateMoveIn;
        self.isBegin = YES;
        //这里要开始计时了. 计算时间
        self.pressTimer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(runTime) userInfo:nil repeats:YES];
        
        [self setBackgroundColor:[UIColor greenColor]];
        
        return;
    }
    if ([self YoNwith:pan]&&self.TouchState == JSTouchStateMoveOut) {
        
        /**
         *  点击到了. 但是之前是没点击到的.
         */
        self.unPressTime = 0;
        
        self.TouchState = JSTouchStateMoveIn;
        
        [self.unPressTimer setFireDate:[NSDate distantFuture]];
        
        [self.pressTimer setFireDate:[NSDate distantPast]];
        
        
        [self setBackgroundColor:[UIColor greenColor]];
        
        return;
    }
    
    if (self.TouchState == JSTouchStateMoveIn && ![self YoNwith:pan]) {
        /**
         *  没按着 .之前是按好了的.
         */
        self.wrongCount ++;
        
        self.TouchState = JSTouchStateMoveOut;
        
        [self.pressTimer setFireDate:[NSDate distantFuture]];
        
        self.unPressTimer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(runUnTime) userInfo:nil repeats:YES];
        /**
         *  这里要计算时间,过了多久.
         */
        
    }
    
    if (pan.state == UIGestureRecognizerStateEnded&&self.TouchState == JSTouchStateMoveIn) {
        
        [self.pressTimer setFireDate:[NSDate distantFuture]];
        
        self.wrongCount ++;
        
        self.TouchState = JSTouchStateMoveOut;
        
        if (self.unPressTimer) {
            [self.unPressTimer setFireDate:[NSDate distantPast]];
        }else{
            self.unPressTimer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(runUnTime) userInfo:nil repeats:YES];
        }
        
        [self setBackgroundColor:[UIColor redColor]];
    }
}


-(void)runTime{
    
    self.pressTime += 0.01;
    
    NSLog(@"press = %f",self.pressTime);
    
}

-(void)runUnTime{
    
    self.unPressTime += 0.01;
    
    NSLog(@"unpress = %f",self.unPressTime);
    if (self.unPressTime > 0.3) {
        
        [self setBackgroundColor:[UIColor redColor]];
        
    }
    
}

-(BOOL)YoNwith:(UIPanGestureRecognizer *)pan{
    CGPoint location = [pan locationInView:self];
    CGRect ss = {location,{1,1}};
    BOOL isIn = CGRectIntersectsRect(ss, self.moveView.frame);
    return isIn;
}





@end
