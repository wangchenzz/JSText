//
//  mycell.h
//  testTableview
//
//  Created by Mac on 16/2/3.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mycell : UITableViewCell

@property (nonatomic,retain) UIImageView *imageMyView;


@property (nonatomic, strong) UIView *coverview;

-(void)starAnimate;

- (CGFloat)cellOffset ;

@end
