//
//  MoviePlayerViewController.h
//  mvPlayerDemo
//
//  Created by 创维海通 on 15/11/26.
//  Copyright © 2015年 创维海通. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
typedef enum {
    MoviePlayerViewControllerModeNetwork = 0,
    MoviePlayerViewControllerModeLocal
}MoviePlayerViewControllerMode;

@interface MoviePlayerViewController : UIViewController

@property (nonatomic,strong,readonly) NSURL *movieURL;          //网络请求地址
@property (nonatomic,strong,readonly) NSArray *movieURLList;    //多个网络请求地址
@property (readonly,nonatomic,copy) NSString *movieTitle;       //电影名称
@property (nonatomic, assign) MoviePlayerViewControllerMode mode;       //播放类型，网络或本地

/**
 *  网络初始化播放
 *
 *  @param url        <#url description#>
 *  @param movieTitle <#movieTitle description#>
 *
 *  @return <#return value description#>
 */
- (id)initNetworkMoviePlayerViewControllerWithURL:(NSURL *)url movieTitle:(NSString *)movieTitle;

@end
