//
//  StroopTestModel.h
//  1.5-2015
//
//  Created by Mac on 16/2/13.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,StroopSelectType){

    StroopSelectTypeYellow = 1,
    StroopSelectTypeRed,
    StroopSelectTypeBlue,
    StroopSelectTypeGreen
};

@interface StroopTestModel : NSObject

@property (nonatomic,strong)UIColor *titleColor;

@property (nonatomic,copy) NSString *titleString;

@property (nonatomic,assign) StroopSelectType selectValue;

@property (nonatomic,assign) float selectTime;

@end
