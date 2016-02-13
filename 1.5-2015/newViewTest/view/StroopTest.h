//
//  StroopTest.h
//  1.5-2015
//
//  Created by Mac on 16/2/1.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StroopTestModel.h"

@class StroopTest;

@protocol StroopTestDelegate <NSObject>

@optional

-(void)stroopTestDidFinsih:(NSMutableArray *)array;

@end

@interface StroopTest : UIView

@property (nonatomic,assign) NSInteger totalCounts;

@property (nonatomic,weak) id<StroopTestDelegate>delegate;


-(void)showTestWithCount:(NSInteger)count;


@end
