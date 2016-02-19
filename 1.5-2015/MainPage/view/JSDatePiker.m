//
//  JSDatePiker.m
//  1.5-2015
//
//  Created by Mac on 16/1/7.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "JSDatePiker.h"


@interface JSDatePiker ()

@property (nonatomic,weak) UIButton *sureButton;

@property (nonatomic,weak) UIDatePicker *datePiker;

@property (nonatomic,weak) UILabel *titleLabel;

@end

@implementation JSDatePiker

+(instancetype)piker{

    return [[self alloc] init];
    
}

-(UIButton *)sureButton{
    
    if (!_sureButton) {

    UIButton *button = [[UIButton alloc]init];
    
    [button setTitle:@"确定" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    [self addSubview:button];
        
   [button addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
        
    self.sureButton = button;
        
    }
    return _sureButton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIDatePicker *dated = [[UIDatePicker alloc]init];
        
        [self addSubview:dated];
        
        self.datePiker = dated;
        
        [self.datePiker setDatePickerMode:UIDatePickerModeDate];
        
        self.datePiker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
        
        UILabel *titlelabel = [[UILabel alloc]init];
        
        
        [titlelabel setText:@"请认真填写出生日期，将会影响后续测试。"];
        
        [self addSubview:titlelabel];
        
        [titlelabel setNumberOfLines:0];
        
        [titlelabel setFont:JSFont(15)];
        
        
        [titlelabel setTextColor:JSColor(184, 184, 192)];
        
        self.titleLabel = titlelabel;
        
    }
    return self;
}

-(void)setFrame:(CGRect)frame{

    [super setFrame:frame];
    
    [self.datePiker setFrame:CGRectMake(0, 30, frame.size.width, frame.size.height-30)];
    
    [self.sureButton setFrame:CGRectMake(self.frame.size.width-100, 0, 100, 30)];
    
    [self.titleLabel setFrame:CGRectMake(0, 0, self.frame.size.width - 100, 30)];

}

-(void)sure{

    if ([self.delegate respondsToSelector:@selector(JSDatePikerDidSelectSure:)]) {
        [self.delegate JSDatePikerDidSelectSure:self.datePiker];
    }
}

-(void)dealloc{

    JSLog(@"JSDatePiker - dealloc");

}


@end
