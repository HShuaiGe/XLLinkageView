//
//  ViewController.m
//  XLLinkageViewDemo
//
//  Created by 路 on 2018/1/10.
//  Copyright © 2018年 路. All rights reserved.
//

#import "ViewController.h"
#import "XLLinkageView.h"
#import "FirstViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XLLinkageView *linkageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    NSArray *titles = @[@"推荐分类", @"京东超市", @"国际品牌", @"奢饰品", @"全球购", @"男装", @"女装", @"男鞋", @"女鞋", @"内衣配饰", @"箱包手袋", @"美妆个护", @"钟表珠宝", @"手机数码", @"电脑办公", @"家用电器", @"食品生鲜", @"酒水饮料", @"母婴童装", @"玩具乐器", @"医药保健",@"计生情趣",@"运动户外",@"汽车用品",@"家具厨具",@"礼品鲜花",@"宠物生活",@"生活旅行",@"图书音像",@"邮币",@"农资绿植",@"特产馆",@"京东金融",@"拍卖",@"房产",@"二手商品"];
    UIViewController *vc;
    NSMutableArray *viewControllers = [NSMutableArray array];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    for (NSString *title in titles) { //此处可以根据后台传的类型判断加载什么VC
        if ([title isEqualToString:@"三"]) {
            vc = [sb instantiateViewControllerWithIdentifier:@"FirstViewController"];
        }else{
            vc = [sb instantiateViewControllerWithIdentifier:@"FirstViewController"];
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            [vc.view setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
        }
        [viewControllers addObject:vc];
    }
    [self.linkageView setChildVCs:viewControllers titles:titles parentVC:self defaultItem:0];  //默认选中第0个
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
