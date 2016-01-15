//
//  JSLineGesture.m
//  1.5-2015
//
//  Created by Mac on 16/1/15.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "JSLineGesture.h"

#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation JSLineGesture


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    if (self.changeDirctCount < 2) {
        self.state = UIGestureRecognizerStateEnded;
    }else{
        self.state = UIGestureRecognizerStateFailed;
    }
}

@end
