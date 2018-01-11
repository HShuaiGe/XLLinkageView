//
//  XLLinkageView.h
//  XLLinkageViewDemo
//
//  Created by 路 on 2018/1/10.
//  Copyright © 2018年 路. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLLinkageView : UIView
-(void)setChildVCs:(NSArray<UIViewController *> *)childVCs titles:(NSArray *)titles parentVC:(UIViewController *)parentVC defaultItem:(NSInteger)defaultItem;
@end
