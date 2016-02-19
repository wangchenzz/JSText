//
//  JSSideTestModel.h
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSSideTestModel : NSObject

/**
 *  显示的图片
 */
@property (nonatomic,retain) UIImage *disImage;


/**
 *  是否被选中 过
 */
@property (nonatomic,assign) BOOL isSelect;


/**
 *  选中时的时间
 */
@property (nonatomic,assign) float selectTime;


/**
 *  初始化方法
 *
 *  @return ...
 */
+(instancetype)model;

@end
