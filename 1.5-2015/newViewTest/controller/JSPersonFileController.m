//
//  ViewController.m
//  navigationBarAnimation
//
//  Created by Mac on 16/1/22.
//  Copyright © 2016年  竞思. All rights reserved.
//

#import "JSPersonFileController.h"

#import "mycell.h"

#import "handEyeGameController.h"

#define kScreenWith [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

const CGFloat kNavigationBarHeight = 44;
const CGFloat kStatusBarHeight = 20;

@interface JSPersonFileController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, strong) UIView *headerContentView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGFloat scale;

@property (nonatomic, retain) NSMutableArray *ary;
@end

@implementation JSPersonFileController
- (void)viewDidLoad {
    
    
    self.ary = [NSMutableArray array];
    
    [super viewDidLoad];
    self.headerHeight = 260;
    [self.view addSubview:self.tableView];
    
//    [self.navigationController.navigationBar setHidden: YES];
    
    [self.tabBarController.tabBar setHidden: YES];
    
    [self setUpHeader];
}

-(void)setUpHeader{
    //header
    CGRect bounds = CGRectMake(0, 0, kScreenWith, self.headerHeight);
    UIView *contentView = [[UIView alloc] initWithFrame:bounds];
    contentView.backgroundColor = [UIColor blackColor];
    //背景
    UIImageView *headerImageView = [[UIImageView alloc] init];
    headerImageView.bounds = bounds;
    headerImageView.center = contentView.center;
    headerImageView.image = [UIImage imageNamed:@"span1"];
    
    //    [headerImageView setContentMode:UIViewContentModeScaleAspectFit];
    contentView.layer.masksToBounds = YES;
    
    self.headerImageView = headerImageView;
    self.headerContentView = contentView;
    [self.headerContentView addSubview:self.headerImageView];
    self.headerContentView.layer.masksToBounds = YES;
    
    //信息内容
    CGRect icon_frame = CGRectMake(12, self.headerContentView.bounds.size.height-80-12, 80, 80);
    UIImageView *icon = [[UIImageView alloc] initWithFrame:icon_frame];
    icon.backgroundColor = [UIColor clearColor];
    icon.image = [UIImage imageNamed:@"dkaspjhsfsa'd.as"];
    icon.layer.cornerRadius = 80/2.0f;
    icon.layer.masksToBounds = YES;
    icon.layer.borderWidth = 1.0f;
    icon.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.headerContentView addSubview:icon];
    self.icon = icon;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(108, self.headerContentView.bounds.size.height-60-12, kScreenWith-108-12, 50)];
    label.text = @"提高学员注意力和读写能力，是我们所有竞思人的使命！!";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:15];
    label.numberOfLines = 0;
    self.label = label;
    [self.headerContentView addSubview:self.label];
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:bounds];
    [headerView addSubview:self.headerContentView];
    self.tableView.tableHeaderView = headerView;;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSArray *cellarray = self.tableView.visibleCells;

    for (mycell *cell in cellarray) {
            [cell cellOffset];
    }
    CGFloat offset_Y = scrollView.contentOffset.y;
    
    CGFloat alpha = (offset_Y + 40)/300.0f;
    
    UIColor *color = [UIColor colorWithRed:57/255.0 green:104/255.0 blue:55/255.0 alpha:alpha];
    
    UIImage *image = [UIImage imageWithBgColor:color];
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    if (offset_Y < -64) {
        //放大比例
        CGFloat add_topHeight = -(offset_Y+kNavigationBarHeight+kStatusBarHeight);
        self.scale = (self.headerHeight+add_topHeight)/self.headerHeight;
        //改变 frame
        CGRect contentView_frame = CGRectMake(0, -add_topHeight, kScreenWith, self.headerHeight+add_topHeight);
        self.headerContentView.frame = contentView_frame;
        CGRect imageView_frame = CGRectMake(-(kScreenWith*self.scale-kScreenWith)/2.0f,
                                            0,
                                            kScreenWith*self.scale,
                                            self.headerHeight+add_topHeight);
        self.headerImageView.frame = imageView_frame;
        
        CGRect icon_frame = CGRectMake(12, self.headerContentView.bounds.size.height-80-12, 80, 80);
        self.icon.frame = icon_frame;
        
        self.label.frame = CGRectMake(108, self.headerContentView.bounds.size.height-60-12, kScreenWith-108-12, 50);
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    mycell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[mycell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSString *imagestr = [NSString stringWithFormat:@"span%ld",indexPath.row % 5 + 1];
    
    cell.imageMyView.image = [UIImage imageNamed:imagestr];
    
    if (indexPath.row == 1) {
        cell.imageMyView.image = [UIImage imageNamed:@"handeyegamebackround"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    mycell *selfcell = (mycell *)cell;
    
    [selfcell cellOffset];
    
    if (![_ary containsObject:@(indexPath.row)]) {
        
        cell.transform = CGAffineTransformMakeScale(0.8, 0.8);
        [UIView animateWithDuration:0.6 animations:^{
            cell.layer.shadowColor = [[UIColor blackColor]CGColor];
            cell.layer.shadowOffset = CGSizeMake(10, 10);
            cell.alpha = 1;
            cell.layer.shadowOffset = CGSizeMake(0, 0);
            cell.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
    
    [_ary addObject:@(indexPath.row)];

    
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 250;

}
-(UITableView *)tableView{
    if (_tableView == nil) {
        
        CGRect tableView_frame = CGRectMake(0, -64, kScreenWith, kScreenHeight+kNavigationBarHeight+kStatusBarHeight);
        _tableView = [[UITableView alloc] initWithFrame:tableView_frame style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        
        _tableView.separatorStyle = NO;
        
    }
    
    return _tableView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    handEyeGameController *egc = [[handEyeGameController alloc] init];
    
    [self.navigationController pushViewController:egc animated:YES];
    
    egc.navigationController.navigationBarHidden = YES;
    
    egc.navigationController.toolbarHidden = YES;
}


@end
