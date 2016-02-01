//
//  UIView+Animated.h
//  1.5-2015
//
//  Created by Mac on 16/1/29.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JSFakeAnimationDirection) {
    JSFakeAnimationRight = 1,       ///< left to right
    JSFakeAnimationLeft = -1,       ///< right to left
    JSFakeAnimationDown = -2,       ///< up to down
    JSFakeAnimationUp = 2           ///< down to up
};

static const NSTimeInterval JSFakeLabelAnimationDuration = 0.7;

@interface UIView (Animated)


-(void)JSLabel_StarAnimationWithDirection:(JSFakeAnimationDirection)direction toText:(NSString *)toText;

-(void)JSImage_StarAnimationWithDirection:(JSFakeAnimationDirection)direction toImage:(UIImage *)toImage;

-(void)jsLabel_AnimatgionRollDirctionToText:(NSString *)toText;

-(void)jsImage_AnimatgionRollDirctionToImage:(UIImage *)Image;

@end
