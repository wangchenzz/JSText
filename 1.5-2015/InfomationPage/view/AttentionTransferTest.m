//
//  AttentionTransferTest.m
//  1.5-2015
//
//  Created by Mac on 16/1/14.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionTransferTest.h"
#import "AttensionTransferModel.h"
#import "JSDrawView.h"
#import "JSRoundGesture.h"
#import "JSLineGesture.h"
@interface AttentionTransferTest ()<UIScrollViewDelegate>
/**
 *  前一张图片
 */
@property (nonatomic,strong) UIImageView *beforeImageView;

/**
 *  后一张图片
 */
@property (nonatomic,strong) UIImageView *nextImageView;

/**
 *  srcollview
 */
@property (nonatomic,strong) UIScrollView *mainScrollView;

/**
 *  按时做操作的定时器
 */
@property (nonatomic,retain) NSTimer *actionTimer;

/**
 *  计算时间的计时器
 */
@property (nonatomic,retain) NSTimer *timeCountTimer;

/**
 *  手势
 */
@property (nonatomic,retain) JSRoundGesture *round;

@property (nonatomic,retain) JSLineGesture *line;


/**
 *  测验结果;
 */
@property (nonatomic,retain) NSMutableArray *listArray;


/**
 *  所经过的时间;
 */
@property (nonatomic,assign) float timeCount;

/**
 *  画图板;
 */

@property (nonatomic,retain) JSDrawView *drawView;

/**
 *  用来存放每次测试结果;
 */
@property (nonatomic,retain) AttensionTransferModel *testModel;

/**
 *  这里是六张图片 循环播放.
 */
@property (nonatomic,retain) UIImage *firstImage;

@property (nonatomic,retain) UIImage *secondImage;

@property (nonatomic,retain) UIImage *thirdImage;

@property (nonatomic,retain) UIImage *forthImage;

@property (nonatomic,retain) UIImage *fifthImage;

@property (nonatomic,retain) UIImage *sixthImage;

@end


@implementation AttentionTransferTest
/**
 *  初始化方法
 *
 *  @param frame 在俯视图中的位置
 *
 *  @return 自身
 */
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        [self setBackgroundColor:[UIColor blackColor]];
        
        [self setUpScrollview];
        
        [self setUpImage];
        
    
    }
    return self;
}

-(void)setUpScrollview{
    /**
     使用 uiscrollview 以及他的子类 一定一定要注意 setauto----------- no;
     */
    
    UIScrollView *scrview = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, self.frame.size.width, self.frame.size.height)];
    scrview.delegate = self;
    scrview.pagingEnabled = YES;
    scrview.showsHorizontalScrollIndicator = NO;
    scrview.showsVerticalScrollIndicator = NO;
    scrview.contentSize = CGSizeMake(2 * scrview.frame.size.width, 0);
    scrview.contentOffset = CGPointMake(0, 0);
    
    scrview.backgroundColor = [UIColor redColor];
    scrview.bounces = NO;
    [self addSubview:scrview];
    self.mainScrollView = scrview;
    self.mainScrollView.scrollEnabled = NO;
}

-(void)setUpImage{
    /**
     *  创建图片
     */
    UIImageView *imageview = [[UIImageView alloc]init];
    
    [imageview setFrame:CGRectMake(0, 0, self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height)];
    
    UIImageView *otherImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.mainScrollView.frame.size.width, 0, self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height)];
    
    [self.mainScrollView addSubview:imageview];
    [self.mainScrollView addSubview:otherImageView];
    self.beforeImageView = imageview;
    self.nextImageView = otherImageView;
    
    self.drawView = [[JSDrawView alloc]initWithFrame:self.beforeImageView.bounds];
    
    [self.drawView setBackgroundColor:[UIColor clearColor]];
    
    [self.beforeImageView addSubview:self.drawView];
    
    self.firstImage = [UIImage imageNamed:@"AttentionTransferTest1"];
    self.secondImage = [UIImage imageNamed:@"AttentionTransferTest2"];
    self.thirdImage = [UIImage imageNamed:@"AttentionTransferTest3"];
    self.forthImage = [UIImage imageNamed:@"AttentionTransferTest4"];
    self.fifthImage = [UIImage imageNamed:@"AttentionTransferTest5"];
    self.sixthImage = [UIImage imageNamed:@"AttentionTransferTest6"];
    
    self.beforeImageView.image = [self rollImage];
    
    self.nextImageView.image = [self rollImage];
    
    self.beforeImageView.userInteractionEnabled = YES;
    self.nextImageView.userInteractionEnabled = YES;
}


/**
 *  计时器开始运作;
 */

