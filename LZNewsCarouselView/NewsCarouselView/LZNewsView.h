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

/** 数据源 */
@property (nonatomic, strong) NSArray *dataArr;

/** 初始化方法 */
+ (instancetype)newsViewWithFrame:(CGRect)frame clickAction:(ClickAction)clickAction;

@end
