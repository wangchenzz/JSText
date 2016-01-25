//
//  SideDiffModel.h
//  1.5-2015
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SideDiffModel : NSObject

/**
 *  左边两张图片名字;
 */
@property (nonatomic,copy) NSString *leftOneImage;

@property (nonatomic,copy) NSString *leftTwoImage;

/**
 *  右边三张图片名字
 */

@property (nonatomic,copy) NSString *rightOneImage;

@property (nonatomic,copy) NSString *rightTwoImage;

@property (nonatomic,copy) NSString *rightThreeImage;

@property (nonatomic,copy) NSString *rightFourImage;

@property (nonatomic,copy) NSString *rightFiveImage;

@property (nonatomic,assign) BOOL isRFirstSelect;

@property (nonatomic,assign) BOOL isRTwoSelect;

@property (nonatomic,assign) BOOL isRThreeSelect;

@property (nonatomic,assign) BOOL isRFourSelect;

@property (nonatomic,assign) BOOL isRFiveSelect;

@property (nonatomic,assign) float timeCount;

@property (nonatomic,assign) CGRect leftOneImager;

@property (nonatomic,assign) CGRect leftTwoImager;

@property (nonatomic,assign) CGRect rightOneImager;

@property (nonatomic,assign) CGRect rightTwoImager;

@property (nonatomic,assign) CGRect rightThreeImager;

@property (nonatomic,assign) CGRect rightFourImager;

@property (nonatomic,assign) CGRect rightFiveImager;

+(instancetype)model;

@end
