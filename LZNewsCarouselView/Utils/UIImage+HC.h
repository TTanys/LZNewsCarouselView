//
//  UIImage+HC.h
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HC)
/**
 *  根据颜色获取一个纯色UIImage
 *
 *  @param color 颜色
 *
 *  @return 生成的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
