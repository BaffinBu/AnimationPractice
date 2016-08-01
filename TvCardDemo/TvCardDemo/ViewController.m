//
//  ViewController.m
//  TvCardDemo
//
//  Created by wy0012 on 16/7/26.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"
#import "tvOsCardView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tvOsCardView * cardView=[[tvOsCardView alloc] init];
    cardView.center=self.view.center;
    cardView.bounds=CGRectMake(0, 0, 210, 280);
    //cardView.backgroundColor=[UIColor redColor];
    [self.view addSubview:cardView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
