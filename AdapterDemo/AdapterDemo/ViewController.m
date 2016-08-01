//
//  ViewController.m
//  AdapterDemo
//
//  Created by wy0012 on 16/5/12.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;


@end

@implementation ViewController
{
    UIScrollView * scroll;
}
- (void)viewDidLoad {
    [super viewDidLoad];

     scroll=[[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [scroll setBackgroundColor:[UIColor greenColor]];
    scroll.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000);
    
    UIButton * btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 700, 100, 30)];
    [btn setBackgroundColor:[UIColor redColor]];
 
    [scroll addSubview:btn];
    
    [self.view addSubview:scroll];
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
       [scroll setContentOffset:CGPointMake(0, 200) animated:YES];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
