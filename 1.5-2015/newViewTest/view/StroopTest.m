//
//  StroopTest.m
//  1.5-2015
//
//  Created by Mac on 16/2/1.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "StroopTest.h"
@interface StroopTest ()

/**
 *  存放所有测试的信息和内容
 */
@property (nonatomic,retain) NSMutableArray *dataSourseArray;

@property (nonatomic,assign) NSInteger currentCount;

@property (nonatomic,assign) float timeCount;
/**
 *  计时器
 */

@property (nonatomic,retain) NSTimer *timeTimer;

@property (nonatomic,retain) NSTimer *actionTimer;

/**
 *  显示出来的 label ;
 */
@property (nonatomic,retain) UILabel *picLabel;

/**
 *  存放测试数据的数组
 */
@property (nonatomic,retain) NSArray *totalArray;
@property (nonatomic,retain) NSArray *colorArray;
@property (nonatomic,retain) NSArray *rightTextArray;
@property (nonatomic,retain) NSArray *chaosTextArray;
@property (nonatomic,retain) NSArray *wrongTextArray;
@property (nonatomic,retain) NSArray *rufTextArray;
/**
 *  点击的按钮
 */
@property (nonatomic,retain) UIButton *yellowButton;

@property (nonatomic,retain) UIButton *blueButton;

@property (nonatomic,retain) UIButton *redButton;

@property (nonatomic,retain) UIButton *greenButton;

@end

@implementation StroopTest

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage *imaeg =[UIImage imageNamed:@"span1"];
        
        UIColor *color = [imaeg imageToColor];
        
        self.backgroundColor = color;
        
        self.totalCounts = 0;

        [self setUpButton];
        
        [self setUpPicuture];
        
        [self setUpTimer];
    }
    return self;
}

-(void)showTestWithCount:(NSInteger)count{

    self.totalCounts = count;
    [self setUpTestData];
    self.timeCount = 0;
    self.currentCount = 0;
    [[timerTool tool] fireInTheHoll:self.timeTimer];
    [[timerTool tool] fireInTheHoll:self.actionTimer];

}

-(NSMutableArray *)dataSourseArray{
    if (!_dataSourseArray) {
        self.dataSourseArray = [NSMutableArray array];
    }
    return _dataSourseArray;
}

/**
 *  设置四种颜色按钮
 */
-(void)setUpButton{
    
    self.yellowButton = ({
    
        self.yellowButton = [UIButton buttonWithColor:[UIColor yellowColor]
                                               target:self action:@selector(clickButton:)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:nil
                                          selectImage:nil
                                       titleForNoraml:nil
                                           titleColor:nil
                                               whsize:self.height * .1];
        
        [self.yellowButton setTitle:@"F" forState:UIControlStateNormal];
        
        self.yellowButton.centerX = self.width * .3;
        
        self.yellowButton.centerY = self.height * .85;
        
        [self addSubview:self.yellowButton];
        
        self.yellowButton;
    });
    
    self.redButton = ({
        
        self.redButton = [UIButton buttonWithColor:[UIColor redColor]
                                            target:self
                                            action:@selector(clickButton:)
                                  forControlEvents:UIControlEventTouchUpInside
                                    imageForNormal:nil
                                       selectImage:nil
                                    titleForNoraml:nil
                                        titleColor:nil
                                            whsize:self.height * .1];
        
        [self.redButton setTitle:@"J" forState:UIControlStateNormal];
        
        self.redButton.centerX = self.width * .7;
        
        self.redButton.centerY = self.height * .85;
        
        [self addSubview:self.redButton];
        
        self.redButton;
    });
    
    
    self.greenButton = ({
        
        self.greenButton = [UIButton buttonWithColor:[UIColor greenColor]
                                              target:self
                                              action:@selector(clickButton:)
                                    forControlEvents:UIControlEventTouchUpInside
                                      imageForNormal:nil
                                         selectImage:nil
                                      titleForNoraml:nil
                                          titleColor:nil
                                              whsize:self.height * .1];
        
        [self.greenButton setTitle:@"D" forState:UIControlStateNormal];
        
        
        self.greenButton.centerX = self.width * .3;
        
        self.greenButton.centerY = self.height * .65;
        
        [self addSubview:self.greenButton];
        
        self.greenButton;
    });
    
    self.blueButton = ({
        
        self.blueButton = [UIButton buttonWithColor:[UIColor blueColor]
                                             target:self
                                             action:@selector(clickButton:)
                                   forControlEvents:UIControlEventTouchUpInside
                                     imageForNormal:nil
                                        selectImage:nil
                                     titleForNoraml:nil
                                         titleColor:nil
                                             whsize:self.height * .1];
        
        [self.blueButton setTitle:@"K" forState:UIControlStateNormal];
        
        self.blueButton.centerX = self.width * .7;
        
        self.blueButton.centerY = self.height * .65;
        
        [self addSubview:self.blueButton];
        
        self.blueButton;
    });
}

