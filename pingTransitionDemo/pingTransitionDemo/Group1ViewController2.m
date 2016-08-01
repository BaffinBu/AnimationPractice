//
//  Group1ViewController2.m
//  pingTransitionDemo
//
//  Created by wy0012 on 16/6/12.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "Group1ViewController2.h"
#import "Group1ViewController1.h"
#import "Group1Transitiong.h"
@interface Group1ViewController2 ()

@end

@implementation Group1ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * barButton=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(popView)];
    
    self.navigationItem.leftBarButtonItem=barButton;
   // [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.delegate=self;
}

-(void) popView{
    
//    NSArray * arr=self.navigationController.childViewControllers;
//    Group1ViewController1 * controller1=[self.navigationController.childViewControllers objectAtIndex:0];
    //[self.navigationController pushViewController:controller1 animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

-(id<UIViewControllerAnimatedTransitioning>)
    navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC
    toViewController:(UIViewController *)toVC{
    
    if(operation==UINavigationControllerOperationPop){
        Group1Transitiong * trans1=[[Group1Transitiong alloc] init];
        return trans1;
    }else{
        return nil;
    }
    
    
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
