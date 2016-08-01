//
//  Group1Transitiong.m
//  pingTransitionDemo
//
//  Created by wy0012 on 16/6/12.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "Group1Transitiong.h"
#import "Group1ViewController1.h"
#import "Group1ViewController2.h"


@interface Group1Transitiong()
@property (nonatomic,strong)id<UIViewControllerContextTransitioning> transitionContext;
@end

@implementation Group1Transitiong

-(NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 2.0f;
}

-(void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    Group1ViewController2 * fromVc=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    Group1ViewController1 * toVc=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * contView=[transitionContext containerView];
    
    
    
   
    [contView addSubview:fromVc.view];
    [contView addSubview:toVc.view];

    CABasicAnimation * alphaAnim=[[CABasicAnimation alloc] init];
    alphaAnim.keyPath=@"opacity";
    alphaAnim.fromValue=@(0.0);
    alphaAnim.toValue=@(1.0);
    alphaAnim.removedOnCompletion=NO;
    alphaAnim.duration=2.0f;
    alphaAnim.fillMode=kCAFillModeForwards;
    alphaAnim.delegate=self;
    [toVc.view.layer addAnimation:alphaAnim forKey:@"alphaAnim"];
    
//    [UIView animateWithDuration:2.0 animations:^{
//        fromVc.view.alpha=0.0;
//    }];
    
    
}

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
        [self.transitionContext completeTransition:![self. transitionContext transitionWasCancelled]];
}
@end
