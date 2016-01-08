//
//  SRTViewController.m
//  1.5-2015
//
//  Created by Mac on 16/1/7.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "SRTViewController.h"
#import "SRTview.h"

@interface SRTViewController ()<SRTviewDelegate>

@property (nonatomic,assign) float timeCount;

@property (nonatomic,strong) SRTview *srtview;

@end

@implementation SRTViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //下面的垃圾代码。。。。。
    
    
    UIButton *but = [[UIButton alloc]init];
    
    [but setFrame:CGRectMake(50,100, 50, 50)];
    
    [but setBackgroundColor:[UIColor redColor]];
    
    [but setTitle:@"low" forState:UIControlStateNormal];
    
    [but addTarget:self action:@selector(beganGame:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:but];
    
    
    UIButton *but1 = [[UIButton alloc]init];
    
    [but1 setFrame:CGRectMake(150,100, 50, 50)];
    
    [but1 setBackgroundColor:[UIColor redColor]];
    
    [but1 addTarget:self action:@selector(beganGame:) forControlEvents:UIControlEventTouchUpInside];
    [but1 setTitle:@"me" forState:UIControlStateNormal];
    
    [self.view addSubview:but1];
    

    UIButton *but2 = [[UIButton alloc]init];
    
    [but2 setFrame:CGRectMake(250,100, 50, 50)];
    
    [but2 setBackgroundColor:[UIColor redColor]];
    
    [but2 addTarget:self action:@selector(beganGame:) forControlEvents:UIControlEventTouchUpInside];
    [but2 setTitle:@"hight" forState:UIControlStateNormal];
    
    [self.view addSubview:but2];

    
}
- (void)beganGame:(UIButton *)sender {
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeGoOn:) userInfo:nil repeats:YES];
    
    if (self.srtview) {
        [self.srtview removeFromSuperview];
    }
    
    if ([sender.titleLabel.text isEqual:@"hight"]) {
        self.srtview = [[SRTview alloc]initWihtSRTtest:LevelStateHi];

    }
    if ([sender.titleLabel.text isEqual:@"me"]) {
        self.srtview = [[SRTview alloc]initWihtSRTtest:LevelStateMe];

    }
    if ([sender.titleLabel.text isEqual:@"low"]) {
        self.srtview = [[SRTview alloc]initWihtSRTtest:LevelStateLow];

    }
    
    
    self.srtview.height = 350;
    
    self.srtview.width = 350;
    
    self.srtview.centerX = JSFrame.size.width * .5;
    
    self.srtview.centerY = JSFrame.size.height * .6;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.srtview.delegate = self;
    
    [self.srtview testIn:self];
    
    [timer fire];
    
//    sender.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)timeGoOn:(NSTimer*)timer{
    
    self.timeCount  =  self.timeCount + 0.1;
    
}

-(void)SRTviewDidClickButton:(SRTview *)srtview andButton:(UIButton *)sender{
    //练习算法；
    static NSInteger rigthCount = 0;
//    static NSInteger wrongCount = 0;
    
    UIView *label = [self.view viewWithTag:1];
    if (label) {
        [label removeFromSuperview];
    }
    NSMutableArray *completeArray = [NSMutableArray arrayWithArray:srtview.dataSourceArray];
    
    if ([completeArray[rigthCount] isEqualToString:sender.titleLabel.text]) {
        rigthCount ++;
        static float clcount;
        
        NSLog(@"点击用时%.2f",self.timeCount - clcount);
        
        sender.enabled = NO;
        
        clcount = self.timeCount;
    }else{
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(150, 150, 100, 100)];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = JSFont(50);
        
        
        label.text = [completeArray objectAtIndex:rigthCount];
        
        [self.view addSubview:label];
        
        [label setTag:1];
    }
}

@end
