//
//  SRTtest.m
//  舒尔特方块
//
//  Created by Mac on 16/1/5.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "SRTtest.h"

@interface SRTtest ()

@property (nonatomic,assign) LevelState testLevel;




@end

@implementation SRTtest

-(instancetype)init{

    if (self = [super init]) {
        self.testLevel = LevelStateNone;
    }

    return self;
}

//使用难度创建；
-(instancetype)initWithLevel:(LevelState)level{

    if (self = [super init]) {
        self.testLevel = level;
    }
    return self;
}

//不使用难度。传入参数创建；

-(void)setTestCount:(NSInteger)testCount{

    self.testCount = testCount;
    
}


-(NSInteger)getTestNumber{

    if (self.testLevel == LevelStateHi) {
        return 36;
    }
    if (self.testLevel == LevelStateMe) {
        return 25;
    }
    if (self.testLevel == LevelStateLow) {
        return 9;
    }
    if (self.testLevel == LevelStateNone) {
        
        return self.testCount;
        
    }
    else{
        return 0;
    }
}



-(NSMutableArray *)dataSourceArray{

    if (self.testLevel == LevelStateHi) {
        return [@[@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45"] mutableCopy];
    }
    if (self.testLevel == LevelStateLow) {
         return [@[@"床",@"前",@"明",@"月",@"光",@"疑",@"是",@"地",@"上"] mutableCopy];
    }
    if (self.testLevel == LevelStateMe) {
         return [@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y"] mutableCopy];
    }else{
    
     return [@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p"] mutableCopy];
        
    }
}

@end
