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
    soundTypeLow
};

typedef NS_ENUM(NSInteger,colorType) {
    red = 0,
    green ,
    blue
};


@interface AttentionDistributionModel : NSObject

@property (nonatomic,assign) soundType soundType;

@property (nonatomic,retain) UIColor *color;

@property (nonatomic,assign) soundType selectedSound;

@property (nonatomic,retain) UIColor *selectedColor;


@end
