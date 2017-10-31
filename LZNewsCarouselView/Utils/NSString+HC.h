//
//  NSString+HC.h
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (HC)

- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

- (CGFloat)widthForFont:(UIFont *)font;

- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;

- (BOOL)matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

- (BOOL)containsEmoji;

- (NSString *)stringByTrim;

/**
 nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
 */
- (BOOL)isNotBlank;

/**
 * 检查是否是手机号码
 */
- (BOOL)isPhoneNumer;

@end
