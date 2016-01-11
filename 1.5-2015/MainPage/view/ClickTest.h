//
//  ClickTest.h
//  1.5-2015
//
//  Created by Mac on 16/1/5.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>


//点击测试类；

@class ClickTest;

@protocol ClikTestDelegate <NSObject>

@optional

-(void)clickTestDidFinish:(ClickTest*)test;

@end


@interface ClickTest : NSObject

@property (nonatomic,weak) id<ClikTestDelegate>delegate;

-(instancetype)initWithController:(UIViewController*)control;

-(void)beganTest;


@end
