


//
//  ErrorProofingTest.m
//  1.5-2015
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "ErrorProofingTest.h"
#import <AudioToolbox/AudioToolbox.h>
#import "ErrorProfingModel.h"

typedef NS_ENUM(NSInteger,JSSoundLevel){
    JSSoundLevelLow = 1,
    JSSoundLevelMid ,
    JSSoundLevelHight
};

@interface ErrorProofingTest ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,assign) SystemSoundID avid1;

@property (nonatomic,assign) SystemSoundID avid2;

@property (nonatomic,retain) UIImage *image1;

@property (nonatomic,retain) UIImage *image2;

@property (nonatomic,retain) NSMutableArray *dataInfoArray;

@property (nonatomic,retain) NSTimer *actionTimer;

@property (nonatomic,assign,readonly) JSSoundLevel soundlevel;

@property (nonatomic,retain) UICollectionView *mainCollectonView;



@end

@implementation ErrorProofingTest


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpAudioAndImage];
        [self setUI];
        [self setUpTestInfo:20];
        [self setUpTimer];
    }
    return self;
}

-(void)testError{

    [[timerTool tool]fireInTheHoll:self.actionTimer];

}

-(void)setUI{

    self.mainCollectonView = [[UICollectionView alloc]init];
    
    self.mainCollectonView.width = self.width;
    self.mainCollectonView.height = self.height;
    self.mainCollectonView.x = 0;
    self.mainCollectonView.y = 0;
    
    self.mainCollectonView.delegate = self;
    self.mainCollectonView.dataSource = self;
}

/**
 *  只读属性. 界定难度  影响读的速度;
 *
 *  @return 难度系数
 */
-(JSSoundLevel)soundlevel{
    if (1) {
        return JSSoundLevelMid;
    }else{
        return JSSoundLevelHight;
    }
}

/**
 *  准备好语音和图片.
 */

-(void)setUpAudioAndImage{

// 三角
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avid1);
    
// 圆
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"2.caf"]), &_avid2);

//三角
    self.image1 = [UIImage imageNamed:@""];
    
// 圆
    self.image2 = [UIImage imageNamed:@""];
    
}
//注册语音的语音URL；
/**
 *  得到注册音效的 URL
 *
 *  @param filename  文件名
 *
 *  @return 文件 URL
 */
-(NSURL *)regsoundForFile:(NSString*)filename{
    NSString *path = [[NSBundle mainBundle]resourcePath];
    path = [path stringByAppendingPathComponent:filename];
    NSURL *url = [NSURL fileURLWithPath:path];
    return url;
}

-(NSMutableArray *)dataInfoArray{

    if (!_dataInfoArray) {
        self.dataInfoArray = [NSMutableArray new];
    }
    return _dataInfoArray;
}

-(void)setUpTestInfo:(NSInteger)count{
    for (int i = 0 ; i < count ; i ++ ) {
        ErrorProfingModel *model = [self.dataInfoArray lastObject];
        if (self.dataInfoArray.count == 0) {
            [self rollOne];
            continue;
        }
        if (!model.isRight) {
            [self loadOne];
        }
        if (model.isRight) {
            [self rollOne];
        }
    }
}

-(void)setUpTimer{
    if (self.soundlevel == JSSoundLevelHight) {
        self.actionTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(readSound) userInfo:nil repeats:YES];
    }
    if (self.soundlevel == JSSoundLevelMid) {
         self.actionTimer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(readSound) userInfo:nil repeats:YES];
    }
    if (self.soundlevel == JSSoundLevelLow) {
        self.actionTimer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(readSound) userInfo:nil repeats:YES];
    }
}

-(void)readSound{
    static int i = 0;
    if (i < self.dataInfoArray.count) {
        ErrorProfingModel *model = self.dataInfoArray[i];
        int type = model.voiceType;
        if (type == 0) {
            AudioServicesPlayAlertSound(_avid1);
        }else{
            AudioServicesPlayAlertSound(_avid2);
        }
        i ++;
    }
    [self.actionTimer invalidate];
}

-(void)rollOne{
    ErrorProfingModel *model = [[ErrorProfingModel alloc] init];
    model.imageType = arc4random()%2;
    model.voiceType = arc4random()%2;
    [self.dataInfoArray addObject:model];
}

-(void)loadOne{
    ErrorProfingModel *model = [[ErrorProfingModel alloc] init];
    model.imageType = arc4random()%2;
    model.voiceType = model.imageType;
    [self.dataInfoArray addObject:model];
}
@end
