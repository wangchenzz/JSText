//
//  JSRoundGesture.m
//  1.5-2015
//
//  Created by Mac on 16/1/15.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "JSRoundGesture.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface JSRoundGesture ()

/**
 *  上点击一个位置
 */
@property (nonatomic,assign) CGPoint beforePoint;


@end

@implementation JSRoundGesture

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject]locationInView:self.view];
    self.startPoint = point;
    self.beforePoint = self.startPoint;
    self.changeDirctCount = 0;
    //    NSLog(@"x=%f y = %f",self.startPoint.x,self.startPoint.y);
    self.JSDirct = 0;
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject]locationInView:self.view];
    self.lastPoint = point;
    
//    NSLog(@"%f -- %f",self.lastPoint.x-self.beforePoint.x ,self.lastPoint.y - self.beforePoint.y);
    
    if (self.lastPoint.x > self.beforePoint.x ) {
        if (self.lastPoint.y > self.beforePoint.y) {
            
            self.beforePoint = self.lastPoint;
            if (self.JSDirct == JSDirctDownRight) {
                return;
            }
//            NSLog(@"JSDirctDownRight");
            
            self.JSDirct = JSDirctDownRight;
            self.changeDirctCount ++;
        }else{
            self.beforePoint = self.lastPoint;
            if (self.JSDirct == JSDirctUpRight) {
                return;
            }
//            NSLog(@"JSDirctUpRight");
            self.JSDirct = JSDirctUpRight;
            self.changeDirctCount ++;
        }
    }
    if(self.beforePoint.x > self.lastPoint.x ){
        
        if (self.lastPoint.y < self.beforePoint.y) {
            self.beforePoint = self.lastPoint;
            if (self.JSDirct == JSDirctUpLeft) {
                return;
            }
//            NSLog(@"JSDirctUpLeft");
            self.JSDirct = JSDirctUpLeft;
            self.changeDirctCount ++;
        }else{
            self.beforePoint = self.lastPoint;
            if (self.JSDirct == JSDirctDownLeft) {
                return;
            }
//            NSLog(@"JSDirctDownLeft");
            self.JSDirct = JSDirctDownLeft;
            self.changeDirctCount ++;
        }
    }
    
}


/**
 *  四次以上的变换方向则视为画圆
 *
 *  @param touches ...
 *  @param event   ...
 */
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.changeDirctCount >= 4) {
        self.state = UIGestureRecognizerStateEnded;
    }else{
        
        self.state = UIGestureRecognizerStateFailed;
    }
}


@end
