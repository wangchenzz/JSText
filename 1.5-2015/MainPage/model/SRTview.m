//
//  SRTview.m
//  舒尔特方块
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "SRTview.h"

@interface SRTview ()

@property (nonatomic,retain) SRTtest *test;

@property (nonatomic,assign) NSInteger testCount;



@property (nonatomic,retain) NSMutableArray *indexArray;

@end

@implementation SRTview

-(instancetype)initWihtSRTtest:(LevelState)level{
    
    if (self = [super init]) {
        self.test = [[SRTtest alloc]initWithLevel:level];
    }
    return self;
}
-(instancetype)init{

    if (self = [super init]) {
        self.test = [[SRTtest alloc]init];
    }
    return self;
}
-(NSMutableArray *)indexArray{

    if (!_indexArray) {
        self.indexArray = [NSMutableArray array];
    }

    return _indexArray;
}

-(NSInteger)testCount{
    
    return [self.test getTestNumber];
    
}


-(NSMutableArray*)dataSourceArray{
    
    return self.test.dataSourceArray;
    
}

-(void)setDataSourceArray:(NSMutableArray *)dataSourceArray{

    self.test.dataSourceArray = dataSourceArray;
    
    self.test.testCount = dataSourceArray.count;
}

-(void)testIn:(UIViewController*)control{
    
    int indexcount = arc4random()%(self.testCount);
    
    NSString *indexstr = [NSString stringWithFormat:@"%d",indexcount];

    NSInteger count = sqrt((self.testCount));
    
    
    for (int i = 0; i < count; i ++) {
     
        for (int j = 0; j < count; j ++) {
            UIButton *buto = [[UIButton alloc]init];
            
            [buto setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:0.8]];
            
            CGFloat with = (self.bounds.size.width-(count -1)*2) / count;
            
            for (; [self.indexArray containsObject:indexstr]; indexstr = [NSString stringWithFormat:@"%ld",arc4random()%(self.testCount)]) {
            }
            
            [self.indexArray addObject:indexstr];
            int a = [indexstr intValue];
            
            [buto setTitle:self.dataSourceArray[a] forState:UIControlStateNormal];
        
            [buto setFrame:CGRectMake(0+(with +2)*i, 0+(with +2)*j, with, with)];
            
            [self addSubview:buto];
            
            buto.layer.cornerRadius = 5;
            
            buto.clipsToBounds = YES;
            
            [buto addTarget:self action:@selector(clickButo:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    [control.view addSubview:self];
}

-(void)clickButo:(UIButton*)sender{

   // NSLog(@"%@",sender.titleLabel.text);
    
    if ([self.delegate respondsToSelector:@selector(SRTviewDidClickButton:andButton:)]) {
        [self.delegate SRTviewDidClickButton:self andButton:sender];
    }
}


@end
