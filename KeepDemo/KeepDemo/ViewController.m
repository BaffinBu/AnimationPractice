//
//  ViewController.m
//  KeepDemo
//
//  Created by wy0012 on 16/5/26.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

#define Screen_Width [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
#pragma IBOutLet
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

#pragma 显示文案的文本
@property (weak, nonatomic) IBOutlet UILabel *textLabel1;
@property (weak, nonatomic) IBOutlet UILabel *textLabel2;
@property (weak, nonatomic) IBOutlet UILabel *textLabel3;
@property (weak, nonatomic) IBOutlet UILabel *textLabel4;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *laebel2LeadContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *label3LeadConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *label4LeadConstraint;

@property(nonatomic,strong) MPMoviePlayerController * moviePlayer;
@property(nonatomic,strong) NSTimer * timer;
@property(nonatomic,strong) AVAudioSession *avaudioSession;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.avaudioSession=[AVAudioSession sharedInstance];
    NSError * error=nil;
    [self.avaudioSession setCategory:AVAudioSessionCategoryAmbient error:&error];
    
    
    NSString * urlStr=[[NSBundle mainBundle] pathForResource:@"1.mp4" ofType:nil];
    NSURL * url=[NSURL fileURLWithPath:urlStr];
    _moviePlayer=[[MPMoviePlayerController alloc] initWithContentURL:url];
    [_moviePlayer play];
    [_moviePlayer.view setFrame:self.view.bounds];
    [//self.view addSubview:_moviePlayer.view];
     self.view insertSubview:_moviePlayer.view belowSubview:_LoginBtn];
    _moviePlayer.shouldAutoplay=YES;
    [_moviePlayer setControlStyle:MPMovieControlStyleNone];
    [_moviePlayer setFullscreen:YES];
    [_moviePlayer setRepeatMode:MPMovieRepeatModeOne];
    [self setUpUI];
    [self setTextData];
    
}
-(void) setTextData{
    _textLabel1.text=@"残酷的天使";
    _textLabel2.text=@"飞到何处";
    _textLabel3.text=@"封闭的内心";
    _textLabel4.text=@"何时打开";
    _timer=[NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer  forMode:NSRunLoopCommonModes];
}

- (void) setUpUI{
    _registerBtn.layer.cornerRadius=5.f;
    _registerBtn.alpha=0.5;
    _LoginBtn.layer.cornerRadius=5.f;
    _LoginBtn.alpha=0.5;
    self.scrollView.contentSize=CGSizeMake(4*Screen_Width, 0);
    self.laebel2LeadContraint.constant=Screen_Width;
    self.label3LeadConstraint.constant=2*Screen_Width;
    self.label4LeadConstraint.constant=3*Screen_Width;
    
}

-(BOOL) prefersStatusBarHidden{
    //return YES;
    return NO;
}

-(void) timerChange{
    int page=(_pageControl.currentPage+1)%4;
    _pageControl.currentPage=page;
    [self startScrollAnimate:_pageControl.currentPage];
    
}
-(void) startScrollAnimate:(NSInteger) page{
    CGFloat x=page * Screen_Width;
    
    [_scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
