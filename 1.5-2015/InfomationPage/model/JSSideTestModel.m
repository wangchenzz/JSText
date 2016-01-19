
//
//  JSSideTestModel.m
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "JSSideTestModel.h"

@implementation JSSideTestModel

+(instancetype)model{

    JSSideTestModel *model = [[self alloc]init];
    
    model.selectTime = 0;
    model.isSelect = NO;

    model.disImage = [UIImage new];
    
    return model;
}

@end
