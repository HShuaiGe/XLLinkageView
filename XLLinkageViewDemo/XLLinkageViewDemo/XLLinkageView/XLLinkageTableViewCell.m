//
//  XLLinkageTableViewCell.m
//  XLLinkageViewDemo
//
//  Created by 路 on 2018/1/10.
//  Copyright © 2018年 路. All rights reserved.
//

#import "XLLinkageTableViewCell.h"

@implementation XLLinkageTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(99.4, 0, .6, 44)];
        NSLog(@"\nW:%f \nH:%f",self.frame.size.width, self.frame.size.height);
        lineView.backgroundColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1];
        [self.contentView addSubview:lineView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (self.selected) {
        UIView *selectedBackgroundView = [[UIView alloc]initWithFrame:self.contentView.frame];
        selectedBackgroundView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
        self.textLabel.textColor = [UIColor redColor];
        [self setSelectedBackgroundView:selectedBackgroundView];
    }else{
        self.textLabel.textColor = [UIColor blackColor];
    }
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end
