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
            self.MainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.width, self.height)];
            self.MainTableView.delegate = self;
            self.MainTableView.dataSource = self;
            self.MainTableView;
        });
    }
    return self;
}


-(NSMutableArray *)dataContainArrayl{

    if (!_dataContainArrayl) {
        self.dataContainArrayl = [NSMutableArray new];
    }
    return _dataContainArrayl;
}

#pragma mark - tableviewdelegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataContainArrayl.count;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SideDiffCell *cell = [SideDiffCell cellForTableview:self.MainTableView];
    
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 500;

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{



}





@end
