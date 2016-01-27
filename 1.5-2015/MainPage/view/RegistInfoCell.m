//
//  RegistInfoCell.m
//  1.5-2015
//
//  Created by Mac on 16/1/5.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "RegistInfoCell.h"

@interface RegistInfoCell ()

@end


@implementation RegistInfoCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    self.rightLabel = [[UILabel alloc]init];
    
    self.leftLabel = [[UILabel alloc]init];
        
    self.writeFiled = [[UITextField alloc]init];
        
    [self.writeFiled setReturnKeyType:UIReturnKeyDone];
        
    self.writeFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        
    [self.contentView addSubview:self.rightLabel];
    
    [self.contentView addSubview:self.leftLabel];
    
    [self.contentView addSubview:self.writeFiled];
        
    }
    return self;
}

+(RegistInfoCell*)cellForTableview:(UITableView*)tableview{
    
     NSString *const identif = @"RegistInfoCell";
    
    RegistInfoCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[RegistInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
    }
    
    
    
    return cell;
}

-(void)cellForInfoNSString:(NSString*)infostr andPlaceStr:(NSString *)plastr andIndexpath:(NSIndexPath*)indexpath{

    if (indexpath.row == 0||indexpath.row ==3||indexpath.row ==4) {
        self.leftLabel.text = plastr;
        self.writeFiled.placeholder = infostr;
        self.leftLabel.height = self.contentView.height * .5;
        self.writeFiled.height = self.contentView.height * .5;
        self.leftLabel.centerY = self.contentView.height*.5;
        self.writeFiled.centerY = self.contentView.height *.5;
        self.leftLabel.x = JSFrame.size.width *.1;
        self.writeFiled.x = JSFrame.size.width *.5;

        
        self.leftLabel.width = 180;
        
        self.writeFiled.width = 180;
        [self.rightLabel removeFromSuperview];
        
        if (indexpath.row == 0) {
            [self.writeFiled setKeyboardType:UIKeyboardTypeDefault];
        }
        if (indexpath.row == 3) {
            [self.writeFiled setKeyboardType:UIKeyboardTypeDecimalPad];
        }
        if (indexpath.row == 4) {
            [self.writeFiled setKeyboardType:UIKeyboardTypeTwitter];
        }
        
    }else{
    
        if ([infostr isEqual:@"未填写"]||[infostr isEqual:@"精确到年月日"]) {
            self.rightLabel.textColor = JSColor(184, 184, 192);
        }else{
        self.rightLabel.textColor = JSColor(0, 0, 0);
        }
        self.leftLabel.text = plastr;
        self.rightLabel.text = infostr;
        
        self.leftLabel.height = self.contentView.height * .5;
        self.rightLabel.height = self.contentView.height * .5;
        self.leftLabel.centerY = self.contentView.height*.5;
        self.rightLabel.centerY = self.contentView.height *.5;
        self.leftLabel.x = JSFrame.size.width *.1;
        self.rightLabel.x = JSFrame.size.width *.5;
        
        self.leftLabel.width = 180;
        
        self.rightLabel.width = 180;

        
        [self.writeFiled removeFromSuperview];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
