//
//  handEyeGameController.h
//  1.5-2015
//
//  Created by Mac on 16/2/16.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "handEyeCoordinationView.h"

#import "JSPresentBut.h"
@interface handEyeGameController : UIViewController<handEyeCoordinationViewDelegate>

@property (nonatomic,retain) JSPresentBut *bu;

@end
