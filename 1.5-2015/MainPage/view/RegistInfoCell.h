//
//  RegistInfoCell.h
//  1.5-2015
//
//  Created by Mac on 16/1/5.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistInfoCell : UITableViewCell

@property (nonatomic,retain) UILabel *rightLabel;

@property (nonatomic,retain) UILabel *leftLabel;

@property (nonatomic,retain) UITextField *writeFiled;

+(RegistInfoCell*)cellForTableview:(UITableView*)tableview;

-(void)cellForInfoNSString:(NSString*)infostr andPlaceStr:(NSString *)plastr andIndexpath:(NSIndexPath*)indexpath;

@end
