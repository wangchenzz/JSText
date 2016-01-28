//
//  AttentionSpanTest.h
//  1.5-2015
//
//  Created by Mac on 16/1/11.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
@class AttentionSpanTest;

@protocol AttentionSpanTestDelegate <NSObject>

@optional
//通过label 的text 和 tag 值判断。


/**
 *  视觉测试中的点击回调
 *
 *  @param test  自身
 *  @param time  训练时间
 *  @param label 屏幕上的 label
 */
-(void)AttentionSpanTestClick:(AttentionSpanTest*)test testTime:(float)time label:(UILabel*)label;

/**
 *  视觉测试完成后的回调
 *
 *  @param test 自身
 *  @param ary  测试内容的数组
 */
-(void)AttentionSpanTestFinishFirstTest:(AttentionSpanTest*)test testArray:(NSMutableArray*)ary;

/**
 *  词组测试的点击回调
 *
 *  @param test   自身
 *  @param time   当前经过的时间
 *  @param numary 当前展示的字符
 *  @param count  当前测试次数
 */
-(void)AttentionSpanTestClick:(AttentionSpanTest *)test secondTestTime:(float)time numAry:(NSMutableArray*)numary testCount:(NSInteger)count;

/**
 *  词组测试结束的回调
 *
 *  @param test 自身
 *  @param ary  测试内容的容器
 */
-(void)AttentionSpanTestFinishSecondTest:(AttentionSpanTest*)test testArray:(NSMutableArray*)ary;

/**
 *  声音测试 点击回调
 *
 *  @param test  自身
 *  @param time  当前时间
 *  @param sound 当前播放音乐
 *  @param count 当前测试次数
 */
-(void)AttentionSpanTestClick:(AttentionSpanTest *)test soundTestTime:(float)time soundCount:(NSInteger )sound testCount:(NSInteger)count;

/**
 *  声音测试结束的回调
 *
 *  @param test 自身
 *  @param ary  播放数组
 */
-(void)AttentionSpanTestFinishSoundTest:(AttentionSpanTest*)test testArray:(NSMutableArray*)ary;
@end


@interface AttentionSpanTest : NSObject

@property (nonatomic,weak) id<AttentionSpanTestDelegate>delegate;

-(instancetype)initWithController:(UIViewController*)control;
/**
 *  显示项目视觉
 */
-(void)show;

/**
 *  显示项目 组合视觉
 */
-(void)showSecond;

/**
 *  听觉测试
 */
-(void)soundTest;


/**
 *  听觉视觉混合测试
 */
-(void)showSoundWatchTest;

@end
