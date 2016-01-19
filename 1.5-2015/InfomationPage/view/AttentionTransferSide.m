//
//  AttentionTransferSide.m
//  1.5-2015
//
//  Created by Mac on 16/1/18.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "AttentionTransferSide.h"

#import "JSSideTestCell.h"

#import <AudioToolbox/AudioToolbox.h>

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


/**
 *  计时器
 */

@property (nonatomic,retain) NSTimer *timeTimer;

@property (nonatomic,retain) NSTimer *actionTimer;

@property (nonatomic,assign) SystemSoundID avid;


/**
 *  时间
 */
@property (nonatomic,assign) float timeCount;


@property (nonatomic,weak) UIButton *Button1;
@property (nonatomic,weak) UIButton *Button2;
@property (nonatomic,weak) UIButton *Button3;
@property (nonatomic,weak) UIButton *Button4;
@property (nonatomic,weak) UIButton *Button5;
@property (nonatomic,weak) UIButton *Button6;
@property (nonatomic,weak) UIButton *Button7;
@property (nonatomic,weak) UIButton *Button8;
@property (nonatomic,weak) UIButton *Button9;
@property (nonatomic,weak) UIButton *Button0;

/** roll的x */
@property (nonatomic,assign) NSInteger centrollx;


/** roll的y */
@property (nonatomic,assign) NSInteger centrolly;

/** 导航栏的高度 */
@property (nonatomic,assign) NSInteger naviH;


/** Button 的x */
@property (nonatomic,assign) CGFloat Buttoncenterx;


/** Button 的y */
@property (nonatomic,assign) CGFloat Buttoncentery;


/** 是否重叠 */
@property (nonatomic,readonly,getter=isCD) BOOL CD;

/** 10个Button 的位置 */
@property (nonatomic,retain) NSMutableArray *sizeAty;

@end

#define ButtonWidth self.rightView.width*.2
@implementation AttentionTransferSide
-(UIButton *)Button0{

    if (!_Button0) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        Button.height = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"0" forState:UIControlStateNormal];
        [self.rightView addSubview:Button];
        self.Button0 = Button;
    }
    return _Button0;
}
-(UIButton *)Button1{

    if (!_Button1) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        Button.height = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [Button setTitle:@"1" forState:UIControlStateNormal];
        [self.rightView addSubview:Button];
        self.Button1 = Button;
    }
    return _Button1;
}
-(UIButton *)Button2{

    if (!_Button2) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        Button.height = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"2" forState:UIControlStateNormal];
        [self.rightView addSubview:Button];
        self.Button2 = Button;
    }
    return _Button2;
}
-(UIButton *)Button3{

    if (!_Button3) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        Button.height = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"3" forState:UIControlStateNormal];
        [self.rightView addSubview:Button];
        self.Button3 = Button;
    }
    return _Button3;
}
-(UIButton *)Button4{

    if (!_Button4) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        Button.height = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"4" forState:UIControlStateNormal];
        [self.rightView addSubview:Button];
        self.Button4 = Button;
    }
    return _Button4;
}
-(UIButton *)Button5{

    if (!_Button5) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        Button.height = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"5" forState:UIControlStateNormal];
        [self.rightView addSubview:Button];
        self.Button5 = Button;
    }
    return _Button5;
}
-(UIButton *)Button6{

    if (!_Button6) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        Button.height = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"6" forState:UIControlStateNormal];
        [self.rightView addSubview:Button];
        self.Button6 = Button;
    }
    return _Button6;
}
-(UIButton *)Button7{

    if (!_Button7) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"7" forState:UIControlStateNormal];
        Button.height = ButtonWidth;
        [self.rightView addSubview:Button];
        self.Button7 = Button;
    }
    return _Button7;
}
-(UIButton *)Button8{

    if (!_Button8) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        Button.height = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"8" forState:UIControlStateNormal];
        [self.rightView addSubview:Button];
        self.Button8 = Button;
    }
    return _Button8;
}
-(UIButton *)Button9{

    if (!_Button9) {
        UIButton *Button = [[UIButton alloc]init];
        Button.width = ButtonWidth;
        [Button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          [Button setTitle:@"9" forState:UIControlStateNormal];
        Button.height = ButtonWidth;
        [self.rightView addSubview:Button];
        
        
        self.Button9 = Button;
    }
    return _Button9;
    
}

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
        
        [self setUpProper];
 
        [self setUpTimer];
       
    }
    return self;
}

/**
 *  设置定时器
 */

-(void)setUpTimer{

    self.timeCount = 0;
    
    self.timeTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(time) userInfo:nil repeats:YES];
    
    self.actionTimer = [NSTimer timerWithTimeInterval:30 target:self selector:@selector(action) userInfo:nil repeats:YES];
    

}

/**
 *  外部接口, 开始测试.
 */
-(void)test{

    [[timerTool tool]fireInTheHoll:self.timeTimer];
    
    [[timerTool tool]fireInTheHoll:self.actionTimer];

    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        if (self.dataArray.count >= 540) {
            [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
            
            return ;
        }
        
        
        
        self.mainTableView.mj_footer.state = MJRefreshStateIdle;
        [self addToArray:20];
        [self.mainTableView reloadData];
        
        
    }];
    
    self.mainTableView.mj_footer = footer;

    
    
    [self addToArray:40];
    
    [self.mainTableView reloadData];
    
}

