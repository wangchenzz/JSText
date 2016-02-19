//
//  ErrorProfingCell.m
//  1.5-2015
//
//  Created by Mac on 16/1/21.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "ErrorProfingCell.h"

@implementation ErrorProfingCell

-(instancetype)init{
    if (self = [super init]) {
        self.viewImage = [[UIImageView alloc]init];
        self.viewImage.frame = CGRectMake(10, 10, 64, 64);
        [self.contentView addSubview:self.viewImage];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.viewImage = [[UIImageView alloc]init];
        self.viewImage.frame = CGRectMake(10, 10, 64, 64);
        [self.contentView addSubview:self.viewImage];

    }

    return self;
}

+(instancetype)cellForCollectionView:(UICollectionView*)collection andIndexPath:(NSIndexPath*)indexPath{

//    NSString *const indentifer = @"ErrorProfingCell";
    
    
    ErrorProfingCell *cell = [collection dequeueReusableCellWithReuseIdentifier:@"ErrorProfingCell" forIndexPath:indexPath];
    
    if (!cell) {
        
    }
    
    return cell;
}

-(void)setModel:(ErrorProfingModel *)model{

    _model = model;
    
#warning  photo  图没换...
                                                      // 三角                   //园
    NSString *imagestring = (_model.imageType > 0) ? @"AttentionTransferTest2":@"AttentionTransferTest1";
    
    self.viewImage.image = [UIImage imageNamed:imagestring];
                                                          //被选中的图片
    self.viewImage.highlightedImage = [UIImage imageNamed:@"AttentionTransferTest3"];
    
    self.viewImage.highlighted = _model.selected;
}


@end
