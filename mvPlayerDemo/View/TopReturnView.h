//
//  TopReturnView.h
//  mvPlayerDemo
//
//  Created by 创维海通 on 15/12/7.
//  Copyright © 2015年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopReturnView;

@protocol TopReturnViewDelegate <NSObject>

@required
- (void)returnTopView;

@end

@interface TopReturnView : UIView

@property (nonatomic, weak) id<TopReturnViewDelegate> topdelegate;

- (instancetype)initWithFrame:(CGRect)frame movieTitle:(NSString *)movieTitle;

@end
