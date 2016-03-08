//
//  pointView.m
//  1.5-2015
//
//  Created by Mac on 16/1/22.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "pointView.h"

@implementation pointView

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 1);
    CGContextSetRGBFillColor (context, 0, 0, 0, 1.0);//设置填充颜色
    
    
    CGContextSetLineWidth(context, 2.0);
    
    for (int i = 0 ; i < self.drawCount; i ++) {
        int maxX = (int)CGRectGetMaxX(self.frame)-20;
        int maxY = (int)CGRectGetMaxY(self.frame)-20;
        NSInteger x = arc4random()%maxX + 10;
        NSInteger y = arc4random()%maxY + 10;
        
        CGContextAddEllipseInRect(context, CGRectMake(x, y, 10, 10));//在这个框中画圆
    }
    
    CGContextDrawPath(context, kCGPathFill);//绘制填充
    
    CGContextStrokePath(context);
    
    
}

-(void)setDrawCount:(NSInteger)drawCount{
    
    _drawCount = drawCount;
    
    [self setNeedsDisplay];
    
}



@end
