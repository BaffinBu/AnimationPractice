//
//  ViewController.m
//  DownLoadBtnDemo
//
//  Created by wy0012 on 16/6/3.
//  Copyright © 2016年 wy0012. All rights reserved.
//
#import "ViewController.h"
#import "DownloadButton.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet DownloadButton *animateButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animateButton.progressBarWidth=200;
    self.animateButton.progressBarHeight=30;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
