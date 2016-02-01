
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
        _rightFiveImageView = [[UIImageView alloc]init];
        
        [self.leftOneImageView setHighlightedImage:[UIImage imageNamed:@"selected"]];
        [self.leftTwoImageView setHighlightedImage:[UIImage imageNamed:@"selected"]];
        [self.rightOneImageView setHighlightedImage:[UIImage imageNamed:@"selected"]];
        [self.rightTwoImageView setHighlightedImage:[UIImage imageNamed:@"selected"]];
        [self.rightThreeImageView setHighlightedImage:[UIImage imageNamed:@"selected"]];
        [self.rightFourImageView setHighlightedImage:[UIImage imageNamed:@"selected"]];
        [self.rightFiveImageView setHighlightedImage:[UIImage imageNamed:@"selected"]];
        
        [self.contentView addSubview:self.leftOneImageView];
        [self.contentView addSubview:self.leftTwoImageView];
        [self.contentView addSubview:self.rightOneImageView];
        [self.contentView addSubview:self.rightTwoImageView];
        [self.contentView addSubview:self.rightThreeImageView];
        [self.contentView addSubview:self.rightFourImageView];
        [self.contentView addSubview:self.rightFiveImageView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.leftOneImageView.userInteractionEnabled = YES;
        self.leftTwoImageView.userInteractionEnabled = YES;
        self.rightOneImageView.userInteractionEnabled = YES;
        self.rightTwoImageView.userInteractionEnabled = YES;
        self.rightThreeImageView.userInteractionEnabled = YES;
        self.rightFourImageView.userInteractionEnabled = YES;
        self.rightFiveImageView.userInteractionEnabled = YES;
        
        _tap1 = [[UITapGestureRecognizer alloc]init];
        _tap2 = [[UITapGestureRecognizer alloc]init];
        _tap3 = [[UITapGestureRecognizer alloc]init];
        _tap4 = [[UITapGestureRecognizer alloc]init];
        _tap5 = [[UITapGestureRecognizer alloc]init];
        
        [self.rightOneImageView addGestureRecognizer:_tap1];
        [self.rightTwoImageView addGestureRecognizer:_tap2];
        [self.rightThreeImageView addGestureRecognizer:_tap3];
        [self.rightFourImageView addGestureRecognizer:_tap4];
        [self.rightFiveImageView addGestureRecognizer:_tap5];
    }
    return self;
}


-(void)setModel:(SideDiffModel *)model{

     _model = model;
    
    [self.rightOneImageView setFrame:_model.rightOneImager];
    [self.rightTwoImageView setFrame:_model.rightTwoImager];
    [self.rightThreeImageView setFrame:_model.rightThreeImager];
    [self.rightFourImageView setFrame:_model.rightFourImager];
    [self.rightFiveImageView setFrame:_model.rightFiveImager];
    [self.leftOneImageView setFrame:_model.leftOneImager];
    [self.leftTwoImageView setFrame:_model.leftTwoImager];
 
    [self.leftOneImageView setImage:[UIImage imageNamed:_model.leftOneImage]];
    [self.leftTwoImageView setImage:[UIImage imageNamed:_model.leftTwoImage]];
    [self.rightOneImageView setImage:[UIImage imageNamed:_model.rightOneImage]];
    [self.rightTwoImageView setImage:[UIImage imageNamed:_model.rightTwoImage]];
    [self.rightThreeImageView setImage:[UIImage imageNamed:_model.rightThreeImage]];
    [self.rightFourImageView setImage:[UIImage imageNamed:_model.rightFourImage]];
    [self.rightFiveImageView setImage:[UIImage imageNamed:_model.rightFiveImage]];
    
    if (_model.isRFirstSelect) {
        [self.rightOneImageView setHighlighted:YES];
    }else{
        [self.rightOneImageView setHighlighted:NO];
    }
    if (_model.isRTwoSelect) {
        [self.rightTwoImageView setHighlighted:YES];
    }else{
        [self.rightTwoImageView setHighlighted:NO];
    }
    if (_model.isRThreeSelect) {
        [self.rightThreeImageView setHighlighted:YES];
    }else{
        [self.rightThreeImageView setHighlighted:NO];
    }
    if (_model.isRFourSelect) {
        [self.rightFourImageView setHighlighted:YES];
    }else{
        [self.rightFourImageView setHighlighted:NO];
    }
    if (_model.isRFiveSelect) {
        [self.rightFiveImageView setHighlighted:YES];
    }else{
        [self.rightFiveImageView setHighlighted:NO];
    }
}

@end
