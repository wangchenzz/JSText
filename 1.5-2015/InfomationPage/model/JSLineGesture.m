//
//  JSLineGesture.m
//  1.5-2015
//
//  Created by Mac on 16/1/15.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "JSLineGesture.h"

#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation JSLineGesture


/**
 *  继承自画圆的类
 *
 *  @param touches ...
 *  @param event   如果方向改变小于2 则视为
 */

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    if (self.changeDirctCount < 2) {
        self.state = UIGestureRecognizerStateEnded;
    }else{
        self.state = UIGestureRecognizerStateFailed;
    }
}

@end
