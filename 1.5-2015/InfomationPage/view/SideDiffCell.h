//
//  SideDiffCell.h
//  1.5-2015
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SideDiffModel.h"
@interface SideDiffCell : UITableViewCell

@property (nonatomic,assign) SideDiffModel *model;

@property (nonatomic,retain) UIImageView *leftOneImageView;


@property (nonatomic,retain) UIImageView *leftTwoImageView;


@property (nonatomic,retain) UIImageView *rightOneImageView;


@property (nonatomic,retain) UIImageView *rightTwoImageView;


@property (nonatomic,retain) UIImageView *rightThreeImageView;


@property (nonatomic,retain) UIImageView *rightFourImageView;


@property (nonatomic,retain) UIImageView *rightFiveImageView;

@property (nonatomic,retain) UITapGestureRecognizer *tap1;
@property (nonatomic,retain) UITapGestureRecognizer *tap2;
@property (nonatomic,retain) UITapGestureRecognizer *tap3;
@property (nonatomic,retain) UITapGestureRecognizer *tap4;
@property (nonatomic,retain) UITapGestureRecognizer *tap5;


+(instancetype)cellForTableview:(UITableView*)tableview;

@end
