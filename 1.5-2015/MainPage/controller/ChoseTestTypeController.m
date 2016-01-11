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
    
    UIButton *testButton= [[UIButton alloc] init];
    
    UIButton *trainButton = [[UIButton alloc]init];
    
    [testButton setBackgroundColor:JSColor(255, 59, 70)];
    
    [trainButton setBackgroundColor:JSColor(255, 59, 70)];
    
    testButton.titleLabel.font = JSFont(25);
    
    trainButton.titleLabel.font = JSFont(25);
    
    [testButton setTitle:@"测试" forState:UIControlStateNormal];
    
    [trainButton setTitle:@"训练" forState:UIControlStateNormal];
    
    testButton.height = JSFrame.size.height * .1;
    
    testButton.width = JSFrame.size.width * .6 ;
    
    trainButton.height = JSFrame.size.height * .1;
    
    trainButton.width = JSFrame.size.width * .6 ;
    
    testButton.centerX = JSFrame.size.width * .5;
    
    testButton.y = JSFrame.size.height *.3;
    
    trainButton.centerX = JSFrame.size.width * .5;
    
    trainButton.y = JSFrame.size.height *.6;
    
    trainButton.layer.cornerRadius = 14;
    
    testButton.layer.cornerRadius = 14;
    
    trainButton.clipsToBounds = YES;
    
    testButton.clipsToBounds = YES;
    
    [trainButton addTarget:self action:@selector(beganTrain:) forControlEvents:UIControlEventTouchUpInside];
    
    [testButton addTarget:self action:@selector(beganTest:) forControlEvents:UIControlEventTouchUpInside];
    
    self.trainButon = trainButton;
    
    self.testButon = testButton;
    
    [self.view addSubview:testButton];
    
    [self.view addSubview:trainButton];

    
}

-(void)beganTrain:(UIButton *)sender{
    

}
-(void)beganTest:(UIButton *)sender{
    

}

@end
