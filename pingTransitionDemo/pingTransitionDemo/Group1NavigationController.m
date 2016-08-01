//
//  Group1NavigationController.m
//  pingTransitionDemo
//
//  Created by wy0012 on 16/6/12.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "Group1NavigationController.h"

@interface Group1NavigationController ()

@end

@implementation Group1NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setChildController:(NSArray<UIViewController *> *) arr{
    self.viewControllers=arr;
    
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
