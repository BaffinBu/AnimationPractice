//
//  FunnyRotateViewController.m
//  RefreshCircleAnimDemo
//
//  Created by wy0012 on 16/8/1.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "FunnyRotateViewController.h"
#import "FunnyRotateView.h"
@implementation FunnyRotateViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    FunnyRotateView * rotateView=[[FunnyRotateView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-100,self.view.frame.size.height/2-100,200,200)];
    rotateView.backgroundColor=[UIColor greenColor];
    [rotateView startAnim];
    [self.view addSubview:rotateView];
    
}

@end
