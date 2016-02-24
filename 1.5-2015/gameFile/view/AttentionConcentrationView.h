//
//  AttentionConcentrationView.h
//  1.5-2015
//
//  Created by Mac on 16/2/23.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,JSTouchState){
    JSTouchStateMoveIn  =  1,
    JSTouchStateMoveOut ,
    JSTouchStateStop
};

@interface AttentionConcentrationView : UIView

/**
 *  移动方块的状态;
 */

@property (nonatomic,assign) JSTouchState TouchState;

/**
 *  这是开始游戏的方法;
 */

-(void)beginGame;


@end
