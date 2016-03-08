//
//  JSDatePiker.h
//  1.5-2015
//
//  Created by Mac on 16/1/7.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSDatePiker;
@protocol JSDatePikerDelegate <NSObject>

@optional

-(void)JSDatePikerDidSelectSure:(UIDatePicker*)datepiker;

@end

@interface JSDatePiker : UIView

@property (nonatomic,weak)id<JSDatePikerDelegate>delegate;



+(instancetype)piker;



@end
