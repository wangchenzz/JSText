//
//  SideDiffModel.m
//  1.5-2015
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "SideDiffModel.h"

@implementation SideDiffModel

+(instancetype)model{

    return [[self alloc]init];

}

-(instancetype)init{

    if (self = [super init]) {
     
        CGFloat JSBef = 20;
        CGFloat JSImageWid = 120;
        CGFloat JSScreenWid = JSFrame.size.width;
        CGFloat JSRightImageX = JSScreenWid - JSBef - JSImageWid;
        
        self.rightOneImager = CGRectMake(JSRightImageX, JSBef, JSImageWid, JSImageWid);
        
        self.rightTwoImager = CGRectMake(JSRightImageX, CGRectGetMaxY(self.rightOneImager) + JSBef, JSImageWid, JSImageWid);
        
        self.rightThreeImager = CGRectMake(JSRightImageX, CGRectGetMaxY(self.rightTwoImager)+JSBef, JSImageWid, JSImageWid);
        
        self.rightFourImager = CGRectMake(JSRightImageX, CGRectGetMaxY(self.rightThreeImager)+JSBef, JSImageWid, JSImageWid);
        
        self.rightFiveImager = CGRectMake(JSRightImageX, CGRectGetMaxY(self.rightFourImager)+JSBef, JSImageWid, JSImageWid);
        
        self.leftOneImager = CGRectMake(JSBef, CGRectGetMinY(self.rightTwoImager), JSImageWid, JSImageWid);
        
        self.leftTwoImager = CGRectMake(JSBef, CGRectGetMinY(self.rightFourImager), JSImageWid, JSImageWid);
    }
    return self;
}


@end
