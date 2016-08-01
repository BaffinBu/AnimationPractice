//
//  Group1ViewController1ViewController.m
//  pingTransitionDemo
//
//  Created by wy0012 on 16/6/12.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "Group1ViewController1.h"

@interface Group1ViewController1()

@end

@implementation Group1ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UIBarButtonItem * rightBarButton=[[UIBarButtonItem alloc] initWithTitle:@"推出" style:UIBarButtonItemStylePlain target:self action:@selector(pushView)];
    self.navigationItem.rightBarButtonItem=rightBarButton;
}


- (void) pushView{
    [self.navigationController pushViewController:[self.navigationController.childViewControllers objectAtIndex:1]  animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
