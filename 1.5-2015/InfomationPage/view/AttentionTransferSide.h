//
//  AttentionTransferSide.h
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//




/**
 *   此类是测试在屏幕两边操作的能力。 屏幕将分为左右两个部分， 左边出图片，右边将显示数字， 其中还会有音告诉用户该
 *   怎么操作。
 */


#import <UIKit/UIKit.h>

@class AttentionTransferSide;


@protocol AttentionTransferSideDelegate <NSObject>

@optional

-(void)AttentionTransferSideDidFinish:(AttentionTransferSide*)test forDataArray:(NSMutableArray*)ary;


@end

@interface AttentionTransferSide : UIView

@property (nonatomic,weak) id<AttentionTransferSideDelegate>delegate;

-(void)test;

@end
