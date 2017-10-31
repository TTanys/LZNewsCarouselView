//
//  LZNewsView.h
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickAction)(NSUInteger index);

@interface LZNewsView : UIView

@property (nonatomic, strong) NSArray *dataArr;

+ (instancetype)newsViewWithFrame:(CGRect)frame clickAction:(ClickAction)clickAction;

@end
