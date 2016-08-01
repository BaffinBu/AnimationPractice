//
//  ViewController.m
//  BaffinSlideMenu
//
//  Created by wy0012 on 16/5/3.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"
#import "MySlideView.h"
@interface ViewController ()

@property(nonatomic,strong) MySlideView * slideView;
@property(nonatomic,assign) BOOL  isShow;
@end

@implementation ViewController{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isShow=NO;

    self.slideView =[[MySlideView alloc] initWithTitle:@"首页" Color:[UIColor blueColor] Valueframe:[NSValue valueWithCGRect:self.view.frame]];
    
    UITapGestureRecognizer * tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(displaySlideView)];
    
    [self.view addGestureRecognizer:tapGesture];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    

    

    
    
    
}


-(void) displaySlideView{
    if(self.isShow==NO){
        [self.slideView showSlideView];
        self.navigationController.navigationBar.alpha=0;
        self.isShow=YES;
    }else{
        [self.slideView hideSlideView];
        self.navigationController.navigationBar.alpha=1;

        self.isShow=NO;
    }

}

@end
