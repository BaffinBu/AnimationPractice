//
//  ViewController.m
//  InteractiveCardDemo
//
//  Created by wy0012 on 16/6/13.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"
#import "interactiveView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    interactiveView *iView=[[interactiveView alloc]initWithImage:[UIImage imageNamed:@"pic01"]];
    iView.center=self.view.center;
    iView.bounds=CGRectMake(0, 0, 200, 150);
    iView.gestureView=self.view;
    
    //模糊图层
    UIVisualEffectView * blurView=[[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    blurView.frame=self.view.bounds;
    [self.view addSubview:blurView];
    iView.dimmingView=blurView;
    
    
//    UIView *backView=[[UIView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:backView];
//    [backView addSubview:iView];
    [self.view addSubview:iView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
