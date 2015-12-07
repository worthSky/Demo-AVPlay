//
//  Public.h
//  AXT_Person
//
//  Created by weiying on 15/9/10.
//  Copyright (c) 2015年 淮安微赢. All rights reserved.
//

#ifndef AXT_Person_Public_h
#define AXT_Person_Public_h

//设备系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//获取设备屏幕尺寸
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

/**
 *  调试模式下的打印输出
 */
#ifdef DEBUG
#define AXTLog(...) NSLog(__VA_ARGS__)
#else
#define AXTLog(...)
#endif

/**
 *  颜色的R,G,B,A
 *
 *  @param r R
 *  @param g G
 *  @param b B
 *  @param a A
 *
 *  @return Color
 */
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a];

#define RGB(r,g,b) RGBA(r,g,b,1.0)

#define AXTBackColor RGB(238,238,238)

/**
 *  随机色
 */
#define RandomColor RGB(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))

/**
 *  loading图片数组
 */
#define LoadingImgsArr @[[UIImage imageNamed:@"loading_01"],\
                         [UIImage imageNamed:@"loading_02"],\
                         [UIImage imageNamed:@"loading_03"],\
                         [UIImage imageNamed:@"loading_04"],\
                         [UIImage imageNamed:@"loading_05"],\
                         [UIImage imageNamed:@"loading_06"]]

/**
 *  refresh图片数组
 */
#define RefreshImgsArr @[[UIImage imageNamed:@"refresh_01"],\
                         [UIImage imageNamed:@"refresh_02"],\
                         [UIImage imageNamed:@"refresh_03"],\
                         [UIImage imageNamed:@"refresh_04"],\
                         [UIImage imageNamed:@"refresh_05"]]

/**
 *  refreshLoading图片数组
 */
#define RefreshLoadingImgsArr @[[UIImage imageNamed:@"refresh_loading_01"],\
                                [UIImage imageNamed:@"refresh_loading_02"],\
                                [UIImage imageNamed:@"refresh_loading_03"]]



//经纬度
#define LATITUDE_DEFAULT 33.55
#define LONGITUDE_DEFAULT 150.53

//渠道ID
//#define kChannelID ([NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"channel" ofType:@"plist"]][@"channel"])
#define kChannelID @"ios0629"

#endif
