//
//  AttentionDistributionTest.m
//  1.5-2015
//
//  Created by Mac on 16/1/26.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionDistributionTest.h"
#import <AudioToolbox/AudioToolbox.h>
#import "AttentionDistributionModel.h"
@interface AttentionDistributionTest ()

/**
 *  数据源 存放所有的测试模型, 测试什么类容 都有这个决定,  测试完的回调 也是用这个;
 */
@property (nonatomic,retain) NSMutableArray *dataArray;

/**
 *  当前测试轮数;    ---  6项测试, 每项测6次;  若果 self.current 是15 则现在显示的是数组下标是14的数据;
 */

@property (nonatomic,assign) int currentCount;

/**
 *  每项训练次数
 */

@property (nonatomic,assign) NSInteger testCount;

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


/**
 *  存放所有颜色数组
 */
@property (nonatomic,retain) NSArray *colorArray;
/**
 *  用来提示用户的图片;
 */
@property (nonatomic,retain) UIImageView *focusImageView;


/**
 *  管理行动的定时器;
 */
@property (nonatomic,retain) NSTimer *actionTimer;

@end


@implementation AttentionDistributionTest



-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        UIImage *image = [UIImage imageNamed:@"span1"];
        
        self.backgroundColor = [image imageToColor];
     
        [self setUpButton];
        
        [self setUpVoice];
        
        [self setUpImage];
    
        [self setUpTimer];
    }
    return self;
}

/**
 *  外部接口
 */

-(void)beginTest:(NSInteger)count{
    
    self.testCount = count;
    
    [self setUpDataSource];
    
    self.currentCount = 0;
    
    [[timerTool tool]fireInTheHoll:self.actionTimer];
}

/**
 *  设置定时器
 */
-(void)setUpTimer{
    self.actionTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(showImageOrVoice) userInfo:nil repeats:YES];
}


/**
 *  用来显示图片.  每次定时器要过2s 执行这个, 显示数组中第i 个数据, 但是 currentcount 此时为 i+1;
 */
-(void)showImageOrVoice{
    
    if (_currentCount >= _testCount * 6) {
        [self.actionTimer invalidate];
        
        JSLog(@"finfish");
        
        JSFunc;
        
        if ([self.delegate respondsToSelector:@selector(AttentionDistributionDidFinish:andArray:)]) {
            [self.delegate AttentionDistributionDidFinish:self andArray:self.dataArray];
        }
        
        [self.focusImageView removeFromSuperview];
        
        return;
    }

    AttentionDistributionModel *model = self.dataArray[self.currentCount];
    if (model.color) {
    self.focusImageView.hidden = NO;
        
    UIImage *image = [UIImage imageWithBgColor:model.color];
        
    UIImage *sizeImage = [image scaleSize:CGSizeMake(40, 40)];
        
    [self.focusImageView jsImage_AnimatgionRollDirctionToImage:sizeImage];
        
    }else{
    
        self.focusImageView.hidden = YES;
    
    }
    if (model.soundType == soundTypeHight) {
        AudioServicesPlayAlertSound(self.avidHight);
    }
    if (model.soundType == soundTypeMid) {
        AudioServicesPlayAlertSound(self.avidMid);
    }
    if (model.soundType == soundTypeLow) {
        AudioServicesPlayAlertSound(self.avidLow);
    }
    self.currentCount ++;
}

/**
 *  为数据源数组添加数据
 */
-(void)setUpDataSource{
    
    [self addColorRoundToArray:self.testCount];
    
    [self addSoundToArray:self.testCount];
    
    [self addRoundAndSoundToArray:self.testCount];
    
    [self addRoundAndSoundToArray:self.testCount];
    
    [self addSoundToArray:self.testCount];
    
    [self addColorRoundToArray:self.testCount];
    
}


-(NSArray *)colorArray{
 
    if (!_colorArray) {
        self.colorArray = [NSArray arrayWithObjects:JSColor(6, 128, 67),JSColor(62, 188, 202),JSColor(89, 61, 67), nil];
    }
    return _colorArray;
}
/**
 *  单独颜色圆 添加模型的方法
 */
-(void)addColorRoundToArray:(NSInteger)count{

    for (int i = 0 ; i < count; i ++) {
        
        int randomNum = arc4random()%3;
        
        switch (randomNum) {
            case 0:
                [self.dataArray addObject:[AttentionDistributionModel modelWithType:soundTypeLow andColor:nil]];
                break;
            case 1:
                [self.dataArray addObject:[AttentionDistributionModel modelWithType:soundTypeMid andColor:nil]];
                break;
            case 2:
                [self.dataArray addObject:[AttentionDistributionModel modelWithType:soundTypeHight andColor:nil]];
                break;
            default:
                break;
        }
    }
}

/**
 *  单独声音 添加模型的方法
 */
-(void)addSoundToArray:(NSInteger)count{
    for (int i = 0 ; i < count; i ++) {
        
        int randomNum = arc4random()%3;
        
        [self.dataArray addObject:[AttentionDistributionModel modelWithType:soundtypeNone andColor:self.colorArray[randomNum]]];
        
    }
    
}

/**
 *  颜色圆加声音 添加模型的方法
 */
