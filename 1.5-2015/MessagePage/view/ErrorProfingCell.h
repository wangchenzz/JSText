//
//  ErrorProfingCell.h
//  1.5-2015
//
//  Created by Mac on 16/1/21.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ErrorProfingModel.h"
@interface ErrorProfingCell : UICollectionViewCell

@property (nonatomic,retain) UIImageView *viewImage;

@property (nonatomic,retain) UILabel *label;

@property (nonatomic,assign) ErrorProfingModel *model;

+(instancetype)cellForCollectionView:(UICollectionView*)collection andIndexPath:(NSIndexPath*)indexPath;

@end
