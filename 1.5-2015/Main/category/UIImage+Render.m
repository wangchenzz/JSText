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


@end
