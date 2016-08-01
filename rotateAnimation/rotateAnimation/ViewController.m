//
//  ViewController.m
//  rotateAnimation
//
//  Created by wy0012 on 16/7/8.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *rotateView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addAnimation];
    
}


-(void) addAnimation{
    
//     _rotateView.layer.transform=CATransform3DMakeRotation(M_PI_4, 0, 0.5, 0);
    
    CABasicAnimation *animRotate=[[CABasicAnimation alloc] init];
    animRotate.keyPath=@"transform.rotation.y";
    animRotate.toValue=@(M_PI*1/2);
    animRotate.duration=1;
    animRotate.fillMode=kCAFillModeForwards;
    animRotate.removedOnCompletion=NO;
    animRotate.delegate=self;
    [_rotateView.layer addAnimation:animRotate forKey:@"rotateAnimTwo"];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
