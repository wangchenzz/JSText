//
//  JSSideTestCell.h
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSSideTestModel.h"

@interface JSSideTestCell : UITableViewCell

+(instancetype)cellForTableview:(UITableView*)tableview;

@property (nonatomic,retain) UIImageView * DisplayImageView;

@property (nonatomic,assign) JSSideTestModel * model;

@end
