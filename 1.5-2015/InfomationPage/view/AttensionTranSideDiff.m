//
//  AttensionTranSideDiff.m
//  1.5-2015
//
//  Created by Mac on 16/1/19.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttensionTranSideDiff.h"

#import "SideDiffCell.h"

#import "SideDiffModel.h"

@interface AttensionTranSideDiff ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) UITableView *MainTableView;

@property (nonatomic,retain) NSMutableArray *dataContainArrayl;

@property (nonatomic,retain) NSMutableArray *ImageNameArray;

@property (nonatomic,retain) NSTimer *timeTimer;


@end


@implementation AttensionTranSideDiff


/**
 *  初始化
 *
 *  @param frame 位置
 *
 *  @return 自身
 */
-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.MainTableView = ({
            self.MainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.width, self.height) style:UITableViewStyleGrouped];
            self.MainTableView.delegate = self;
            self.MainTableView.dataSource = self;
            [self addSubview:self.MainTableView];
            self.MainTableView;
        });
             [self addDataToDataArray:42];
    
    
    }
    return self;
}

/**
 *  存放数据源的数组
 *
 *  @return 返回数组 懒加载
 */

-(NSMutableArray *)dataContainArrayl{

    if (!_dataContainArrayl) {
        self.dataContainArrayl = [NSMutableArray new];
    }
    return _dataContainArrayl;
}

#pragma mark - tableviewdelegate


/**
 *  以分组的形式显示
 *
 *  @param tableView ...
 *
 *  @return ...
 */

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataContainArrayl.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SideDiffCell *cell = [SideDiffCell cellForTableview:self.MainTableView];
    
    [cell.tap1 addTarget:self action:@selector(clickImage:)];
    [cell.tap2 addTarget:self action:@selector(clickImage:)];
    [cell.tap3 addTarget:self action:@selector(clickImage:)];
    [cell.tap4 addTarget:self action:@selector(clickImage:)];
    [cell.tap5 addTarget:self action:@selector(clickImage:)];
    
    return cell;
}


-(void)clickImage:(UITapGestureRecognizer*)tap{

    CGPoint touchpoint = [tap locationInView:self.MainTableView];
   
    //知道现在点了那个分组,怎么知道点了那张图片呢?
    NSIndexPath *indexPath = [self.MainTableView indexPathForRowAtPoint:touchpoint];
    
    SideDiffCell *cell = [self.MainTableView cellForRowAtIndexPath:indexPath];
    SideDiffModel *model = self.dataContainArrayl[indexPath.section];
    if (cell.tap1 == tap) {
        model.isRFirstSelect = YES;
    }
    if (cell.tap2 == tap) {
        model.isRTwoSelect = YES;
    }
    if (cell.tap3 == tap) {
        model.isRThreeSelect = YES;
    }
    if (cell.tap4 == tap) {
        model.isRFourSelect = YES;
    }
    if (cell.tap5 == tap) {
        model.isRFiveSelect = YES;
    }
    [self.MainTableView reloadData];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 720;

}


/**
 *  此处填充数据源 优化显示
 *
 *  @param tableView ...
 *  @param cell      ...
 *  @param indexPath ...
 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    SideDiffCell *newcell = (SideDiffCell *)cell;
    newcell.model = self.dataContainArrayl[indexPath.section];
    
}

/**
 *  存放图片名称的数组
 *
 *  @return 懒加载
 */

-(NSMutableArray *)ImageNameArray{

    if (!_ImageNameArray) {
        self.ImageNameArray = [NSMutableArray new];
        self.ImageNameArray = [@[@"AttentionTransferTest1",@"AttentionTransferTest2",@"AttentionTransferTest3",@"AttentionTransferTest4",@"AttentionTransferTest5"] mutableCopy];
    }
    return _ImageNameArray;
}

/**
 *  创建模型,随机决定图片排布;
 */

-(void)addDataToDataArray:(NSInteger)count{

    for (int i = 0 ; i < count;  i ++) {
     
        SideDiffModel *model = [SideDiffModel model];
        model.leftOneImage = [self roll];
        model.leftTwoImage = [self roll];
        model.rightOneImage = [self roll];
        model.rightTwoImage = [self roll];
        model.rightThreeImage = [self roll];
        model.rightFourImage = [self roll];
        model.rightFiveImage = [self roll];
        [self.dataContainArrayl addObject:model];
    }
}

/**
 *  roll名字;
 */

-(NSString*)roll{

    return self.ImageNameArray[arc4random()%(self.ImageNameArray.count)];

}

#warning not end --------没有添加定时器来确认反应时间 , 也没有定义何时结束测试;

@end
