//
//  SRTview.h
//  舒尔特方块
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRTtest.h"
#import <UIKit/UIKit.h>
@class SRTview;
@protocol SRTviewDelegate <NSObject>

@optional

-(void)SRTviewDidClickButton:(SRTview*)srtview andButton:(UIButton*)sender;

@end

@interface SRTview : UIView

@property (nonatomic,weak)id<SRTviewDelegate>delegate;

@property (nonatomic,retain) NSMutableArray *dataSourceArray;

-(instancetype)initWihtSRTtest:(LevelState )level;

-(void)testIn:(UIViewController*)control;


@end
