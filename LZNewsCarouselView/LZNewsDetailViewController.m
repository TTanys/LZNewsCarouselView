//
//  LZNewsDetailViewController.m
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import "LZNewsDetailViewController.h"
#import "HCConfig.h"

@interface LZNewsDetailViewController ()

@end

@implementation LZNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = self.model.titleStr;
    
    UIWebView *webV = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [self.view addSubview:webV];
    [webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.imgUrlStr]]];
}



@end