-(void)setUpPicuture{
    
    self.picLabel = [[UILabel alloc] init];
    
    self.picLabel.height = self.picLabel.width = self.height * .1;
    
    [self.picLabel setFont:[UIFont boldSystemFontOfSize:44]];
    self.picLabel.centerX = self.centerX;
    
    self.picLabel.centerY = self.height * .35;
    
    self.picLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.picLabel setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:self.picLabel];
}

/**
 *  设置测试次数;
 */
-(void)setUpTestData{
    
    [self rollSomeTestwith];
}

-(void)setUpTimer{
    self.timeTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(calculateTime) userInfo:nil repeats:YES];
    
    self.actionTimer = [NSTimer timerWithTimeInterval:2.5 target:self selector:@selector(actionNow) userInfo:nil repeats:YES];
}

-(void)calculateTime{
    
    /**
     *  这里将时间进行递增; 可保平安即可
     */
    self.timeCount = self.timeCount + 0.01;
    
}

-(void)actionNow{


    if (self.currentCount >= self.totalCounts) {
        [self.timeTimer invalidate];
        
        [self.actionTimer invalidate];
        
        if ([self.delegate respondsToSelector:@selector(stroopTestDidFinsih:)]) {
            [self.delegate stroopTestDidFinsih:self.dataSourseArray];
        }
        /**
         *  这里测试结束;
         */
        return;
    }
    self.currentCount ++;
    [self letLabel:self.picLabel withModel:self.dataSourseArray[self.currentCount - 1]];
}


-(void)clickButton:(UIButton *)sender{
    
    if (self.currentCount <= 0) {
        [MBProgressHUD showError:@"别急~"];
        return;
    }
    
    int intTime =  (int)(self.timeCount * 100) % 200;
    
    StroopTestModel *model = self.dataSourseArray[self.currentCount-1];
    
    model.selectTime = intTime / 100.0;
    
    if ([sender isEqual:self.yellowButton]) {
        model.selectValue = StroopSelectTypeYellow;
    }
    if ([sender isEqual:self.redButton]) {
        model.selectValue = StroopSelectTypeRed;
    }
    if ([sender isEqual:self.greenButton]) {
        model.selectValue = StroopSelectTypeGreen;
    }
    if ([sender isEqual:self.blueButton]) {
        model.selectValue = StroopSelectTypeBlue;
    }

    NSLog(@"%@",self.dataSourseArray);

}

-(NSArray *)colorArray{

    if (!_colorArray) {
        self.colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor yellowColor],[UIColor greenColor]];
    }
    return _colorArray;
}

-(NSArray *)rightTextArray{
    if (!_rightTextArray) {
        self.rightTextArray = @[@"红",@"蓝",@"黄",@"绿"];
    }
    return _rightTextArray;
}

-(NSArray *)chaosTextArray{

    if (!_chaosTextArray) {
        _chaosTextArray = @[@"绿",@"黄",@"蓝",@"红"];
    }
    return _chaosTextArray;
}

-(NSArray *)wrongTextArray{
    if (!_wrongTextArray) {
        self.wrongTextArray = @[@"我",@"爱",@"中",@"华"];
    }
    return _wrongTextArray;
}

-(NSArray *)rufTextArray{
    if (!_rufTextArray) {
        self.rufTextArray = @[@"洪",@"滤",@"拦",@"皇"];
    }
    return _rufTextArray;
}

-(NSArray *)totalArray{
    if (!_totalArray) {
        
        self.totalArray = @[self.rightTextArray,self.chaosTextArray,self.wrongTextArray,self.rufTextArray];
    
    }
    return _totalArray;
}


/**
 *  如果不设置测试几次, 就将进行默认次数的测试 就是6次;
 *
 *  @param count <#count description#>
 */
-(void)rollSomeTestwith{
    
    if (!self.totalCounts) {
        self.totalCounts = 5;
    }
    for (int i = 0 ; i < _totalCounts; i ++) {
        int typenum = arc4random()%4;
        int colorNum = arc4random()%4;
        StroopTestModel *model = [[StroopTestModel alloc] init];
        model.titleString = self.totalArray[typenum][colorNum];
        model.titleColor = self.colorArray[colorNum];
        [self.dataSourseArray addObject:model];
        
    }
}

-(void)letLabel:(UILabel *)label withModel:(StroopTestModel *)model{
    
    [label jsLabel_AnimatgionRollDirctionToText:model.titleString andColor:model.titleColor];

}


@end
