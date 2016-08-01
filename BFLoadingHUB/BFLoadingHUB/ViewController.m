//
//  ViewController.m
//  BFLoadingHUB
//
//  Created by wy0012 on 16/6/6.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"
#import "LoadingHUD.h"
#import "ParentXibView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[LoadingHUD showHUD];
    ParentXibView *parentView=[[[NSBundle mainBundle] loadNibNamed:@"ParentXibView" owner:nil options:nil] objectAtIndex:0];
    
    [parentView setFrame:CGRectMake(0, 0, 375, 667)];
    [self.view addSubview:parentView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
