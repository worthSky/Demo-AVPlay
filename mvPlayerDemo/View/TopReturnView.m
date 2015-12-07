//
//  TopReturnView.m
//  mvPlayerDemo
//
//  Created by 创维海通 on 15/12/7.
//  Copyright © 2015年 创维海通. All rights reserved.
//

#import "TopReturnView.h"

@interface TopReturnView ()

@property (nonatomic,strong) UIButton *returnBtn;
@property (nonatomic,strong) UILabel *titleLable;

@end

#define TopViewHeight 44
#define titleLableWidth 400
@implementation TopReturnView

- (instancetype)initWithFrame:(CGRect)frame movieTitle:(NSString *)movieTitle
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, ScreenWidth, TopViewHeight);
    }
    return self;
}


- (void)initTopView:(NSString *)movieTitle
{
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    
    _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, TopViewHeight)];
    [_returnBtn setTitle:@"返回" forState:UIControlStateNormal];
    [_returnBtn setTitleColor:[UIColor colorWithRed:0.01f green:0.48f blue:0.98f alpha:1.00f] forState:UIControlStateNormal];
    [_returnBtn addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_returnBtn];
    
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2-titleLableWidth/2, 0, titleLableWidth, TopViewHeight)];
    _titleLable.backgroundColor = [UIColor clearColor];
    _titleLable.text = movieTitle;
    _titleLable.textColor = [UIColor whiteColor];
    _titleLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLable];
}

#pragma mark - click
/**
 *  返回事件
 */
- (void)popView
{
    if ([self.topdelegate respondsToSelector:@selector(returnTopView)]) {
        [self.topdelegate returnTopView];
    }
}
@end
