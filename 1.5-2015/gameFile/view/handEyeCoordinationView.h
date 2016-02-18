//
//  handEyeCoordinationView.h
//  1.5-2015
//
//  Created by Mac on 16/2/15.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

@class handEyeCoordinationView;

@protocol handEyeCoordinationViewDelegate <NSObject>

@optional
/**
 *  这个方法是接到碰撞的回调. 但是可能调用多次
 *
 *  @param handeye    ...
 *  @param timetravel 所用时间   ---也就是说通过这个方法得到时间,再找到机会做别的操作;
 */

-(void)handEyeCoordinationView:(handEyeCoordinationView*)handeye didFinsihGameWithTime:(float)timetravel;

@end

@interface handEyeCoordinationView : UIView

@property (nonatomic,weak) id<handEyeCoordinationViewDelegate>delegate;


-(void)start;



@end
