//
//  LZNewsModel.m
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import "LZNewsModel.h"

@implementation LZNewsModel

+ (instancetype)modelWithImgUrlStr:(NSString *)imgUrlStr titleStr:(NSString *)titleStr{
    LZNewsModel *model = [LZNewsModel new];
    model.imgUrlStr = imgUrlStr;
    model.titleStr = titleStr;
    return model;
}

@end
