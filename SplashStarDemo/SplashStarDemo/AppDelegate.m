//
//  AppDelegate.m
//  SplashStarDemo
//
//  Created by wy0012 on 16/5/11.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [self.window makeKeyAndVisible];
//    self.window.backgroundColor=[UIColor colorWithRed:128.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
//   UIViewController * controller=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
//    self.window.rootViewController=controller;
//    
//    CALayer * mLayer=[[CALayer alloc] init];
//    mLayer.contents=(id)[UIImage imageNamed:@"logo"].CGImage;
//    mLayer.bounds=CGRectMake(0, 0, 60, 60);
//    mLayer.position=controller.view.center;
//    
//    [controller.view.layer addSublayer:mLayer];
//    
////这个动画效果可以加上
////    UIView * testView =[[UIView alloc] initWithFrame:controller.view.bounds];
////    testView.backgroundColor=[UIColor redColor];
////    [controller.view addSubview:testView];
////    [UIView animateWithDuration:3 animations:^{
////        testView.alpha=0;
////    }];
//    
//    CABasicAnimation * basicAnimF=[CABasicAnimation animationWithKeyPath:@"bounds"];
//    basicAnimF.duration=1;
//    basicAnimF.fromValue=[NSValue valueWithCGRect:mLayer.bounds];
//    basicAnimF.toValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 3000, 3000)];
//    basicAnimF.removedOnCompletion=NO;
//    basicAnimF.fillMode=kCAFillModeForwards;
//    
//    CABasicAnimation * basicAnimO=[CABasicAnimation animationWithKeyPath:@"opacity"];
//    basicAnimO.duration=0.8;
//    basicAnimO.fromValue=[NSNumber numberWithInteger:1];
//    basicAnimO.toValue=[NSNumber numberWithInteger:0];
//    [mLayer addAnimation:basicAnimF forKey:@"basicAnimF"];
//    [mLayer addAnimation:basicAnimO forKey:@"basicsAnimO"];
//    basicAnimO.removedOnCompletion=NO;
//    basicAnimO.fillMode=kCAFillModeForwards;
////    [UIView animateWithDuration:5 delay:1 options:UIViewAnimationOptionCurveEaseIn  animations:^{
////        
////        mLayer.bounds=CGRectMake(mLayer.bounds.origin.x, mLayer.bounds.origin.y, mLayer.bounds.size.width*10, mLayer.bounds.size.height*10);
////        
////        mLayer.opacity=0;
////        
////        
////    } completion:^(BOOL finished) {
////        
////    }];
//    
//    UIView * maskBackgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width,self.window.bounds.size.height)];
//    
//    
//    [self.window.rootViewController.view addSubview:maskBackgroundView];
    
    
    
    
    [self.window makeKeyAndVisible];
    self.window.backgroundColor=[UIColor colorWithRed:128.0/255.0 green:000/255.0 blue:0/255.0 alpha:1.0];
    UINavigationController * navc=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    self.window.rootViewController=navc;
    
    //logo mask
    CALayer * maskLayer=[CALayer layer];
    maskLayer.contents=(id)[UIImage imageNamed:@"logo"].CGImage;
    maskLayer.position=navc.view.center;
    maskLayer.bounds=CGRectMake(0, 0, 60, 60);
    navc.view.layer.mask=maskLayer;
    
    //logo mask background view----不然的话会看到正式的内容
    UIView * maskBackgroundView=[[UIView alloc] initWithFrame:navc.view.bounds];
    maskBackgroundView.backgroundColor=[UIColor whiteColor];
    [navc.view addSubview:maskBackgroundView];
    [navc.view bringSubviewToFront:maskBackgroundView];
    
    //log mask  animation
    CAKeyframeAnimation * logoMaskAnimation=[CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    logoMaskAnimation.duration=1.0f;
    logoMaskAnimation.beginTime=CACurrentMediaTime()+1.0f;
    
    CGRect initalBounds=maskLayer.bounds;
    CGRect secondBounds=CGRectMake(0, 0, 50, 50);
    CGRect finalBounds=CGRectMake(0, 0, 2000, 2000);
    logoMaskAnimation.keyTimes=@[@(0),@(0.5),@(1)];
    logoMaskAnimation.values=@[[NSValue valueWithCGRect:initalBounds],[NSValue valueWithCGRect:secondBounds],[NSValue valueWithCGRect:finalBounds]];
    
    
    logoMaskAnimation.removedOnCompletion= NO;
    logoMaskAnimation.fillMode=kCAFillModeForwards;
    [navc.view.layer.mask addAnimation:logoMaskAnimation forKey:@"logoMaskAnimation"];
    
    
    [UIView animateWithDuration:0.8 delay:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        maskBackgroundView.alpha=0;
        
    } completion:^(BOOL compeletion){
        [maskBackgroundView removeFromSuperview];
    }];
    
    
    [UIView animateWithDuration:0.3 delay:1.8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        navc.view.transform=CGAffineTransformMakeScale(1.1, 1.1);
        
    } completion:^(BOOL finished) {
        navc.view.transform=CGAffineTransformIdentity;
    }];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
