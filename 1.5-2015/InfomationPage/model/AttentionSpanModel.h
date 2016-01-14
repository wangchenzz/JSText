//
//  AttentionSpanModel.h
//  1.5-2015
//
//  Created by Mac on 16/1/14.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  此模型 用来存放用户测试的  注意力持续性--听觉 视觉 混合测试的结果.
 */

@interface AttentionSpanModel : NSObject

/**
 *  正确次数
 */
@property (nonatomic,assign) NSInteger rightCount;

/**
 *  错误次数
 */
@property (nonatomic,assign) NSInteger wrongCount;

/**
 *  遗漏次数
 */
@property (nonatomic,assign) NSInteger lostCount;

/**
 *  时间
 */
@property (nonatomic,assign) NSInteger timeCount;

@end