/**
 *  计算时间的方法
 */
-(void)time{

    self.timeCount = self.timeCount + 0.01;
    
    if (self.timeCount) {
        
    }
    
}
#warning  -  没有定义什么时候结束.

/**
 *  没过30s 之后都会调用这个方法;
 */
-(void)action{

    [self rollAllButton];
    AudioServicesPlayAlertSound(self.avid);
    self.mainTableView.userInteractionEnabled = NO;
}


/**
 *  按钮点击事件
 *
 *  @param sender  按钮对象
 */
-(void)clickButton:(UIButton*)sender{
    
    [self hideAllButton];
    self.mainTableView.userInteractionEnabled = YES;
    
}


/**
 *  调整属性;
 */
-(void)setUpProper{

    //屏幕宽高；
    NSInteger wid = self.rightView.width;
    NSInteger heig = self.rightView.height;
    
    NSInteger Buttonw = ButtonWidth;
    self.centrollx = wid - Buttonw;
    self.centrolly = heig - Buttonw;
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)([self regsoundForFile:@"1.caf"]), &_avid);
}

/**
 *  根据文件名 得到沙盒中的路径;
 *
 *  @param filename 文件名
 *
 *  @return  URL
 */
-(NSURL *)regsoundForFile:(NSString*)filename{
    NSString *path = [[NSBundle mainBundle]resourcePath];
    path = [path stringByAppendingPathComponent:filename];
    NSURL *url = [NSURL fileURLWithPath:path];
    return url;
}

/**
 *  初始化 所有的UI控件。设置好各种属性。
 */

-(void)setUpAllUi{

    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width*.5, self.frame.size.height)];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    [self addSubview:self.mainTableView];

    self.rightView = ({
    
        
    self.rightView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width*.5, 0, self.frame.size.width*.5, self.frame.size.height)];
    [self.rightView setBackgroundColor:[UIColor blackColor]];
        
    [self addSubview:self.rightView];
        
        
    self.rightView;
        
    });
    
}

-(void)setUpImage{

    self.firstImage = [UIImage imageNamed:@"AttentionTransferTest1"];
    self.secondImage = [UIImage imageNamed:@"AttentionTransferTest2"];
    self.thirdImage = [UIImage imageNamed:@"AttentionTransferTest3"];
    self.forthImage = [UIImage imageNamed:@"AttentionTransferTest4"];
    self.fifthImage = [UIImage imageNamed:@"AttentionTransferTest5"];
}

-(void)rollAllButton{
    self.sizeAty = nil;
    [self setButtonFrame:self.Button0];
    [self setButtonFrame:self.Button1];
    [self setButtonFrame:self.Button2];
    [self setButtonFrame:self.Button3];
    [self setButtonFrame:self.Button4];
    [self setButtonFrame:self.Button5];
    [self setButtonFrame:self.Button6];
    [self setButtonFrame:self.Button7];
    [self setButtonFrame:self.Button8];
    [self setButtonFrame:self.Button9];
}

-(void)hideAllButton{

    [self.Button0 removeFromSuperview];
    [self.Button1 removeFromSuperview];
    [self.Button2 removeFromSuperview];
    [self.Button3 removeFromSuperview];
    [self.Button4 removeFromSuperview];
    [self.Button5 removeFromSuperview];
    [self.Button6 removeFromSuperview];
    [self.Button7 removeFromSuperview];
    [self.Button8 removeFromSuperview];
    [self.Button9 removeFromSuperview];
}

-(NSMutableArray *)sizeAty{

    if (!_sizeAty) {
        self.sizeAty = [NSMutableArray new];
    }
    return _sizeAty;
}


/**
 *  随机位置 和数字
 *  需求变了
 *  @param Button
 */
-(void)setButtonFrame:(UIButton*)Button{
    //判断位置是否占有;
    while (self.CD == NO) {
    }
    Button.centerX = self.Buttoncenterx;
    Button.centerY = self.Buttoncentery;

    CGRect Buttonrect = CGRectMake(Button.centerX, Button.centerY, 0, 0);

    NSValue *rect = [NSValue valueWithCGRect:Buttonrect];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:rect forKey:@"size"];

    [self.sizeAty addObject:dic];

    [Button setBackgroundColor:[UIColor redColor]];
}

/**
 *  以此判断roll的值是否会和其他的重叠；
 *  需求变了.
 *  @return panduan
 */
-(BOOL)isCD{
    NSInteger conterx = arc4random()%(self.centrollx);
    NSInteger centery = arc4random()%(self.centrolly);
    CGFloat centerX = conterx+ButtonWidth*.5;
    CGFloat centerY = centery+ButtonWidth*.5;    
    if (self.sizeAty.count == 0) {
        self.Buttoncenterx = centerX;
        self.Buttoncentery = centerY;
        return YES;
    }

    for (NSDictionary *objectDic in self.sizeAty) {

        NSValue *value = [objectDic objectForKey:@"size"];
        CGRect obrect = [value CGRectValue];

        if (ABS(obrect.origin.x - centerX) < ButtonWidth) {
            if (ABS(obrect.origin.y - centerY) < ButtonWidth) {
                return NO;
            }
        }
    }
    self.Buttoncenterx = centerX;
    self.Buttoncentery = centerY;
    return YES;
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
    model.selectTime = self.timeCount;
    [tableView reloadData];
}

@end
