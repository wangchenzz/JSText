


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
#import "ErrorProfingCell.h"
#import "errorHeader.h"

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
        [self setUpTestInfo:465];
        [self setUpTimer];
    }
    return self;
}


/**
 *  计时器开始工作.
 */
-(void)testError{

    [[timerTool tool]fireInTheHoll:self.actionTimer];

}

/**
 *  设置 UI 控件
 */

-(void)setUI{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.headerReferenceSize = CGSizeMake(self.width, 38);
    

    self.mainCollectonView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height) collectionViewLayout:flowLayout];
    
    self.mainCollectonView.delegate = self;
    self.mainCollectonView.dataSource = self;
    
    [self.mainCollectonView setBackgroundColor:[UIColor whiteColor]];
    
    
    [self.mainCollectonView registerClass:[ErrorProfingCell class] forCellWithReuseIdentifier:@"ErrorProfingCell"];
    [self.mainCollectonView registerClass:[errorHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    
    [self addSubview:self.mainCollectonView];
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


/**
 *  设置数据源数组
 *
 *  @param count 数组长度.即测试类容的多少
 */

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


/**
 *  设置定时器
 */
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

/**
 *  按顺序播放语音
 */

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
    }else{
        [self.actionTimer invalidate];
    }
}

/**
 *  准备一个完全随机的题目
 */

-(void)rollOne{
    ErrorProfingModel *model = [[ErrorProfingModel alloc] init];
    model.imageType = arc4random()%2;
    model.voiceType = arc4random()%2;
    [self.dataInfoArray addObject:model];
}

/**
 *  准备一个绝对正确的题目;
 */
-(void)loadOne{
    ErrorProfingModel *model = [[ErrorProfingModel alloc] init];
    model.imageType = arc4random()%2;
    model.voiceType = model.imageType;
    [self.dataInfoArray addObject:model];
}


#pragma mark - collectionDelegate

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 31;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 15;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    ErrorProfingCell *cell = [ErrorProfingCell cellForCollectionView:self.mainCollectonView andIndexPath:indexPath];
    
    return cell;
    
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(84, 84);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger currentCount = indexPath.section * 31 + indexPath.row;
    
    ErrorProfingModel *model = self.dataInfoArray[currentCount];
    
    model.selected = YES;
    
    [self.mainCollectonView reloadData];
  
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ErrorProfingCell *cucell = (ErrorProfingCell*)cell;
    
    
    
    NSInteger counts = indexPath.section * 31 + indexPath.row;
    
    cucell.model = self.dataInfoArray[counts];
    
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    errorHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];

    [headerView.titleLabel setText:[NSString stringWithFormat:@"当前是第%ld组",indexPath.section+1]];
    
    return headerView;

}



@end
