//
//  AttentionDistributionTest.m
//  1.5-2015
//
//  Created by Mac on 16/1/26.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionDistributionTest.h"
#import <AudioToolbox/AudioToolbox.h>
@interface AttentionDistributionTest ()

/**
 *  数据源
 */
@property (nonatomic,retain) NSMutableArray *dataArray;

/**
 *  当前测试轮数;    ---  6项测试, 每项测6次;
 */
@property (nonatomic,assign) NSInteger *currentCount;

/**
 *  时间
 */
@property (nonatomic,assign) NSInteger timeCount;

/**
 *UIButton控件
 */
@property (nonatomic,retain) UIButton *hightSoundButton;
@property (nonatomic,retain) UIButton *midSoundButton;
@property (nonatomic,retain) UIButton *lowSoundButton;
@property (nonatomic,retain) UIButton *redRoundButton;
@property (nonatomic,retain) UIButton *greenRoundButton;
@property (nonatomic,retain) UIButton *blueRoundButton;

/**
 *  三段录音
 */
@property (nonatomic,assign) SystemSoundID avidHight;
@property (nonatomic,assign) SystemSoundID avidMid;
@property (nonatomic,assign) SystemSoundID avidLow;


@end


@implementation AttentionDistributionTest



-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        UIImage *image = [UIImage imageNamed:@"span1"];
        
        self.backgroundColor = [image colorForImage];
     
        [self setUpButton];
        
        [self setUpVoice];
    }
    return self;
}

/**
 *  外部接口
 */

-(void)beginTest:(NSInteger)count{

    
    
}

-(void)setUpButton{
    
    self.hightSoundButton = ({
        self.hightSoundButton = [self buttonWithColor:JSColor(254, 67, 101)
                                               target:self
                                               action:@selector(runSound:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@"♪♪♪"
                                           titleColor:JSColor(222, 211, 140)];
        
        /**
         *  给位置;
         */
        self.hightSoundButton.centerX = self.width *.25;
        
        self.hightSoundButton.centerY = self.height * .5;
        
        self.hightSoundButton;
    });
    
    self.midSoundButton = ({
        self.midSoundButton = [self buttonWithColor:JSColor(131, 175, 155)
                                               target:self
                                               action:@selector(runSound:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@"♪♪"
                                           titleColor:JSColor(222, 211, 140)];
        
        /**
         *  给位置;
         */
        self.midSoundButton.centerX = self.width *.25;
        
        self.midSoundButton.centerY = self.height * .68;
        
        self.midSoundButton;
    });
    
    self.lowSoundButton = ({
        self.lowSoundButton = [self buttonWithColor:JSColor(118, 77, 57)
                                               target:self
                                               action:@selector(runSound:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@"♪"
                                           titleColor:JSColor(222, 211, 140)];
        
        /**
         *  给位置;
         */
        self.lowSoundButton.centerX = self.width *.25;
        
        self.lowSoundButton.centerY = self.height * .86;
        
        self.lowSoundButton;
    });
    
    self.redRoundButton = ({
        self.redRoundButton = [self buttonWithColor:JSColor(6, 128, 67)
                                               target:self
                                               action:@selector(bundle)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@""
                                           titleColor:JSColor(222, 211, 140)];
        
        /**
         *  给位置;
         */
        self.redRoundButton.centerX = self.width *.75;
        
        self.redRoundButton.centerY = self.height * .5;
        
        self.redRoundButton;
    });
    
    self.greenRoundButton = ({
        self.greenRoundButton = [self buttonWithColor:JSColor(62, 188, 202)
                                               target:self
                                               action:@selector(bundle)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@""
                                           titleColor:JSColor(222, 211, 140)];
        
        /**
         *  给位置;
         */
        self.greenRoundButton.centerX = self.width *.75;
        
        self.greenRoundButton.centerY = self.height * .68;
        
        self.greenRoundButton;
    });
    
    self.blueRoundButton = ({
        self.blueRoundButton = [self buttonWithColor:JSColor(89, 61, 67)
                                               target:self
                                               action:@selector(bundle)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@""
                                           titleColor:JSColor(222, 211, 140)];
        
        /**
         *  给位置;
         */
        self.blueRoundButton.centerX = self.width *.75;
        
        self.blueRoundButton.centerY = self.height * .86;
        
        self.blueRoundButton;
    });
}

/**
 *  代码简化
 *
 *  @param color         背景颜色
 *  @param target        target
 *  @param action        方法
 *  @param controlEvents 状态
 *  @param normalImage   普通状态下的图片
 *  @param highlighImage 高亮状态下的图片
 *  @param title         标题
 *  @param titlecolor    标题颜色
 *
 *  @return 按钮
 */
-(UIButton *)buttonWithColor:(UIColor*)color target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents imageForNormal:(UIImage *)normalImage selectImage:(UIImage *)highlighImage titleForNoraml:(NSString *)title titleColor:(UIColor*)titlecolor{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.showsTouchWhenHighlighted = YES;
    
    button.backgroundColor = color;
    
    [button addTarget:target action:action forControlEvents:controlEvents];
    
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    [button setBackgroundImage:highlighImage forState:UIControlStateHighlighted];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:titlecolor forState:UIControlStateNormal];
    
    [button.titleLabel setFont:JSFont(33)];
    
    [button.titleLabel sizeToFit];
    
    button.height = button.width = self.height * .1;
    
    button.layer.cornerRadius = button.width *.5;
    
    button.layer.masksToBounds = YES;
    
    [self addSubview:button];
    
    return button;
}


/**
 *  准备好语音;
 */
-(void)setUpVoice{
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avidHight);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"2.caf"]), &_avidMid);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"3.caf"]), &_avidLow);
}

/**
 *  获得 url
 *
 *  @param filename  文件名
 *
 *  @return 路径的 URL
 */
-(NSURL *)regsoundForFile:(NSString*)filename{
    NSString *path = [[NSBundle mainBundle]resourcePath];
    path = [path stringByAppendingPathComponent:filename];
    NSURL *url = [NSURL fileURLWithPath:path];
    return url;
}

/**
 *  音乐按钮的点击事件
 *
 *  @param sender 按钮参数
 */
-(void)runSound:(UIButton *)sender{

    if ([sender isEqual:self.hightSoundButton]) {
        AudioServicesPlayAlertSound(self.avidHight);
    }
    if ([sender isEqual:self.lowSoundButton]) {
        AudioServicesPlayAlertSound(self.avidLow);
    }
    if ([sender isEqual:self.midSoundButton]) {
        AudioServicesPlayAlertSound(self.avidMid);
    }
}

/**
 *  数据源数组懒加载
 *
 *  @return 数组的 get 方法a
 */
-(NSMutableArray *)dataArray{

    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
