//
//  JSRoundGesture.h
//  1.5-2015
//
//  Created by Mac on 16/1/15.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  画圆的手势
 */

@interface JSRoundGesture : UIGestureRecognizer
typedef NS_ENUM(NSInteger,JSDirct) {
    JSDirctUpRight  =  1,
    JSDirctDownRight,
    JSDirctDownLeft,
    JSDirctUpLeft
};

/**
 *  总共变换方向的次数
 */
@property (nonatomic,assign) NSInteger changeDirctCount;


@property (nonatomic,assign) JSDirct JSDirct;

@property(nonatomic,assign)CGPoint startPoint;
@property(nonatomic,assign)CGPoint lastPoint;

@end
