//
//  errorHeader.m
//  1.5-2015
//
//  Created by Mac on 16/1/21.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "errorHeader.h"

@implementation errorHeader

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
      
        self.titleLabel = [[UILabel alloc]init];
        
        self.titleLabel.width = 150;
        self.titleLabel.height = 38;
        
        self.titleLabel.centerX = self.centerX;
        
        self.titleLabel.centerY = self.centerY;
        
        [self setBackgroundColor:[UIColor lightGrayColor]];
        
//        [self.titleLabel setBackgroundColor:[UIColor blueColor]];
        
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [self addSubview:self.titleLabel];
        
    }
    return self;
}




@end
