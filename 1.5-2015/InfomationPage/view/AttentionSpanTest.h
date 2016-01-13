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

-(void)AttentionSpanTestClick:(AttentionSpanTest*)test testTime:(double)time label:(UILabel*)label;

-(void)AttentionSpanTestFinishFirstTest:(AttentionSpanTest*)test testArray:(NSMutableArray*)ary;

-(void)AttentionSpanTestClick:(AttentionSpanTest *)test secondTestTime:(double)time numAry:(NSMutableArray*)numary testCount:(NSInteger)count;

-(void)AttentionSpanTestFinishSecondTest:(AttentionSpanTest*)test testArray:(NSMutableArray*)ary;

@end


@interface AttentionSpanTest : NSObject

@property (nonatomic,weak) id<AttentionSpanTestDelegate>delegate;

-(instancetype)initWithController:(UIViewController*)control;

-(void)show;

-(void)showSecond;

-(void)soundTest;

@end
