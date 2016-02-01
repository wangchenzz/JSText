//
//  AttentionDistributionTest.h
//  1.5-2015
//
//  Created by Mac on 16/1/26.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AttentionDistributionTest;

@protocol AttentionDistributionDelegate <NSObject>

@optional

-(void)AttentionDistributionDidFinish:(AttentionDistributionTest *)test andArray:(NSMutableArray *)array;

@end

@interface AttentionDistributionTest : UIView

@property (nonatomic,weak) id <AttentionDistributionDelegate> delegate;

/**
 *（1）单独呈现不同颜色圆。
 *（2）单独呈现不同频率声音。
 *（3）颜色圆加声音。
 *（4）颜色圆加声音。
 *（5）单独呈现不同频率声音。
 *（6）单独呈现不同颜色圆。            ----每部分内容呈现时间是总时间的1/6   不就是只有三种测试
 */


/**
 *  开始测试
 *
 *  @param count 6种测试中每种测试的次数;                                                                   
 */




-(void)beginTest:(NSInteger)count;


@end
