//
//  PingTransiton.m
//  pingTransitionDemo
//
//  Created by wy0012 on 16/5/20.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "PingTransiton.h"
#import <UIKit/UIKit.h>
//实现转场动画的基本协议方法
@implementation PingTransiton

-(void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
}

-(NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 3.0;
}
@end
