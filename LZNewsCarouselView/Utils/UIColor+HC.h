//
//  UIColor+HC.h
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HC)

/**
 *  通过十六进制数生成颜色
 *
 *  @param hexColorString 十六进制字符串
 *
 *  @return 生成的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColorString;

@end