-(void)addRoundAndSoundToArray:(NSInteger)count{
    
    for (int i = 0 ; i < count; i ++) {
        int randSoundNum = arc4random()%3;
        int randColorNum = arc4random()%3;
        
        switch (randSoundNum) {
            case 0:
                [self.dataArray addObject:[AttentionDistributionModel modelWithType:soundTypeLow andColor:self.colorArray[randColorNum]]];
                break;
            case 1:
                [self.dataArray addObject:[AttentionDistributionModel modelWithType:soundTypeMid andColor:self.colorArray[randColorNum]]];
                break;
            case 2:
                [self.dataArray addObject:[AttentionDistributionModel modelWithType:soundTypeHight andColor:self.colorArray[randColorNum]]];
                break;
            default:
                break;
        }
    }
}

/**
 *  设置图片 属性设置
 */
-(void)setUpImage{
    UIImageView *imageview = [[UIImageView alloc] init];
    
    imageview.width = imageview.height = self.height * .3;
    
    imageview.centerX = self.centerX;
    
    imageview.centerY = self.height *.3;
    
    imageview.layer.cornerRadius = imageview.width * .5;
    
    imageview.layer.masksToBounds = YES;
    
    [self addSubview:imageview];
    
    self.focusImageView = imageview;
}



/**
 *  设置按钮
 */
-(void)setUpButton{
    
    self.hightSoundButton = ({
        self.hightSoundButton = [UIButton buttonWithColor:JSColor(254, 67, 101)
                                               target:self
                                               action:@selector(runSound:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@"♪♪♪"
                                           titleColor:JSColor(222, 211, 140)
                                               whsize:self.height * .1];
        
        /**
         *  给位置;
         */
        
        self.hightSoundButton.width = self.hightSoundButton.height = self.height * 0.1;
        
        self.hightSoundButton.centerX = self.width *.25;
        
        self.hightSoundButton.centerY = self.height * .5;
        
        

        
        [self addSubview:self.hightSoundButton];
        
        self.hightSoundButton;
    });
    
    self.midSoundButton = ({
        self.midSoundButton = [UIButton buttonWithColor:JSColor(131, 175, 155)
                                               target:self
                                               action:@selector(runSound:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@"♪♪"
                                             titleColor:JSColor(222, 211, 140)
                                                 whsize:self.height * .1];
        
        /**
         *  给位置;
         */
        
        self.midSoundButton.centerX = self.width *.25;
        
        self.midSoundButton.centerY = self.height * .68;
        
        
        [self addSubview:self.midSoundButton];
        
        self.midSoundButton;
    });
    
    self.lowSoundButton = ({
        self.lowSoundButton = [UIButton buttonWithColor:JSColor(118, 77, 57)
                                               target:self
                                               action:@selector(runSound:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@"♪"
                                           titleColor:JSColor(222, 211, 140)
                                               whsize:self.height * .1];
        
        /**
         *  给位置;
         */
        self.lowSoundButton.centerX = self.width *.25;
        
        self.lowSoundButton.centerY = self.height * .86;
        
        [self addSubview:self.lowSoundButton];
        
        self.lowSoundButton;
    });
    
    self.redRoundButton = ({
        self.redRoundButton = [UIButton buttonWithColor:JSColor(6, 128, 67)
                                               target:self
                                               action:@selector(runColor:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@""
                                             titleColor:JSColor(222, 211, 140)
                                                 whsize:self.height * .1];
        
        /**
         *  给位置;
         */
        self.redRoundButton.centerX = self.width *.75;
        
        self.redRoundButton.centerY = self.height * .5;
        
        [self addSubview:self.redRoundButton];
        
        self.redRoundButton;
    });
    
    self.greenRoundButton = ({
        self.greenRoundButton = [UIButton buttonWithColor:JSColor(62, 188, 202)
                                               target:self
                                               action:@selector(runColor:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@""
                                               titleColor:JSColor(222, 211, 140)
                                                   whsize:self.height * .1];
        
        /**
         *  给位置;
         */
        self.greenRoundButton.centerX = self.width *.75;
        
        self.greenRoundButton.centerY = self.height * .68;
        
        [self addSubview:self.greenRoundButton];
        
        self.greenRoundButton;
    });
    
    self.blueRoundButton = ({
        self.blueRoundButton = [UIButton buttonWithColor:JSColor(89, 61, 67)
                                               target:self
                                              action:@selector(runColor:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:[UIImage imageNamed:@"1"]
                                          selectImage:[UIImage imageNamed:@"2"]
                                       titleForNoraml:@""
                                              titleColor:JSColor(222, 211, 140)
                                                  whsize:self.height * .1];
        
        /**
         *  给位置;
         */
        self.blueRoundButton.centerX = self.width *.75;
        
        self.blueRoundButton.centerY = self.height * .86;
        
        [self addSubview:self.blueRoundButton];
        
        self.blueRoundButton;
    });
    
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
    
    if (self.currentCount >= 1) {
        
        AttentionDistributionModel *model = self.dataArray[self.currentCount - 1];
        
        if ([sender isEqual:self.hightSoundButton]) {
            model.selectedSound = soundTypeHight;
        }
        if ([sender isEqual:self.lowSoundButton]) {
            model.selectedSound = soundTypeLow;
        }
        if ([sender isEqual:self.midSoundButton]) {
            model.selectedSound = soundTypeMid;
        }
    }
    else{
        [MBProgressHUD showError:@"还未显示"];
        
    }

    
}

-(void)runColor:(UIButton *)sender{
    if (self.currentCount >= 1) {
        
        AttentionDistributionModel *model = self.dataArray[self.currentCount - 1];
        model.selectedColor = sender.backgroundColor;
        
    }
    else{
        [MBProgressHUD showError:@"还未显示"];
    
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
