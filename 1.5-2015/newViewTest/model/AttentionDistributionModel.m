//
//  AttentionDistributionModel.m
//  1.5-2015
//
//  Created by Mac on 16/1/27.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "AttentionDistributionModel.h"

@implementation AttentionDistributionModel

+(instancetype)modelWithType:(soundType)type andColor:(UIColor*)color{

    AttentionDistributionModel *model = [[self alloc] init];
    model.soundType = type;
    model.color = color;
    return model;
    
}

@end
