//
//  ChoseTestTypeController.m
//  1.5-2015
//
//  Created by Mac on 16/1/8.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "ChoseTestTypeController.h"

#import "AttentionSpanContoller.h"

#import "AttentionTransferController.h"

#import "AttentionTransferSideController.h"

#import "AttensionTranSideDiffController.h"

#import "ErrorProofingTestController.h"

#import "PictureAndPointController.h"

@interface ChoseTestTypeController ()

@property (nonatomic,retain) UIButton *attSpanButton;

@property (nonatomic,retain) UIButton *attTransButton;

@property (nonatomic,retain) UIButton *attTranSideButton;

@property (nonatomic,retain) UIButton *attRranSideDiffButton;

@property (nonatomic,retain) UIButton *errProButton; 

@property (nonatomic,retain) UIButton *picAndPoinButton;


@end

@implementation ChoseTestTypeController

-(void)viewDidLoad{

    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self setUpMainButton];
}

-(void)setUpMainButton{
    
    self.attSpanButton = [self buttonWithTarget:self action:@selector(attSpan:) title:@"视听觉测试" forControlEvents: UIControlEventTouchUpInside];
    self.attSpanButton.y = self.view.height * .2;
    
    
    
    self.attTransButton = [self buttonWithTarget:self action:@selector(attTrans:) title:@"看图画图测试" forControlEvents: UIControlEventTouchUpInside];
    self.attTransButton.y = self.view.height * .3;
    
    
    self.attTranSideButton = [self buttonWithTarget:self action:@selector(attTranSide:) title:@"两边测试" forControlEvents: UIControlEventTouchUpInside];
    self.attTranSideButton.y = self.view.height * .4;
    
    
    self.attRranSideDiffButton = [self buttonWithTarget:self action:@selector(attRranSideDiff:) title:@"找相同图测试" forControlEvents: UIControlEventTouchUpInside];
    self.attRranSideDiffButton.y = self.view.height * .5;
    
    
    self.errProButton = [self buttonWithTarget:self action:@selector(errPro:) title:@"语音找错测试" forControlEvents: UIControlEventTouchUpInside];
    self.errProButton.y = self.view.height * .6;
    
    
    self.picAndPoinButton = [self buttonWithTarget:self action:@selector(picAndPoin:) title:@"数点测试" forControlEvents: UIControlEventTouchUpInside];
    self.picAndPoinButton.y = self.view.height * .7;
    
    
 
    

    
}

-(UIButton *)buttonWithTarget:(nullable id)target action:(SEL)action title:(NSString*)title forControlEvents:(UIControlEvents)controlEvents{

    UIButton *button = [[UIButton alloc]init];
    
    [button setBackgroundColor:JSCOLOR];
    
    button.titleLabel.font = JSFont(25);
    
    [button setTitle:title forState:UIControlStateNormal];
    
    button.height = JSFrame.size.height * .08;
    
    button.width = JSFrame.size.width * .6 ;
    
    button.centerX = self.view.centerX;
    
    button.layer.cornerRadius = 14;
    
    button.clipsToBounds = YES;
    
    [button addTarget:target action:action forControlEvents:controlEvents];
    
    [self.view addSubview:button];
    
    return  button;
}


-(void)attSpan:(UIButton *)sender{
    
    AttentionSpanContoller *asc = [[AttentionSpanContoller alloc] init];
    
    [self.navigationController pushViewController:asc animated:YES];

}
-(void)attTrans:(UIButton *)sender{
    
    AttentionTransferController *atc = [[AttentionTransferController alloc] init];
    
    [self.navigationController pushViewController:atc animated:YES];

}

-(void)attTranSide:(UIButton *)sender{

    AttentionTransferSideController *atsc = [[AttentionTransferSideController alloc] init];
    
    [self.navigationController pushViewController:atsc animated:YES];
    
}

-(void)attRranSideDiff:(UIButton *)sender{

    AttensionTranSideDiffController *diff = [[AttensionTranSideDiffController alloc] init];
    
    [self.navigationController pushViewController:diff animated:YES];

}

-(void)errPro:(UIButton *)sender{
    ErrorProofingTestController *ept = [[ErrorProofingTestController alloc] init];
    
    [self.navigationController pushViewController:ept animated:YES];
}

-(void)picAndPoin:(UIButton *)sender{

    PictureAndPointController *ppc = [[PictureAndPointController alloc] init];
    
    [self.navigationController pushViewController:ppc animated:YES];\
}

@end
