//
//  PictureAndPointModel.m
//  1.5-2015
//
//  Created by Mac on 16/1/22.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "PictureAndPointModel.h"

@implementation PictureAndPointModel

-(BOOL)isFocus{

    return (self.pointCount == self.selectedCount);

}

-(instancetype)initWithImageName:(NSString*)name andWithPointCount:(NSInteger)count{

    if (self = [super init]) {
        self.imageName = name;
        self.pointCount = count;
    }
    return self;
}

@end
