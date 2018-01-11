//
//  FirstViewController.m
//  XLLinkageViewDemo
//
//  Created by 路 on 2018/1/11.
//  Copyright © 2018年 路. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//放在此处操作你需要请求的数据和UI
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.activityIndicatorView.hidden = NO;
    [self.activityIndicatorView startAnimating];
    NSLog(@"1");
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self.activityIndicatorView isAnimating];
        self.activityIndicatorView.hidden = YES;
    });
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
