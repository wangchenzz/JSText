//
//  MainViewController.m
//  1.5-2015
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "MainViewController.h"

#import "wordTestObj.h"

#import "ClickTest.h"

@interface MainViewController ()<wordTestObjDelegate,ClikTestDelegate>

@property (nonatomic,strong) wordTestObj*objc;

@property (nonatomic,strong) ClickTest *cl;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setUpWordsTest];
    
    
}

-(void)setUpWordsTest{
    
    wordTestObj *words = [wordTestObj test];

    self.objc = words;
    
    self.objc.delegate = self;
    
    [words setUpFirst:self];

}

-(void)setUpClickTest{

    ClickTest *clik = [[ClickTest alloc]initWithController:self];
    
    clik.delegate = self;
    
    self.cl = clik;
    
    [self.cl beganTest];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -wordTestDelegate

-(void)wordDidFinishTest:(wordTestObj *)wordobj{

    JSLog(@"finfshtest in the controller");
    
    self.objc = nil;
    
}

#pragma mark -clickTestDelegate
-(void)clickTestDidFinish:(ClickTest *)test{

    self.cl = nil;

}



@end
