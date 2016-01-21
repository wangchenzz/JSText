
//
//  ErrorProfingModel.m
//  1.5-2015
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "ErrorProfingModel.h"

@implementation ErrorProfingModel

-(BOOL)isRight{
    return self.imageType == self.voiceType;
}

//-(NSString*)description{
//
//    return [NSString stringWithFormat:@"%d",self.isRight];
//
//}
@end
