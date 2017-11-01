//
//  LZNewsView.m
//  LZNewsCarouselView
//
//  Created by zhajianjun on 2017/10/31.
//  Copyright © 2017年 TTanys. All rights reserved.
//

#import "LZNewsView.h"
#import "LZNewsModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

@interface LZNewsView ()<CAAnimationDelegate>

@property (nonatomic, assign) NSUInteger newsIndex; //初始值设置为0
@property (nonatomic, strong) NSTimer *timer; //定时器

@property (nonatomic, strong) UIView *newsBgV;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign, getter=isHaveNews) BOOL haveNews; //有无数据标识，有 YES 无 NO
@property (nonatomic, copy) ClickAction tapAction; //点击触发回调

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
    UITapGestureRecognizer *tapGer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToNewsDetail:)];
    [self addGestureRecognizer:tapGer];
    
    _newsBgV = [[UIView alloc] init];
    [self addSubview:_newsBgV];
    
    _iconImgView = [[UIImageView alloc] init];
    _iconImgView.contentMode = UIViewContentModeScaleAspectFill;
    _iconImgView.layer.masksToBounds = YES;
    _iconImgView.image = [UIImage imageNamed:@"hp_newsIcon"];
    [_newsBgV addSubview:_iconImgView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.numberOfLines = 1;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.text = @"暂无数据...";
    [_newsBgV addSubview:_titleLabel];
    
    [_newsBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_newsBgV).offset(12);
        make.top.equalTo(_newsBgV).offset(10);
        make.width.height.equalTo(@22);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImgView.mas_right).offset(8);
        make.right.equalTo(_newsBgV).offset(-12);
        make.height.centerY.equalTo(_iconImgView);
    }];
}

//点击进入详情
- (void)tapToNewsDetail:(UITapGestureRecognizer *)tapGer{
    if (self.tapAction && self.isHaveNews) {
        self.tapAction(_newsIndex);
    }
}

- (void)setDataArr:(NSArray *)dataArr{
    _newsIndex = 0;
    _dataArr = dataArr;
    self.haveNews = YES;
    if (_dataArr.count == 0) {
        self.haveNews = NO;
        _dataArr = [NSArray arrayWithObject:[LZNewsModel modelWithImgUrlStr:@"" titleStr:@"暂无数据..."]];
    }
    [self showCarouselViewDataAndSetupAnimation];
}

//填充数据并设置动画
- (void)showCarouselViewDataAndSetupAnimation{
    NSLog(@"---%lu---",_newsIndex);
    LZNewsModel *model = _dataArr[_newsIndex];
    [self fillDataWithModel:model];
    
    [UIView animateWithDuration:0.7 delay:0 options:0 animations:^(){
        _newsBgV.alpha = 0.2;
        [_newsBgV exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
        _newsBgV.alpha = 1;
    } completion:^(BOOL finished){
        //创建定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(changeNewsData) userInfo:nil repeats:YES];
        //把定时器添加到运行循环当中
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }];
}

- (void)changeNewsData{
    _newsIndex ++;
    if (_newsIndex >= [_dataArr count]) {
        _newsIndex = 0;
    }
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
    [_newsBgV.layer addAnimation:animation forKey:@"animationID"];
    
    NSLog(@"---%lu---",_newsIndex);
    LZNewsModel *model = _dataArr[_newsIndex];
    [self fillDataWithModel:model];
}

//更新数据
- (void)fillDataWithModel:(LZNewsModel *)model{
    [_iconImgView sd_setImageWithURL:[NSURL URLWithString:model.imgUrlStr] placeholderImage:[UIImage imageNamed:@"hp_newsIcon"]];
    _titleLabel.text = model.titleStr;
}

@end
