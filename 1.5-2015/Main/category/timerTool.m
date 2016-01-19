//
//  timerTool.m
//  1.5-2015
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "timerTool.h"

static timerTool *timetool;

@interface timerTool ()

@property (nonatomic,retain) NSTimer *ownTimer;

@end

@implementation timerTool

+(instancetype)tool{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
            timetool = [[self alloc]init];
    });
    return timetool;
}


-(void)fireInTheHoll:(NSTimer*)timer{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
        
    [timer fire];
    });
    

}

-(void)dealloc{

    JSLog(@"timeToolDealloc");

}

@end
