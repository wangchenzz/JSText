//
//  UIImage+Render.m
//  1.5-2015
//
//  Created by Mac on 16/1/8.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "UIImage+Render.h"

@implementation UIImage (Render)



//经过渲染的图片返回。
+(instancetype)imageWithRenderNamed:(NSString*)string{
    
    UIImage *image = [UIImage imageNamed:string];

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}



/**
 *  这个方法能返回一张指定颜色 透明度的图片
 *
 *  @param color 指定的颜色和透明度
 *
 *  @return 图片
 */
+(UIImage *)imageWithBgColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

-(UIColor*)colorForImage{

    UIColor *bgColor = [UIColor colorWithPatternImage: self];
    

    return bgColor;
}


@end
