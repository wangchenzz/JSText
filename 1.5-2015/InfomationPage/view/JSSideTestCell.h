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

/**
 *  封装创建方法和 id
 *
 *  @param tableview ..
 *
 *  @return cell
 */

+(instancetype)cellForTableview:(UITableView*)tableview;


/**
 *  显示图片的 view
 */
@property (nonatomic,retain) UIImageView * DisplayImageView;


/**
 *  模型
 */
@property (nonatomic,assign) JSSideTestModel * model;

@end
