//
//  ViewController.m
//  RefreshCircleAnimDemo
//
//  Created by wy0012 on 16/8/1.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"
#import "FunnyRotateViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)funnyRotateClick:(id)sender {
    
    FunnyRotateViewController *fVc=[[FunnyRotateViewController alloc] init];
    fVc.view.backgroundColor=[UIColor lightGrayColor];
    [self.navigationController pushViewController:fVc animated:YES];
    
}

@end
