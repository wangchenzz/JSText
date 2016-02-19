//
//  wordTestObj.h
//  1.5-2015
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <Foundation/Foundation.h>



//词语测试类。
@class wordTestObj;

@protocol wordTestObjDelegate <NSObject>

@optional

-(void)wordDidFinishTest:(wordTestObj*)wordobj;

@end

@interface wordTestObj : NSObject

@property (nonatomic,weak) id<wordTestObjDelegate>delegate;


+(instancetype)test;


-(void)setUpFirst:(UIViewController*)controller;

@end
