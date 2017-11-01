//
//  HCViewController.m
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import "HCViewController.h"
#import "HCConfig.h"
#import "LZNewsView.h"
#import "LZNewsModel.h"
#import "LZNewsDetailViewController.h"

@interface HCViewController ()

@end

@implementation HCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"新闻";
    
    UIView *newsBgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 62)];
    newsBgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:newsBgV];
    UIImageView *newsTitImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, (62-45)/2.f, 47, 45)];
    newsTitImgV.image = [UIImage imageNamed:@"hp_newsTitImg"];
    [newsBgV addSubview:newsTitImgV];
    newsBgV.center = self.view.center;
    
    CGRect newsFrame = CGRectMake(newsTitImgV.right+16, 10, newsBgV.width-newsTitImgV.right-16-10, 62-20);
    
    NSMutableArray *newsArr = [NSMutableArray arrayWithObjects:
                               [LZNewsModel modelWithImgUrlStr:@"http://pic7.nipic.com/20100518/3409334_031036048098_2.jpg" titleStr:@"附近的咖啡机的疯狂减肥的大家疯狂的风景地方呵呵呵呵哈哈哈"],
                               [LZNewsModel modelWithImgUrlStr:@"http://pic1.16pic.com/00/07/85/16pic_785034_b.jpg" titleStr:@"女简单的滑动返回到附近的减肥的减肥地方将豆腐豆腐"],
                               [LZNewsModel modelWithImgUrlStr:@"http://pic13.nipic.com/20110307/2222821_094740634000_2.jpg" titleStr:@"乘客拒可靠的艰苦奋斗奋斗女人购物勾画出个差发酒疯解放军"],
                               [LZNewsModel modelWithImgUrlStr:@"http://pic4.nipic.com/20091203/1295091_123813146028_2.jpg" titleStr:@"我发的风雨飞跃粤语也分丰富个月份工业范爷的一个一等功关于水果的"],
                               [LZNewsModel modelWithImgUrlStr:@"http://pic40.nipic.com/20140424/10558908_213423765000_2.jpg" titleStr:@"的房间打开附近的空间疯狂的疯狂的减肥空间的开发发动机"],
                               [LZNewsModel modelWithImgUrlStr:@"http://pic7.nipic.com/20100609/3143623_160732828380_2.jpg" titleStr:@"聚会稻盛和夫的煽风点火付电话费对方回复回复陪我我我"], nil];
    
    __weak typeof(self) weakSelf = self;
    LZNewsView *newsView = [LZNewsView newsViewWithFrame:newsFrame clickAction:^(NSUInteger index) {
        NSLog(@"---%lu---",index);
        LZNewsModel *model = newsArr[index];
        LZNewsDetailViewController *detailVc = [LZNewsDetailViewController new];
        detailVc.model = model;
        [weakSelf.navigationController pushViewController:detailVc animated:YES];
    }];
    newsView.dataArr = newsArr;
    [newsBgV addSubview:newsView];
    
    newsView.backgroundColor = HEXCOLOR(@"#eeeeee");
    newsView.layer.cornerRadius = 8;
    newsView.layer.masksToBounds = YES;
    newsView.layer.borderWidth = 0.7;
    newsView.layer.borderColor = HEXCOLOR(@"#e1e2e5").CGColor;
}

@end
