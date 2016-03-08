//
//  JSDrawView.m
//  1.5-2015
//
//  Created by Mac on 16/1/15.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "JSDrawView.h"

@implementation JSDrawView

- (void)drawRect:(CGRect)rect
{
    //获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 1.0f);
    //线条拐角样式,设置为平滑
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //线条开始样式,设置为平滑
    CGContextSetLineCap(context, kCGLineCapRound);
    if (self.image != nil) {
        CGFloat widthScale = self.frame.size.width / self.image.size.width;
        CGFloat heightScale = self.frame.size.height / self.image.size.height;
        CGFloat resultScale = (widthScale > heightScale) ? heightScale : widthScale;
        [self.image drawInRect:CGRectMake((self.frame.size.width - (self.image.size.width * resultScale)) * 0.5, (self.frame.size.height - (self.image.size.height * resultScale)) * 0.5, self.image.size.width * resultScale, self.image.size.height * resultScale)];
    }
    //画当前的线
    if ([self.pointAry count] > 0) {
        CGContextBeginPath(context);
        CGPoint myStartPoint = CGPointFromString([self.pointAry objectAtIndex:0]);
        CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
        for (int j = 0; j < [self.pointAry count] - 1; j++) {
            CGPoint myEndPoint = CGPointFromString([self.pointAry objectAtIndex:j + 1]);
            CGContextAddLineToPoint(context, myEndPoint.x, myEndPoint.y);
        }
        UIColor *lineColor = [UIColor blackColor];
        float width = 5.0;
        CGContextSetStrokeColorWithColor(context, [lineColor CGColor]);
        CGContextSetLineWidth(context, width);
        CGContextStrokePath(context);
    }
}

/**
 *  存放需要画出来的点的数组
 *
 *  @return ...
 */
-(NSMutableArray *)pointAry{
    
    if (!_pointAry) {
        self.pointAry = [NSMutableArray array];
    }
    return _pointAry;
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch= [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    /**
     *  点 变字符串     点还可以变成 nsvalue;
     *
     *  @param MyBeganpoint 开始点击的点
     *
     *  @return 字符串
     */
    
//    NSValue *vpoint = [NSValue valueWithCGPoint:point];
    
    NSString *sPoint = NSStringFromCGPoint(point);
    [self.pointAry addObject:sPoint];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.pointAry = nil;
    
}



@end
