//
//  AttentionTransferTest.m
//  1.5-2015
//
//  Created by Mac on 16/1/14.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionTransferTest.h"

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
@property (nonatomic,retain) UITapGestureRecognizer *tap;


/**
 *  测验结果;
 */
@property (nonatomic,retain) NSMutableArray *listArray;



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

-(void)gameBegan{

    self.timeCountTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(caculateTimeCount) userInfo:nil repeats:YES];
    
    self.actionTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(actionNow) userInfo:nil repeats:YES];
    
    self.tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [self.beforeImageView addGestureRecognizer:self.tap];

}

-(void)caculateTimeCount{

}

-(void)actionNow{
    
//    - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  // animate at constant velocity to new offset
//    - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;
//    self.mainScrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    [self.mainScrollView scrollRectToVisible:CGRectMake(self.mainScrollView.frame.size.width, 0,self.frame.size.width,self.frame.size.height) animated:YES];

    [self.mainScrollView setContentOffset:CGPointMake(self.mainScrollView.frame.size.width, 0) animated:YES];
}

-(void)click:(UITapGestureRecognizer*)tap{
    
    JSLog(@"123456789");

}

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
    return self.firstImage;

}

#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{


}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{
 
    if (scrollView.contentOffset.x != 0) {
        self.mainScrollView.contentOffset = CGPointMake(0, 0);
        self.beforeImageView.image = self.nextImageView.image;
        self.nextImageView.image = [self rollImage];

    }
    
}
@end
