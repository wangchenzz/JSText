//
//  JSSideTestCell.m
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "JSSideTestCell.h"

@implementation JSSideTestCell

/**
 *  封装创建方法
 *
 *  @param tableview tableview
 *
 *  @return 。。。
 */
+(instancetype)cellForTableview:(UITableView*)tableview{
    
    NSString *const identif = @"RegistInfoCell";
    
    JSSideTestCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[JSSideTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
    }
    return cell;
}

/**
 *  重写初始化方法;
 *
 *  @return 返回 cell;
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.DisplayImageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:self.DisplayImageView];
        
        self.DisplayImageView.height = 100;
        self.DisplayImageView.width = 100;
        
        self.DisplayImageView.y = 25;
        self.DisplayImageView.x = 30;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}


/**
 *  通过 set 方法处理数据
 *
 *  @param model 数据模型
 */

-(void)setModel:(JSSideTestModel *)model{
    _model = model;
    self.DisplayImageView.image = _model.disImage;
    if (_model.isSelect) {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
