//
//  animationFlashLabel.h
//  1.5-2015
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface animationFlashLabel : UILabel

-(void)showAnimation:(float)animationSpace completion:(void (^)(BOOL finished))completion;



/**
 *  第一个问题,如果当第一个动画还没做完之前 又给值 text 如何解决?
 *  第二个问题,如果
 */

@end
