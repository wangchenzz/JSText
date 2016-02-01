
//
//  PictureAndPointTest.m
//  1.5-2015
//
//  Created by Mac on 16/1/22.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "PictureAndPointTest.h"

#import "pointView.h"

@interface PictureAndPointTest ()<UITextFieldDelegate>

/**
 *  数据源数组;
 */
@property (nonatomic,retain) NSMutableArray *dataSourceArray;

/**
 *  画圆点的 view
 */
@property (nonatomic,retain) pointView *pointView;

/**
 *  装图片名字的数组;
 */
@property (nonatomic,retain) NSMutableArray *imageNameArray;

/**
 *  计时用得定时器
 */
@property (nonatomic,retain) NSTimer *timeTimer;


/**
 *  当前测试的次数
 */

@property (nonatomic,assign) NSInteger currentCount;

/**
 *  记录所用时间
 */

@property (nonatomic,assign) float timeCount;

@end

@implementation PictureAndPointTest

-(instancetype)initWithFrame:(CGRect)frame{
 
    if (self = [super initWithFrame:frame]) {
        [self setUpUi];
        self.timeCount = 0;
        
        UIImage *imgae = [UIImage imageNamed:@"span1"];
        
        UIColor *color = [imgae imageToColor];
        
        self.backgroundColor = color;
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyBord)];
    
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

-(void)hideKeyBord{

    [self endEditing:YES];
    
}

/**
 *  外部接口 用来开始测试 并决定测试次数;
 *
 *  @param count 测试次数
 */
-(void)beginTestForCount:(NSInteger)count{

    self.testCount = count;
    
    [self showImage];
    
    [self showTextFiled];
    
  //  [self showTextFiled];
}

/**
 *  图片名字数组的 get 方法;
 *
 *  @return 数组
 */
-(NSMutableArray *)imageNameArray{

    if (!_imageNameArray) {
        /**
         *  这里以后可能使用 url 或者网络请求下来的名字;
         */
        self.imageNameArray = [NSMutableArray arrayWithObjects:@"span2",@"span3",@"span4",@"span5", nil];
    }
    return _imageNameArray;
}

-(NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        self.dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}

/**
 *  testCount 的 set 方法
 *
 *  @param testCount 在这里设置测试次数和内容
 */
-(void)setTestCount:(NSInteger)testCount{
    _testCount = testCount;
    
    for (int i = 0 ; i < testCount; i ++) {
        NSString *imagename = self.imageNameArray[arc4random()%(self.imageNameArray.count)];
        NSInteger pointCount = arc4random()%13 + 3;
        
        PictureAndPointModel *model = [[PictureAndPointModel alloc]initWithImageName:imagename andWithPointCount:pointCount];
    
        [self.dataSourceArray addObject:model];
    }
}

/**
 *  初始化 ui 控件 和定时器;
 */
-(void)setUpUi{

    self.sureButton = ({
        
        self.sureButton = [[UIButton alloc]init];
        
        [self.sureButton addTarget:self action:@selector(clickSure) forControlEvents:UIControlEventTouchUpInside];
        
        [self.sureButton setBackgroundColor:JSCOLOR];
        
        [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
        
        [self addSubview:self.sureButton];
        
        self.sureButton;
    });
   
    self.answerTextFile = ({
        self.answerTextFile = [[UITextField alloc]init];
        
        self.answerTextFile.backgroundColor = JSCOLOR;
        
        self.answerTextFile.placeholder = @"在次输入看到的黑点数目";
        
        self.answerTextFile.borderStyle=UITextBorderStyleRoundedRect;
        self.answerTextFile.delegate = self;
        self.answerTextFile.returnKeyType =UIReturnKeyDone;
        
        self.answerTextFile.textAlignment = NSTextAlignmentCenter;
        
        
        [self addSubview:self.answerTextFile];
        
        self.answerTextFile;
    });
    
    self.pointView = ({
        self.pointView = [[pointView alloc]init];
        
        [self.pointView setBackgroundColor:[UIColor clearColor]];
        
        self.pointView;
        
    });

    
    self.focusImageView = [[UIImageView alloc]init];
    
    [self.focusImageView addSubview:self.pointView];
    
    
    [self addSubview:self.focusImageView];
}

/**
 *  点击了确认按钮;
 */

-(void)clickSure{
    
    [self hideKeyBord];
    
    if (self.answerTextFile.text.length == 0) {
        return;
    }
    

    
    PictureAndPointModel *model = self.dataSourceArray[self.currentCount];
    
    model.selectedCount = [self.answerTextFile.text intValue];
    
    if (self.currentCount == self.dataSourceArray.count - 1) {
        /**
         *  在这里点击的时候,所有图片都放完了. 所以 currentcount 不在添加,也不在展示图片;  这里还需要在做一些操作用来表示完成测试了.
         */
        
//        self.currentCount = 0;
        
        
        return;
    }
    
    self.currentCount ++;
    
    [self showImage];

}

-(NSTimer *)timeTimer{

    if (!_timeTimer) {

            self.timeTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(calculateTimeAndAction:) userInfo:nil repeats:YES];
    }
    return _timeTimer;
}

/**
 *  计时器的事件响应
 *
 *  @param timer 计时器 实例参数
 */
-(void)calculateTimeAndAction:(NSTimer*)timer{

    self.timeCount = self.timeCount + 0.01;

    if (self.timeCount >= 2.5) {
        [self.timeTimer invalidate];
        self.timeTimer = nil;
        self.timeCount = 0;
        
        self.focusImageView.hidden = YES;
        
      //  [self showTextFiled];
    }
}

/**
 *  显示图片
 */
-(void)showImage{
    
//    [self endEditing:YES];
    
    self.answerTextFile.text = nil;
    
    timerTool *tool = [timerTool tool];
    
    [tool fireInTheHoll:self.timeTimer];
    
    [self.focusImageView setHidden:NO];

    self.focusImageView.width = self.width *.92;
    
    self.focusImageView.height = self.height * .5;
    
    self.focusImageView.centerX = self.centerX;
    
    self.focusImageView.y = 110;
    
    self.pointView.frame = self.focusImageView.bounds;
    
    
    PictureAndPointModel *model = self.dataSourceArray[self.currentCount];
    
    self.pointView.drawCount = model.pointCount;
    
    
    [self.focusImageView setImage:[UIImage imageNamed:model.imageName]];

}

/**
 *  显示键盘?  是否需要这一步骤. .   还是直接显示出来, 直接显示会造成误操作..
 */


-(void)showTextFiled
{
    
//    self.focusImageView.hidden = YES;

    self.answerTextFile.height = 50;
    
    self.answerTextFile.width = 211;

    self.answerTextFile.centerX = self.centerX;
    
    self.answerTextFile.centerY = self.height*.30;
    
    self.sureButton.height = 50;
    
    self.sureButton.width = 211;
    
    self.sureButton.centerX = self.centerX;
    
    self.sureButton.centerY = self.height*.52;
    
    self.sureButton.layer.cornerRadius = 4;
    
}


#pragma mark - textfield Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}

/**
 *  代理
 *
 *  @param textField  textField
 *  @param range     changdu
 *  @param string     将要输入的字段
 *
 *  @return 是否允许
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    NSString*currentext = textField.text;
    
    int a = [string intValue];
    
    if (a==0&&currentext.length!=0) {
        return YES;
    }
    
    if (!a&&string.length!=0) {
        return NO;
    }
    
    if(currentext.length +string.length > 2){
      return NO;
      }else{
      return  YES;
    }
}

@end
