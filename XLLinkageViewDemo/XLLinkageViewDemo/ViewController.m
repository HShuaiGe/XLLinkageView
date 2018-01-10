//
//  ViewController.m
//  XLLinkageViewDemo
//
//  Created by 路 on 2018/1/10.
//  Copyright © 2018年 路. All rights reserved.
//

#import "ViewController.h"
#import "XLLinkageView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XLLinkageView *linkageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titles = @[@"一", @"二", @"三", @"四", @"五", @"六"];
    UIViewController *vc;
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSString *title in titles) { //此处可以根据后台传的类型判断加载什么VC
        if ([title isEqualToString:@"三"]) {
            vc = [[UIViewController alloc]init];
        }else{
            vc = [[UIViewController alloc]init];
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            [vc.view setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
        }
        [viewControllers addObject:vc];
    }
    [self.linkageView setChildVCs:viewControllers parentVC:self defaultItem:2];  //默认选中第二个
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
