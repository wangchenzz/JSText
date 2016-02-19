//
//  AttensionTransferModel.h
//  1.5-2015
//
//  Created by Mac on 16/1/15.
//  Copyright © 2016年 竞思. All rights reserved.
//



/**
 *  注意力持续的模型
 *
 *  @param nonatomic ...
 *  @param retain    ...
 *
 *  @return ...
 */
#import <Foundation/Foundation.h>

@interface AttensionTransferModel : NSObject

/**
 *  所显示图形
 */

@property (nonatomic,retain) UIImage *iamge;

/**
 *  是否画圆
 */

@property (nonatomic,assign) BOOL isWriteRound;

/**
 *  是否画叉
 */

@property (nonatomic,assign) BOOL isWriteX;

/**
 *  是否是声音响的时候;
 */
@property (nonatomic,assign) BOOL isSoundCount;


/**
 *  反应时间
 */
@property (nonatomic,assign) float time;


@end
