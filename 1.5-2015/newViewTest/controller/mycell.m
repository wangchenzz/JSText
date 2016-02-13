//
//  mycell.m
//  testTableview
//
//  Created by Mac on 16/2/3.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "mycell.h"

@implementation mycell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        self.imageMyView = [[UIImageView alloc] initWithFrame:CGRectMake(0, - 100, 414, 250 +200)];
        
        self.coverview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 250)];
        
        [self.coverview setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.3]];
        
        /**
         *  这个很关键, 不然会让图形到外面去;
         */
        self.clipsToBounds = YES;
        
        _imageMyView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.contentView addSubview:self.imageMyView];
        
        [self.contentView addSubview:self.coverview];
    }

    return self;
}

-(void)starAnimate{

    /**
     *  self.superview.superview.superview === self.windows;
     */
    
    CGRect cellrect = [self convertRect:self.bounds toView:self.superview.superview.superview];
    
    NSLog(@"%@",self.superview);
    
    CGPoint contentCenter = self.superview.center;
    
    CGFloat MINY = CGRectGetMidY(cellrect);
    
    CGFloat celloffset = MINY - contentCenter.y;
    
    CGFloat scale = celloffset / self.superview.frame.size.height * 2;
    
    CGFloat offset = scale * 100;
    
    CGAffineTransform picTransform = CGAffineTransformMakeTranslation(0, -offset);

    self.imageMyView.transform = picTransform;
    
}

/**
 *  transform 动画是 基于 frame 的动画
 *
 *  @return <#return value description#>
 */

- (CGFloat)cellOffset {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:self.window];
    CGFloat centerY = CGRectGetMidY(centerToWindow);
    
    CGPoint windowCenter = self.superview.center;
    
    
    
    /**
     *  cell 在 view 中的位置. 最小 y 值. centerY;  中心点的 y 值得差为 celloffset Y;
     */
    
    /**
     *  偏移中点的比例 offsetDig 是0到1之间的数字.
     */
    
    /**
     *  offset 则是图片多出来的部分 一半 * 比例;  有正负的;
     */
    
    /**
     *  刚出现的 cell  offset 是负值. 而且是由 超出比例来决定露出多少来,
     */
    
    /**
     *  返回值就是这个偏移值, 可能为负值;
     */
    CGFloat cellOffsetY = centerY - windowCenter.y;
    
    CGFloat offsetDig =  cellOffsetY / self.superview.frame.size.height *2;
    CGFloat offset =  -offsetDig * 100;
    
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0,offset);
    
    self.imageMyView.transform = transY;
    
    return offset;
    
}
@end
