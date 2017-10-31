//
//  LZNewsModel.h
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZNewsModel : NSObject

@property (nonatomic, copy) NSString *imgUrlStr;
@property (nonatomic, copy) NSString *titleStr;

+ (instancetype)modelWithImgUrlStr:(NSString *)imgUrlStr titleStr:(NSString *)titleStr;

@end
