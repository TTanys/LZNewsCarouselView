//
//  UIView+HC.h
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HC)

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;

/**
 *  添加虚线边框(调用此方法前需要先设置frame)
 *
 *  @param borderWidth 边框宽度(虚线线条厚度)
 *  @param dashPattern @[@有色部分的宽度,@无色部分的宽度]
 *  @param color   虚线颜色
 */
- (void)addDashBorderWithWidth:(CGFloat)borderWidth dashPattern:(NSArray<NSNumber *> *)dashPattern color:(UIColor *)color;

@end
