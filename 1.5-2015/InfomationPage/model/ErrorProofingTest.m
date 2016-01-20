


//
//  ErrorProofingTest.m
//  1.5-2015
//
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "ErrorProofingTest.h"
#import <AudioToolbox/AudioToolbox.h>
@interface ErrorProofingTest ()

@property (nonatomic,assign) SystemSoundID avid1;

@property (nonatomic,assign) SystemSoundID avid2;

@property (nonatomic,retain) UIImage *image1;

@property (nonatomic,retain) UIImage *image2;


@end

@implementation ErrorProofingTest


-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)setUpAudio{

    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avid1);
    
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avid2);

}
//注册语音的语音URL；
/**
 *  得到注册音效的 URL
 *
 *  @param filename  文件名
 *
 *  @return 文件 URL
 */
-(NSURL *)regsoundForFile:(NSString*)filename{
    NSString *path = [[NSBundle mainBundle]resourcePath];
    path = [path stringByAppendingPathComponent:filename];
    NSURL *url = [NSURL fileURLWithPath:path];
    return url;
}

@end
