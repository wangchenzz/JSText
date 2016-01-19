
//
//  NSTimer+Extension.m
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "NSTimer+Extension.h"

@implementation NSTimer (Extension)

-(void)timerForTimer:(NSTimer*)timer withTarget:(id)target withTimerInterval:(NSTimeInterval)ti selector:(SEL)sele repeats:(BOOL)abool myblock:(void(^)(NSTimer*timer))block{
    
    __block NSTimer *time;
   // timer = time;
    __weak __typeof(target)weakSelf = target;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        time = [NSTimer scheduledTimerWithTimeInterval:ti
                                                               target:weakSelf
                                                               selector:sele
                                                               userInfo:nil
                                                                repeats:abool];
        
       
        [[NSRunLoop currentRunLoop] addTimer:time forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
        block(time);
    });
    block(time);

}



@end