-(void)gameBegan{
//  self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(caculateTimeCount) userInfo:nil repeats:YES];
//
//        __weak __typeof(self)weakSelf = self;
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//       self.timeCountTimer=[NSTimer scheduledTimerWithTimeInterval:0.01
//                                                               target:self
//                                                             selector:@selector(caculateTimeCount)
//                                                             userInfo:nil
//                                                              repeats:YES] ;
//    
//            [[NSRunLoop currentRunLoop] addTimer:self.timeCountTimer forMode:NSDefaultRunLoopMode];
//            [[NSRunLoop currentRunLoop] run];
//        });
    timerTool *tool = [timerTool tool];
    self.timeCountTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(caculateTimeCount) userInfo:nil repeats:YES];
    
    [tool fireInTheHoll:self.timeCountTimer];
    

    self.actionTimer = [NSTimer timerWithTimeInterval:2.5 target:self selector:@selector(actionNow) userInfo:nil repeats:YES];
    [tool fireInTheHoll:self.actionTimer];

//   self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(actionNow) userInfo:nil repeats:YES];
//    
//    [[NSRunLoop mainRunLoop]addTimer:self.actionTimer forMode:NSRunLoopCommonModes];
    
    self.round = [[JSRoundGesture alloc]initWithTarget:self action:@selector(writeRound)];
    
    self.line = [[JSLineGesture alloc]initWithTarget:self action:@selector(writeLine)];

    [self.beforeImageView addGestureRecognizer:self.round];
    
    [self.beforeImageView addGestureRecognizer:self.line];
}

-(void)writeRound{

    self.testModel.isWriteRound = YES;
    
    int time = (int)(self.timeCount *100) % 250;
    
    self.testModel.time = (float) time / 100.0;
    
}

-(void)writeLine{
    
    self.testModel.isWriteX = YES;
    
    int time = (int)(self.timeCount *100) % 250;
    
    self.testModel.time = (float) time / 100.0;

}


-(void)caculateTimeCount{
    self.timeCount = self.timeCount + 0.01;
  //   JSLog(@"%@",[NSThread currentThread]);
    //JSLog(@"%f",self.timeCount);
    
    if (self.timeCount >9.9) {
        
    //    JSLog(@"%@",[NSThread currentThread]);
        
        [self.timeCountTimer invalidate];
        [self.actionTimer invalidate];
        [self.beforeImageView removeGestureRecognizer:self.line];
        [self.beforeImageView removeGestureRecognizer:self.round];
        
        if ([self.delegate respondsToSelector:@selector(AttentionTransferTestDidFinish:listArray:)]) {
            [self.delegate AttentionTransferTestDidFinish:self listArray:self.listArray];
        }
    }
    
}
/**
 *  此处每过2.5s 会更新一次图片, 每个三十秒 则会播放语音,然用户画圈,
 *  需要在某处,响应用户的手势事件,然后将每次点击的结果进行回调.
 */
-(AttensionTransferModel *)testModel{

    if (!_testModel) {
        self.testModel = [[AttensionTransferModel alloc]init];
    }
    return _testModel;
}



-(void)actionNow{
    
    self.testModel.iamge = self.beforeImageView.image;
    [self.listArray addObject:self.testModel];
    JSLog(@"addddddddddddddddd%f",self.timeCount);
     self.testModel = nil;
   
    //[self.mainScrollView scrollRectToVisible:CGRectMake(self.mainScrollView.frame.size.width, 0,self.frame.size.width,self.frame.size.height) animated:YES];

    [self.mainScrollView setContentOffset:CGPointMake(self.mainScrollView.frame.size.width, 0) animated:YES];
}

/**
 *  ...
 *
 *  @param tap ...
 */


-(NSMutableArray *)listArray{

    if (!_listArray) {
        self.listArray = [NSMutableArray new];
    }
    return _listArray;
}

/**
 *  roll 值以确定放出那张图片
 *
 *  @return roll 的图片
 */
-(UIImage *)rollImage{

    NSInteger rollNum = arc4random()%6;
    
    switch (rollNum) {
        case 0:
            return self.firstImage;
            break;
        case 1:
            return self.secondImage;
            break;
        case 2:
            return self.thirdImage;
            break;
        case 3:
            return self.forthImage;
            break;
        case 4:
            return self.fifthImage;
            break;
        case 5:
            return self.sixthImage;
            break;
            
        default:
            break;
    }
    return nil;
}

#pragma mark - UIScrollViewDelegate

/**
 *  减速移动完成会调用
 *
 *  @param scrollView  self
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

/**
 *  只要移动就会一直调用
 *
 *  @param scrollView  self
 */

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

}

/**
 *  移动offset就会调用
 *
 *  @param scrollView self
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{
 
    if (scrollView.contentOffset.x != 0) {
        self.mainScrollView.contentOffset = CGPointMake(0, 0);
        self.beforeImageView.image = self.nextImageView.image;
        self.nextImageView.image = [self rollImage];
        self.drawView.pointAry = nil;
        [self.drawView setNeedsDisplay];
    }else{
    
        [MBProgressHUD showError:@"出问题了"];
        
    }
}


@end
