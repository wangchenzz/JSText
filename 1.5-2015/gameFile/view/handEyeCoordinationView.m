//
//  handEyeCoordinationView.m
//  1.5-2015
//
//  Created by Mac on 16/2/15.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "handEyeCoordinationView.h"

@interface handEyeCoordinationView ()<UICollisionBehaviorDelegate>

#define widthV self.width * .1

/**
 *  被操控的 view
 */
@property (nonatomic,strong) UIImageView *xinfeiji;

/**
 *   推动子弹行为
 */

@property (nonatomic) UIPushBehavior *userDragBehavior;

/**
 *  检测碰撞
 */
@property (nonatomic) UICollisionBehavior *chaoCollosion;

/**
 *  显示当前时间
 */
@property (nonatomic,assign) float timeCount;

/**
 *  计算时间
 */
@property (nonatomic,retain) NSTimer *timeTimer;
/**
 *  计时器-用来生成子弹
 */
@property (nonatomic,retain) NSTimer *actiontimer;

/**
 *  拖动手势
 */
@property (nonatomic) UISnapBehavior *snap;
/**
 *  动态动画
 */
@property (nonatomic) UIDynamicAnimator *animator;


@end

@implementation handEyeCoordinationView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self setUpBackRound];
        
        [self setUpControlView];
    }

    return self;
}

-(void)start{

    self.actiontimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(addmore) userInfo:nil repeats:YES];
    
    [[timerTool tool]fireInTheHoll:self.actiontimer];
    
    self.timeCount = 0;
    
    self.timeTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerun) userInfo:nil repeats:YES];
    
    [[timerTool tool]fireInTheHoll:self.timeTimer];
    

}

-(void)timerun{
    
    _timeCount += 0.01;

}

-(void)setUpBackRound{
    UIImageView *image = [[UIImageView alloc] initWithFrame:self.frame];
    
    [self addSubview:image];
    
    [image setContentMode:UIViewContentModeScaleAspectFill];
    
    image.image = [UIImage imageNamed:@"handeyegamebackround"];
}

-(void)setUpControlView{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.window];
    
    self.xinfeiji = [[UIImageView alloc] init];
    
    self.xinfeiji.userInteractionEnabled = YES;
    
    [self.xinfeiji setContentMode:UIViewContentModeScaleAspectFill];
    
    
    [self addSubview:self.xinfeiji];
    
    self.xinfeiji.height = self.xinfeiji.width  = self.width * .1;
    
    self.xinfeiji.centerX = self.centerX;
    
    self.xinfeiji.centerY = self.centerY;
    
    self.xinfeiji.image = [UIImage imageNamed:@"moveOneImage"];
    
    self.chaoCollosion = [[UICollisionBehavior alloc] init];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.xinfeiji.frame];
    
    [self.chaoCollosion addBoundaryWithIdentifier:@"path" forPath:path];
    
    [self.animator addBehavior:self.chaoCollosion];
    
    self.chaoCollosion.collisionDelegate = self;
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleBallPan:)];
    
    [self.xinfeiji addGestureRecognizer:pan];

}

-(void)handleBallPan:(UIPanGestureRecognizer *)recoginizer{
    
    [_animator removeBehavior:_snap];
    
    CGPoint endpoint = [recoginizer locationInView:self];
    
    _snap = [[UISnapBehavior alloc] initWithItem:self.xinfeiji snapToPoint:endpoint];
    
    _snap.damping = 1;
    
    [self.animator addBehavior:_snap];
    
    
    [self.chaoCollosion removeBoundaryWithIdentifier:@"path"];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.xinfeiji.frame];
    
    [self.chaoCollosion addBoundaryWithIdentifier:@"path" forPath:path];
    
}


-(void)addmore{
    for (int i = 0; i < 6; i ++) {
        [self addAMonster];
    }
}


-(void)addAMonster{
    
    UIImageView *monster = [[UIImageView alloc] init];
    
    [monster setContentMode:UIViewContentModeScaleToFill];
    
    
    monster.image = [UIImage imageNamed:@"456"];
    
    
    CGSize viewsize = self.frame.size;
    
    
    int allnum = (viewsize.width + viewsize.height) * 2;
    
    float froll = arc4random()%allnum;
    
    if (froll <= viewsize.width) {
        [monster setFrame:CGRectMake(froll, 0-widthV, widthV, widthV)];
    }
    else if (froll <= viewsize.width + viewsize.height) {
        [monster setFrame:CGRectMake(viewsize.width+widthV, froll-viewsize.width, widthV, widthV)];
    }
    else if (froll <= viewsize.width *2 + viewsize.height){
        [monster setFrame:CGRectMake(viewsize.width *2 + viewsize.height-froll, viewsize.height+widthV, widthV, widthV )];
        
    }else{
        [monster setFrame:CGRectMake(0-widthV, allnum - froll, widthV, widthV)];
    }
    
    [self addSubview:monster];
    
    [self.chaoCollosion addItem:monster];
    
    [self runAction:monster];
}

-(void)runAction:(UIImageView *)monster{
    
    CGSize viewsize = self.window.frame.size;
    
    int allnum = (viewsize.width + viewsize.height) * 2;
    
    float froll = arc4random()%allnum;
    
    CGRect rectn;
    
    if (froll <= viewsize.width) {
        rectn =CGRectMake(froll, 0, 45, 45);
    }else if (froll <= viewsize.width + viewsize.height) {
        rectn = CGRectMake(viewsize.width, froll-viewsize.width, 45, 45);
    }else if (froll <= viewsize.width *2 + viewsize.height){
        rectn =CGRectMake(viewsize.width *2 + viewsize.height-froll, viewsize.height, 45, 45 );
    }else{
        rectn =CGRectMake(0, allnum - froll, 45, 45);
    }
    CGPoint tapPoint = rectn.origin;
    
    CGPoint squareViewCenterPoint = monster.center;
    
    CGFloat deltaX = tapPoint.x - squareViewCenterPoint.x;
    CGFloat deltaY = tapPoint.y - squareViewCenterPoint.y;
    CGFloat angle = atan2(deltaY, deltaX);
    
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[monster] mode:UIPushBehaviorModeContinuous];
    
    [push setAngle:angle];  //推移的角度
    
    //勾股
    //            CGFloat distanceBetweenPoints =
    //            sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) +
    //                 pow(tapPoint.y - squareViewCenterPoint.y, 2.0));
    //double pow(double x, double y）;计算以x为底数的y次幂
    //double sqrt (double);开平方
    
    [push setMagnitude:0.3];
    [self.animator addBehavior:push];
    
}
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id)item withBoundaryIdentifier:(id)identifier atPoint:(CGPoint)p{
    
    
    [_actiontimer invalidate];
    
    [_timeTimer invalidate];
    
    [behavior removeBoundaryWithIdentifier:identifier];
    
    
        if ([self.delegate respondsToSelector:@selector(handEyeCoordinationView:didFinsihGameWithTime:)]) {
            [self.delegate handEyeCoordinationView:self didFinsihGameWithTime:self.timeCount];
        }
    
    
}
-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id)item withBoundaryIdentifier:(id)identifier{
    
    NSLog(@"endedContactForItem");
}

@end
