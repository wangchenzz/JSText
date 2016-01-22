
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
@property (nonatomic,retain) UIView *pointView;

/**
 *  装图片名字的数组;
 */
@property (nonatomic,retain) NSMutableArray *imageNameArray;

/**
 *  计时用得定时器
 */
@property (nonatomic,retain) NSTimer *timeTimer;

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
    }
    return self;
}


/**
 *  外部接口 用来开始测试 并决定测试次数;
 *
 *  @param count 测试次数
 */
-(void)beginTestForCount:(NSInteger)count{

    self.testCount = count;
    
    timerTool *tool = [timerTool tool];
    [tool fireInTheHoll:self.timeTimer];
}
/**
 *  图片名字数组的 get 方法;
 *
 *  @return 数组
 */

/**
 *  everyday tonight we honor the hero. - -
 *
 *  @return <#return value description#>
 */

-(NSMutableArray *)imageNameArray{

    if (!_imageNameArray) {
        /**
         *  这里以后可能使用 url 或者网络请求下来的名字;
         */
        self.imageNameArray = [NSMutableArray arrayWithObjects:@"span1",@"span2",@"span3",@"span4",@"span5", nil];
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

    self.focusImageView = [[UIImageView alloc]init];
    
    self.answerTextFile = [[UITextField alloc]init];
    
    self.answerTextFile.delegate = self;
    
    [self addSubview:self.focusImageView];
    
    [self addSubview:self.answerTextFile];
    
    self.pointView = ({
        self.pointView = [[UIView alloc]init];
        
        [self.pointView setBackgroundColor:[UIColor clearColor]];
        
        self.pointView;
        
    });
    
    self.timeTimer = ({
        
        self.timeTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(caculateTimeAndAction:) userInfo:nil repeats:YES];
        
        self.timeTimer;
        
    });
}


/**
 *  计时器的事件响应
 *
 *  @param timer 计时器 实例参数
 */
-(void)caculateTimeAndAction:(NSTimer*)timer{

    self.timeCount = self.timeCount + 0.01;

    if (self.timeCount >= 0.25) {
        [timer invalidate];
        
        [self showTextFiled];
    }
}

/**
 *  显示图片
 */
-(void)showImage{
    
    [self endEditing:YES];
    
    [self.focusImageView setHidden:NO];

    [self.focusImageView setFrame:self.bounds];

    [self.focusImageView setImage:[UIImage imageNamed:@""]];
    
}

/**
 *  显示键盘
 */

-(void)showTextFiled{
    
    self.focusImageView.hidden = YES;

    self.answerTextFile.height = 50;
    
    self.answerTextFile.width = 200;

    self.answerTextFile.centerX = self.centerX;
    
    self.answerTextFile.centerY = self.centerY;
}


@end
