
//
//  SideDiffCell.m
//  1.5-2015
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "SideDiffCell.h"

@implementation SideDiffCell


+(instancetype)cellForTableview:(UITableView*)tableview{
    NSString *const identif = @"SideDiffCell";
    
    SideDiffCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[SideDiffCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
    }
    return cell;

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _leftOneImageView = [[UIImageView alloc]init];
        
   
        _leftTwoImageView = [[UIImageView alloc]init];
        
        
        _rightOneImageView = [[UIImageView alloc]init];
        
        
        _rightTwoImageView = [[UIImageView alloc]init];
        
        
        _rightThreeImageView = [[UIImageView alloc]init];
    
  
        _rightFourImageView = [[UIImageView alloc]init];
        
   
        _rightFiveImageView = [[UIImageView alloc]init];\
        
    }
    return self;
}

-(void)setModel:(SideDiffModel *)model{

    _model = model;
    
    

}

@end
