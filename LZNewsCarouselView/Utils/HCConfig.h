//
//  HCConfig.h
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#ifndef HCConfig_h
#define HCConfig_h


//头文件
#import "Foundation+HC.h"
#import "UIColor+HC.h"
#import "UIView+HC.h"
#import "UIImage+HC.h"
#import "Singleton.h"
#import "NSString+HC.h"


//获取普通字体
#define FONT(font)           [UIFont systemFontOfSize:font]
//获取粗字体
#define BOLDFONT(font)       [UIFont boldSystemFontOfSize:font]
//获取颜色
#define HEXCOLOR(hexStr)     [UIColor colorWithHexString:hexStr]
//获取图片
#define IMAGE(imageName)     [UIImage imageNamed:imageName]


//屏幕宽度
#define WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define HEIGHT [UIScreen mainScreen].bounds.size.height


//自定义Log
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"<%s:%d> %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif


#endif
