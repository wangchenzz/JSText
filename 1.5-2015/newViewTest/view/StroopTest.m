//
//  StroopTest.m
//  1.5-2015
//
//  Created by Mac on 16/2/1.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "StroopTest.h"

@interface StroopTest ()


@property (nonatomic,retain) UIButton *yellowButton;

@property (nonatomic,retain) UIButton *blueButton;

@property (nonatomic,retain) UIButton *redButton;

@property (nonatomic,retain) UIButton *greenButton;


/**
 *  存放测试数据的数组
 */
@property (nonatomic,retain) NSArray *colorArray;
@property (nonatomic,retain) NSArray *rightTextArray;
@property (nonatomic,retain) NSArray *wrongTextArray;
@property (nonatomic,retain) NSArray *rufTextArray;

@end

@implementation StroopTest

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage *imaeg =[UIImage imageNamed:@"span1"];
        
        UIColor *color = [imaeg imageToColor];
        
        self.backgroundColor = color;

        [self setUpButton];
    }
    return self;
}

/**
 *  设置四种颜色按钮
 */
-(void)setUpButton{
    
    self.yellowButton = ({
    
        self.yellowButton = [UIButton buttonWithColor:[UIColor yellowColor]
                                               target:self action:@selector(boolValue)
                                     forControlEvents:UIControlEventTouchUpInside
                                       imageForNormal:nil
                                          selectImage:nil
                                       titleForNoraml:nil
                                           titleColor:nil
                                               whsize:self.height * .1];
        
        
        self.yellowButton.centerX = self.width * .3;
        
        self.yellowButton.centerY = self.height * .85;
        
        [self addSubview:self.yellowButton];
        
        self.yellowButton;
    });
    
    self.redButton = ({
        
        self.redButton = [UIButton buttonWithColor:[UIColor redColor]
                                            target:self
                                            action:@selector(boolValue)
                                  forControlEvents:UIControlEventTouchUpInside
                                    imageForNormal:nil
                                       selectImage:nil
                                    titleForNoraml:nil
                                        titleColor:nil
                                            whsize:self.height * .1];
        
        self.redButton.centerX = self.width * .7;
        
        self.redButton.centerY = self.height * .85;
        
        [self addSubview:self.redButton];
        
        self.redButton;
    });
    
    
    self.greenButton = ({
        
        self.greenButton = [UIButton buttonWithColor:[UIColor greenColor]
                                              target:self
                                              action:@selector(boolValue)
                                    forControlEvents:UIControlEventTouchUpInside
                                      imageForNormal:nil
                                         selectImage:nil
                                      titleForNoraml:nil
                                          titleColor:nil
                                              whsize:self.height * .1];
        
        
        self.greenButton.centerX = self.width * .3;
        
        self.greenButton.centerY = self.height * .65;
        
        [self addSubview:self.greenButton];
        
        self.greenButton;
    });
    
    self.blueButton = ({
        
        self.blueButton = [UIButton buttonWithColor:[UIColor blueColor]
                                             target:self
                                             action:@selector(boolValue)
                                   forControlEvents:UIControlEventTouchUpInside
                                     imageForNormal:nil
                                        selectImage:nil
                                     titleForNoraml:nil
                                         titleColor:nil
                                             whsize:self.height * .1];
        
        self.blueButton.centerX = self.width * .7;
        
        self.blueButton.centerY = self.height * .65;
        
        [self addSubview:self.blueButton];
        
        self.blueButton;
    });
}


-(NSArray *)colorArray{

    if (!_colorArray) {
        self.colorArray = @[JSColor(1, 1, 1),JSColor(3, 3, 3),JSColor(123, 32, 45)];
    }
    return _colorArray;
}

-(NSArray *)rightTextArray{
    if (!_rightTextArray) {
        self.rightTextArray = @[@"红",@"蓝",@"黄",@"绿"];
    }
    return _rightTextArray;
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




@end
