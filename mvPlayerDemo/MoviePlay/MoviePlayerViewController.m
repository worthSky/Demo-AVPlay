//
//  MoviePlayerViewController.m
//  mvPlayerDemo
//
//  Created by 创维海通 on 15/11/26.
//  Copyright © 2015年 创维海通. All rights reserved.
//

#import "MoviePlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "TopReturnView.h"

@interface MoviePlayerViewController ()<TopReturnViewDelegate>

@property (nonatomic,assign) BOOL isPlaying;        //是否播放
@property (nonatomic, strong) AVPlayer *player;     //
@property (nonatomic,strong) NSMutableArray *itemTimeList;   //视频的时长

@property (nonatomic,assign)BOOL isFirstOpenPlayer;//第一次打开需要读取历史观看进度

@end

@implementation MoviePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //隐藏顶部状态栏
    if (IOS_VERSION < 7) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    }else{
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            // iOS 7
            [self prefersStatusBarHidden];
            [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
        }
    }
    
    self.view.backgroundColor = [UIColor blackColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initNetworkMoviePlayerViewControllerWithURL:(NSURL *)url movieTitle:(NSString *)movieTitle
{
    self = [super init];
    if (self) {
        _isPlaying = YES;
        _isFirstOpenPlayer = NO;
        _movieURL = url;
        _movieURLList = @[url];
        _movieTitle = movieTitle;
        _itemTimeList = [[NSMutableArray alloc] initWithCapacity:5];
        _mode = MoviePlayerViewControllerModeNetwork;
    }
    return self;
}

#pragma mark - initView
- (void)createTopView{
    TopReturnView *topView = [[TopReturnView alloc] init];
    topView.topdelegate = self;
    [self.view addSubview:topView];
}


#pragma mark - 系统相关
//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}

#pragma mark - delegate
- (void)returnTopView
{
    //保存本次播放进度
//    [[DatabaseManager defaultDatabaseManager] addPlayRecordWithIdentifier:_movieTitle progress:_movieProgressSlider.value];
    
    [_player removeTimeObserver:_timeObserver];
    [_player replaceCurrentItemWithPlayerItem:nil];//自动移除 observer
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
    
    if (IOS_VERSION < 7) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    }
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        self.timeObserver = nil;
        self.player = nil;
        [UIScreen mainScreen].brightness = _systemBrightness;
        if ([_delegate respondsToSelector:@selector(movieFinished:)]) {
            [_delegate movieFinished:_movieProgressSlider.value];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
