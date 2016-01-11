
//
//  wordTestObj.m
//  1.5-2015
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "wordTestObj.h"

@interface wordTestObj ()

@property (nonatomic,retain) NSArray *WordsAry;

@property (nonatomic,retain) NSArray *NewWordsAry;

@property (nonatomic,weak) UILabel *wordsLabel;

@property (nonatomic,assign) NSInteger personCount;

@property (nonatomic,weak) UIViewController *controller;

@end

@implementation wordTestObj


+(instancetype)test{

    return [[self alloc]init];

}

-(NSArray *)WordsAry{
    
    if (!_WordsAry) {
        self.WordsAry = @[@"香蕉",@"苹果",@"家",@"大海",@"巢穴",@"汽车",@"爸爸",@"杯子"];
    }
    return _WordsAry;
}

-(NSArray *)NewWordsAry{
    
    if (!_NewWordsAry) {
        self.NewWordsAry = @[@"香蕉",@"小孩子",@"太阳",@"电灯",@"苹果",@"玻璃",@"家",@"手机",@"大海",@"巢穴",@"本子",@"空调",@"汽车",@"爸爸",@"铅笔",@"老师",@"杯子"];
    }
    
    return _NewWordsAry;
    
}

//初次进入的提示，和开始播放单词的手势
-(void)setUpFirst:(UIViewController*)controller{
    
    self.controller = controller;
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = @"接下来要播放一系列的单词，每个单词会出现2秒后消失。准备开始请点击屏幕";
    
    label.numberOfLines = 0;
    
    [label setFrame:CGRectMake(50, 200, 300, 200)];
    
    label.font = JSFont(22);
    
    [self.controller.view addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickToBegin:)];
    
    [self.controller.view addGestureRecognizer:tap];
    
}

//开始播放的手势。去除了该手势 。增加定时器 播放单词；
-(void)clickToBegin:(UITapGestureRecognizer*)tap{
    
    // JSLog(@"%@",[self.view subviews]);
    
    UIView *view = [[self.controller.view subviews]firstObject];
    
    [self.controller.view removeGestureRecognizer:tap];
    
    [view removeFromSuperview];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(showMess:) userInfo:nil repeats:YES];
    
    [timer fire];
}

//定时器时间， 播放单词，播放完毕 改变label 为提示文字。 增加手势开始测试单词记忆；
-(void)showMess:(NSTimer*)timer{
    
    static NSInteger count = 0;
    
    if (count == self.WordsAry.count-1) {
        
        self.wordsLabel.text = @"播放完毕，准备好之后将开始轮播一些词语，如果这个词语是你记忆过的请点击屏幕";
        
        JSLog(@"fangwanle");
        
        
        //[self.wordsLabel removeFromSuperview];
        
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickToTestWords:)];
        
        [self.controller.view addGestureRecognizer:tap];
        
        [timer invalidate];
        
    }else{
        self.wordsLabel.text= [self.WordsAry objectAtIndex:count];
        count ++;
    }
}

//开始测试。 移除手势.增加定时器；
-(void)clickToTestWords:(UITapGestureRecognizer*)tap{
    
    //   [self.wordsLabel removeFromSuperview];
    //
    //    self.wordsLabel.text = @"稍等";
    //
    
    [self.controller.view removeGestureRecognizer:tap];
    
    UITapGestureRecognizer *tapcacu = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(caculaterYourCount:)];
    
    [self.controller.view addGestureRecognizer:tapcacu];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(testWordsShow:) userInfo:nil repeats:YES];
    
    [timer fire];
    
}

//按时现实词语
-(void)testWordsShow:(NSTimer*)timer{
    
    static NSInteger count = 0;
    
    if (count == self.NewWordsAry.count-1) {
        JSLog(@"fangwanle");
        
        //[self.wordsLabel removeFromSuperview];
        self.wordsLabel.text = [NSString stringWithFormat:@"浏览完毕，答对个数%ld",(long)self.personCount];
        
        BOOL isOk = [self.delegate respondsToSelector:@selector(wordDidFinishTest:)];
        
        
       
        if (isOk) {
            [self.delegate wordDidFinishTest:self];
            
        }
        
    
        
        [timer invalidate];
    }
    else{
        self.wordsLabel.text= [self.NewWordsAry objectAtIndex:count];
        count ++;
    }
}

//计算点击正确的次数的方法
-(void)caculaterYourCount:(UITapGestureRecognizer*)tap{
    
    static NSString *lastString;
    
    NSString *word  = self.wordsLabel.text;
    
    if ([lastString isEqual:word]) {
        return;
    }
    if ([self.WordsAry containsObject:word]) {
        
        lastString = word;
        
        self.personCount ++;
        
        JSLog(@"%ld",self.personCount);
    }
}

//提示  显示label
-(UILabel *)wordsLabel{
    
    if (!_wordsLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        
        [label setFrame:CGRectMake(JSFrame.size.width*.5-150, 200, 300, 200)];
        
        // [label setBackgroundColor:[UIColor redColor]];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = JSFont(30);
        
        [self.controller.view addSubview:label];
        
        _wordsLabel = label;
    }
    
    return _wordsLabel;
    
}

//销毁提示‘
-(void)dealloc{

    JSLog(@"i'm dealloc");

}


@end
