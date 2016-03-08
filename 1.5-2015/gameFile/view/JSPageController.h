//
//  JSPageController.h
//  1.5-2015
//
//  Created by Mac on 16/2/19.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSPageController : UIView

@property(nonatomic) NSInteger numberOfPages;          // default is 0
@property(nonatomic) NSInteger currentPage;            // default is 0. value pinned to 0..numberOfPages-1

@end
