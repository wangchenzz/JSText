//
//  AttentionTransferTest.h
//  1.5-2015
//
//  Created by Mac on 16/1/14.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AttentionTransferTest;

@protocol AttentionTransferTestDelegate <NSObject>

@optional

/**
 *  用于完成测试后的回调
 *
 *  @param test  测试本身
 *  @param array 测试内容的模型数组
 */
-(void)AttentionTransferTestDidFinish:(AttentionTransferTest*)test listArray:(NSMutableArray*)array;

@end

@interface AttentionTransferTest : UIView

@property (nonatomic,weak) id<AttentionTransferTestDelegate>delegate;

-(void)gameBegan;



@end
