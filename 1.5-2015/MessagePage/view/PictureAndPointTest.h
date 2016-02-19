//
//  PictureAndPointTest.h
//  1.5-2015
//
//  Created by Mac on 16/1/22.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PictureAndPointModel.h"

/**
 *  图片和黑点测试,
 */

@interface PictureAndPointTest : UIView

@property (nonatomic,retain) UIImageView *focusImageView;

@property (nonatomic,retain) UITextField *answerTextFile;

@property (nonatomic,retain) UIButton *sureButton;

@property (nonatomic,assign) NSInteger testCount;

-(void)beginTestForCount:(NSInteger)count;

@end
