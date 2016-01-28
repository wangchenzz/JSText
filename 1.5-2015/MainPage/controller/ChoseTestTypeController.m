//
//  ChoseTestTypeController.m
//  1.5-2015
//
//  Created by Mac on 16/1/8.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "ChoseTestTypeController.h"

@interface ChoseTestTypeController ()

@property (nonatomic,weak) UIButton *testButon;

@property (nonatomic,weak) UIButton *trainButon;

@end

@implementation ChoseTestTypeController

-(void)viewDidLoad{

    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self setUpMainButton];
}

-(void)setUpMainButton{
    
    self.testButon = [self buttonWithTarget:self action:@selector(beganTest:) title:@"测试" forControlEvents: UIControlEventTouchUpInside];
    
    self.testButon.centerX = self.view.centerX;
    
    self.testButon.y = self.view.height * .2;

    
}

-(UIButton *)buttonWithTarget:(nullable id)target action:(SEL)action title:(NSString*)title forControlEvents:(UIControlEvents)controlEvents{

    UIButton *button = [[UIButton alloc]init];
    
    [button setBackgroundColor:JSCOLOR];
    
    button.titleLabel.font = JSFont(25);
    
    [button setTitle:title forState:UIControlStateNormal];
    
    button.height = JSFrame.size.height * .08;
    
    button.width = JSFrame.size.width * .6 ;
    
    button.layer.cornerRadius = 14;
    
    button.clipsToBounds = YES;
    
    [button addTarget:target action:action forControlEvents:controlEvents];
    
    [self.view addSubview:button];
    
    return  button;
}


-(void)beganTrain:(UIButton *)sender{
    

}
-(void)beganTest:(UIButton *)sender{
    

}

@end
