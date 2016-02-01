//
//  AttentionDistributionModel.h
//  1.5-2015
//
//  Created by Mac on 16/1/27.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,soundType) {
    soundTypeHight = 0,
    soundTypeMid ,
    soundTypeLow,
    soundtypeNone
};

@interface AttentionDistributionModel : NSObject

/**
 *  播放声音类型
 */
@property (nonatomic,assign) soundType soundType;

/**
 *  播出的颜色
 */
@property (nonatomic,retain) UIColor *color;

/**
 *  选择声音类型
 */
@property (nonatomic,assign) soundType selectedSound;

/**
 *  选择的颜色
 */
@property (nonatomic,retain) UIColor *selectedColor;


+(instancetype)modelWithType:(soundType)type andColor:(UIColor*)color;

@end
