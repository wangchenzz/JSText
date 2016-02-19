//
//  SRTtest.h
//  舒尔特方块
//
//  Created by Mac on 16/1/5.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <Foundation/Foundation.h>

//收集所有的设置信息和难度信息，提供数据去布局view

typedef NS_ENUM(NSInteger , LevelState) {

    LevelStateLow = 1,
    LevelStateMe = 2,
    LevelStateHi = 3,
    LevelStateNone = 4

};


@interface SRTtest : NSObject

@property (nonatomic,retain) NSMutableArray *dataSourceArray;
@property (nonatomic,assign) NSInteger testCount;

-(instancetype)initWithLevel:(LevelState)level;

-(NSInteger)getTestNumber;

@end
