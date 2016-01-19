//
//  NSTimer+Extension.h
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Extension)

-(void)timerForTimer:(NSTimer*)timer withTarget:(id)target withTimerInterval:(NSTimeInterval)ti selector:(SEL)sele repeats:(BOOL)abool myblock:(void(^)(NSTimer*timer))block;

@end
