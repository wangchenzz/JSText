//
//  ErrorProfingModel.h
//  1.5-2015
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorProfingModel : NSObject


/**
 *  type  0-表示三角   1-表示圆形
 */

@property (nonatomic,assign) int imageType;

@property (nonatomic,assign) int voiceType;

@property (nonatomic,assign) BOOL selected;

@property (nonatomic,readonly,getter=isRight) BOOL right;

@end
