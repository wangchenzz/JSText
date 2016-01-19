//
//  JSSideTestModel.h
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSSideTestModel : NSObject

@property (nonatomic,retain) UIImage *disImage;

@property (nonatomic,assign) BOOL isSelect;

@property (nonatomic,assign) double selectTime;

+(instancetype)model;

@end
