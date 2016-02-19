//
//  PictureAndPointModel.h
//  1.5-2015
//
//  Created by Mac on 16/1/22.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  图片黑点测试模型
 */

@interface PictureAndPointModel : NSObject

@property (nonatomic,copy) NSString *imageName;

@property (nonatomic,assign) NSInteger pointCount;

@property (nonatomic,assign)  NSInteger selectedCount;

@property (nonatomic,readonly,getter=isFocus) BOOL focus;

-(instancetype)initWithImageName:(NSString*)name andWithPointCount:(NSInteger)count;

@end
