//
//  RegistInfoController.m
//  1.5-2015
//
//  Created by Mac on 16/1/5.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "RegistInfoController.h"
#import "JSDatePiker.h"
#import "RegistInfoCell.h"
#import <SMS_SDK/SMSSDK.h>

@interface RegistInfoController ()<JSDatePikerDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,retain) NSArray *PloceAry;

@property (nonatomic,retain) NSMutableArray *infoAry;

@property (nonatomic,weak) JSDatePiker *datePiker;

@property (nonatomic,weak) UIPickerView *genderPiker;


@end

@implementation RegistInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning delete
    
    self.tableView.scrollEnabled = NO;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"确定" andImage:nil targat:self action:@selector(Regist) forControlEvents:UIControlEventTouchUpInside];
    
  //  self.tabBarController.tabBar.hidden = YES;
    
   
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showKeyBoard) name:UIKeyboardWillShowNotification object:nil];
}

-(void)Regist{
    
#warning continued
    RegistInfoCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    NSString * str = cell.writeFiled.text;
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:str zone:@"86" customIdentifier:nil result:^(NSError *error) {
      JSLog(@"%@",error);
  }];
}
-(void)showKeyBoard{

    [self hideDatePiker];
    [self hidePikerView];

}

-(instancetype)initWithStyle:(UITableViewStyle)style{

    if (self = [super initWithStyle:style]) {
        
    }
    return self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.PloceAry.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    RegistInfoCell *cell = [RegistInfoCell cellForTableview:self.tableView];
 
    [cell cellForInfoNSString:self.infoAry[indexPath.row] andPlaceStr:self.PloceAry[indexPath.row] andIndexpath:indexPath];
    return cell;
}
-(NSArray *)PloceAry{

    if (!_PloceAry) {
        _PloceAry = @[@"姓名",@"性别",@"年龄",@"联系电话",@"邮箱地址"];
    }
    return _PloceAry;
}
-(NSMutableArray *)infoAry{

    if (!_infoAry) {
        self.infoAry = [@[@"未填写",@"未填写",@"精确到年月日",@"未填写",@"未填写"] mutableCopy];
    }
    return _infoAry;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //如果已经创建过了就hide掉；
    
    [self hideDatePiker];
    
    [self hidePikerView];
    
    if (indexPath.row == 2) {
        [self.view endEditing:YES];
        self.datePiker.delegate = self;
    }
    if (indexPath.row == 1) {
        [self.view endEditing:YES];
        self.genderPiker.delegate = self;
        self.genderPiker.dataSource = self;
        [self.genderPiker setBackgroundColor:[UIColor whiteColor]];
    }else{
    
        RegistInfoCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        [cell.writeFiled becomeFirstResponder];
    
    }
    
}

-(UIPickerView *)genderPiker{
    
    if (!_genderPiker) {
        
    

    UIPickerView *piker = [[UIPickerView alloc]initWithFrame:CGRectMake(JSFrame.origin.x, JSFrame.size.height*.6, JSFrame.size.width, JSFrame.size.height*.3)];
    
    [self.view addSubview:piker];

    self.genderPiker = piker;
    }
    return _genderPiker;
}

-(JSDatePiker *)datePiker{

    if (!_datePiker) {
        JSDatePiker *datepicker = [JSDatePiker piker];
        
        [datepicker setFrame:CGRectMake(JSFrame.origin.x, JSFrame.size.height*.6, JSFrame.size.width, JSFrame.size.height*.3)];
        
        [self.view addSubview:datepicker];
        
        self.datePiker = datepicker;
        }
    return _datePiker;
}

#pragma mark - JSDatePikerDelegate

-(void)JSDatePikerDidSelectSure:(UIDatePicker *)datepiker{
    
    //计算年龄
    NSString *selectedYearStr = [NSDate dateToYearString:datepiker.date];
    NSString *nowYearStr = [NSDate dateToYearString:[NSDate date]];
    
    NSInteger age = ([nowYearStr integerValue] - [selectedYearStr integerValue]);
    
    [self.infoAry replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"%ld",age]];
    
    [self.tableView reloadData];
    NSString *listDayStr = [NSDate dateToBirthSring:datepiker.date];
    self.childTester.age = age;
    self.childTester.date = listDayStr;
    
    [self hideDatePiker];
}

-(void)hideDatePiker{
    
    if (_datePiker) {
    [UIView animateWithDuration:1 animations:^{
        [self.datePiker setFrame:CGRectMake(0, JSFrame.size.height, JSFrame.size.width, 300)];
    } completion:^(BOOL finished) {
        [self.datePiker removeFromSuperview];
    }];
    }
}

-(void)hidePikerView{

    if (_genderPiker) {
        [UIView animateWithDuration:1 animations:^{
            [self.genderPiker setFrame:CGRectMake(0, JSFrame.size.height, JSFrame.size.width, 300)];
        } completion:^(BOOL finished) {
            
            [self.genderPiker removeFromSuperview];
            
        }];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    if (row==0) {
        [self.infoAry replaceObjectAtIndex:1 withObject:@"男孩"];
    }else{
    
        [self.infoAry replaceObjectAtIndex:1 withObject:@"女孩"];
    }
    [self.tableView reloadData];
    [self hidePikerView];
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return 2;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;

}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    if (row == 0) {
        return @"男孩";
    }else{
        return @"女孩";
    }
}

@end
