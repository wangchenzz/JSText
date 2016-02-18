//
//  animationFlashLabel.m
//  1.5-2015
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "animationFlashLabel.h"
@interface animationFlashLabel ()

@property (nonatomic,retain) NSMutableArray *textArray;

@property (nonatomic,retain) NSTimer *acitonTimer;

@property (nonatomic,copy) NSString *inputString;

@property (nonatomic,assign) BOOL isAnimation;

@property (nonatomic,copy)void(^conpletion)(BOOL finsih) ;

@end

@implementation animationFlashLabel
-(instancetype)init{
    if (self = [super init]) {
        
        self.isAnimation = NO;
        
        self.inputString = [NSString string];
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.isAnimation = NO;
        
        self.inputString = [NSString string];
        
    }
    return self;
}

-(void)setText:(NSString *)text{
    
    if (_isAnimation) {
        [super setText:text];
    }
    else{
        NSInteger count = text.length;
        
        for (int i = 0 ; i < count; i ++) {
            NSRange range = NSMakeRange(i, 1);
            NSString *oneStering = [text substringWithRange:range];
            [self.textArray addObject:oneStering];
        }
    }
}

-(NSMutableArray *)textArray{
    
    if (!_textArray) {
        self.textArray = [NSMutableArray array];
    }
    return _textArray;
}

-(void)showAnimation:(float)animationSpace completion:(void (^)(BOOL))completion{
    
    _isAnimation = YES;
    _acitonTimer = [NSTimer scheduledTimerWithTimeInterval:animationSpace target:self selector:@selector(writeT) userInfo:nil repeats:YES];
    
    self.conpletion = completion;
}

-(void)writeT{
    static NSInteger count = 0;
    if (count == _textArray.count) {
        
        _isAnimation = NO;
        
        [self.acitonTimer invalidate];
        
        self.conpletion(_isAnimation);
        
        return;
    }
    self.inputString = [self.inputString stringByAppendingString:_textArray[count]];
    
    [self setText:self.inputString];
    
    count ++;
}

@end
