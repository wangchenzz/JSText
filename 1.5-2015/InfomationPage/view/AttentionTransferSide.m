//
//  AttentionTransferSide.m
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionTransferSide.h"

#import "JSSideTestCell.h"

@interface AttentionTransferSide ()<UITableViewDataSource,UITableViewDelegate>


/**
 *  左侧tableview。 会展示图片；
 */

@property (nonatomic,retain) UITableView *mainTableView;

/**
 *  右侧视图。会显示数字
 */

@property (nonatomic,retain) UIView *rightView;

/**
 *  五张图片，循环闪出
 */

@property (nonatomic,retain) UIImage *firstImage;

@property (nonatomic,retain) UIImage *secondImage;

@property (nonatomic,retain) UIImage *thirdImage;

@property (nonatomic,retain) UIImage *forthImage;

@property (nonatomic,retain) UIImage *fifthImage;

/**
 *  存放测试数据的数组；
 */

@property (nonatomic,retain) NSMutableArray *dataArray;



@end


@implementation AttentionTransferSide


/**
 *  重写初始化方法
 *
 *  @param frame 父视图中的位置
 *
 *  @return 自身
 */

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self setUpAllUi];
        
        [self setUpImage];
    }
    return self;
}

/**
 *  初始化 所有的UI控件。设置好各种属性。
 */

-(void)setUpAllUi{

    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width *.5, self.frame.size.height)];
    
    self.rightView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width*.5, 0, self.frame.size.width*.5, self.frame.size.height)];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    [self addSubview:self.mainTableView];
    [self addSubview:self.rightView];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
    
        if (self.dataArray.count >= 540) {
            [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
        
            return ;
        }
        
        [self addToArray:20];
        
        self.mainTableView.mj_footer.state = MJRefreshStateIdle;
        
        [self.mainTableView reloadData];
        
        
    }];
    
    self.mainTableView.mj_footer = footer;
    
}

-(void)setUpImage{

    self.firstImage = [UIImage imageNamed:@"AttentionTransferTest1"];
    self.secondImage = [UIImage imageNamed:@"AttentionTransferTest2"];
    self.thirdImage = [UIImage imageNamed:@"AttentionTransferTest3"];
    self.forthImage = [UIImage imageNamed:@"AttentionTransferTest4"];
    self.fifthImage = [UIImage imageNamed:@"AttentionTransferTest5"];
}
/**
 *  往数组中添加图片;
 *
 *  @param count 添加的张数
 *
 *  @return ...
 */
-(void)addToArray:(NSInteger)count{

    for (int i = 0; i < count; i++) {
        JSSideTestModel *model = [JSSideTestModel model];
        model.disImage = [self rollImage];
        [self.dataArray addObject:model];
    }
}


-(UIImage*)rollImage{
    
    NSInteger rollNum = arc4random()%5;
    
    switch (rollNum) {
        case 0:
            return self.firstImage;
            break;
        case 1:
            return self.secondImage;
            break;
        case 2:
            return self.thirdImage;
            break;
        case 3:
            return self.forthImage;
            break;
        case 4:
            return self.fifthImage;
            break;
        default:
            break;
    }
    return nil;
}


-(NSMutableArray *)dataArray{

    if (!_dataArray) {
        
        self.dataArray = [NSMutableArray new];
        
        [self addToArray:40];
    }
    return _dataArray;
}



#pragma mark - tableviewdelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 150;


}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    JSSideTestCell *cell = [JSSideTestCell cellForTableview:self.mainTableView];
   // cell.model = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    JSSideTestCell *newcell = (JSSideTestCell*)cell;
    newcell.model = [self.dataArray objectAtIndex:indexPath.row];
//
    
}

/**
 *  点击事件的响应. 需要改变数组模型中的数据,标记是否点击过和当前时间;
 *
 *  @param tableView ...
 *  @param indexPath ...
 */

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    JSSideTestModel *model = [self.dataArray objectAtIndex:indexPath.row];
    model.isSelect = YES;
    /**
     *  此处要修改;
     */
    model.selectTime = 0;
    [tableView reloadData];
}

@end
