//
//  LZNewsView.m
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import "LZNewsView.h"
#import "LZNewsModel.h"
#import "HCConfig.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

@interface LZNewsView ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *newsView;
@property (nonatomic, strong) NSArray *newsDataArr;
@property (nonatomic, assign) NSUInteger newsIndex; //初始值设置为0
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) ClickAction tapAction;

@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LZNewsView

+ (instancetype)newsViewWithFrame:(CGRect)frame clickAction:(ClickAction)clickAction{
    return [[LZNewsView alloc] initWithFrame:frame clickAction:clickAction];
}

- (instancetype)initWithFrame:(CGRect)frame clickAction:(ClickAction)clickAction{
    self = [super initWithFrame:frame];
    if (self) {
        self.tapAction = clickAction;
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    _newsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    UITapGestureRecognizer *tapGer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToNewsDetail:)];
    _newsView.userInteractionEnabled = YES;
    [_newsView addGestureRecognizer:tapGer];
    [self addSubview:_newsView];
    
    _iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 22, 22)];
    _iconImgView.contentMode = UIViewContentModeScaleAspectFill;
    _iconImgView.layer.masksToBounds = YES;
    [_newsView addSubview:_iconImgView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImgView.right+8, _iconImgView.top, _newsView.width-_iconImgView.right-8-12, _iconImgView.height)];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.numberOfLines = 1;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [_newsView addSubview:_titleLabel];
}

//点击进入详情
- (void)tapToNewsDetail:(UITapGestureRecognizer *)tapGer{
    if (self.tapAction) {
        self.tapAction(_newsIndex);
    }
}

- (void)setDataArr:(NSArray *)dataArr{
    _newsIndex = 0;
    self.newsDataArr = dataArr;
    if (self.newsDataArr.count == 0) {
        self.newsDataArr = [NSArray arrayWithObject:[LZNewsModel modelWithImgUrlStr:@"" titleStr:@"暂无数据..."]];
    }
    [self showCarouselViewDataAndSetupAnimation];
}

//填充数据并设置动画
- (void)showCarouselViewDataAndSetupAnimation{
    NSLog(@"---%lu---",_newsIndex);
    LZNewsModel *model = self.newsDataArr[_newsIndex];
    [self fillDataWithModel:model];
    
    [UIView animateWithDuration:0.7 delay:0 options:0 animations:^(){
        _newsView.alpha = 0.2;
        [_newsView exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
        _newsView.alpha = 1;
    } completion:^(BOOL finished){
        //创建定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(changeNewsData) userInfo:nil repeats:YES];
        //把定时器添加到运行循环当中
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }];
}

- (void)changeNewsData{
    _newsIndex ++;
    if (_newsIndex >= [self.newsDataArr count]) {
        _newsIndex = 0;
    }
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
    [_newsView.layer addAnimation:animation forKey:@"animationID"];
    
    NSLog(@"---%lu---",_newsIndex);
    LZNewsModel *model = self.newsDataArr[_newsIndex];
    [self fillDataWithModel:model];
}

//更新数据
- (void)fillDataWithModel:(LZNewsModel *)model{
    [_iconImgView sd_setImageWithURL:[NSURL URLWithString:model.imgUrlStr] placeholderImage:[UIImage imageNamed:@"hp_newsIcon"]];
    _titleLabel.text = model.titleStr;
}

@end
