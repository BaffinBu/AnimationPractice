 //
//  SlideView.m
//  BaffinSlideMenu
//
//  Created by wy0012 on 16/5/3.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "MySlideView.h"
#import <UIKit/UIKit.h>

#define buttonSpace 30
#define menuBlankWidth 50


@interface MySlideView()

@property(nonatomic,strong) CADisplayLink * displayLink;

@end


@implementation MySlideView
{
    UIVisualEffectView * blurView;
    BOOL triggered;
    CGRect superFrame;
    CGFloat diff;
    UIColor *menuColor;
    
    UIView * helperUpView;
    UIView * helperCenterView;
    UIWindow * keyWindow;
    int count;
}


-(instancetype) initWithTitle:(NSString *) title Color:(UIColor *) color Valueframe:(NSValue *) frame{
    
    if(self=[super init]){
        
        keyWindow=[[UIApplication sharedApplication] keyWindow];
        
        self.frame=CGRectMake(-keyWindow.frame.size.width/2-menuBlankWidth, 0, keyWindow.frame.size.width/2+menuBlankWidth,keyWindow.frame.size.height);
        
        //问题?
        self.backgroundColor=[UIColor blackColor];
        
        
       //superFrame=frame.CGRectValue;

        
        self.alpha=1.0;
        menuColor=color;
        
//        blurView=[[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
//        blurView.frame=frame.CGRectValue;
//        blurView.alpha=0.0f;
        
        
        helperUpView=[[UIView alloc] init];
        helperUpView.frame=CGRectMake(-40,0, 30, 30);
        helperUpView.backgroundColor=[UIColor redColor];
        
        helperCenterView=[[UIView alloc] init];
        helperCenterView.frame=CGRectMake(-40, CGRectGetHeight(keyWindow.frame)/2 - 20, 30, 30);
        helperCenterView.backgroundColor=[UIColor yellowColor];
        
        NSLog(@"------------>%@",keyWindow);
        
        [keyWindow addSubview:helperCenterView];
        [keyWindow addSubview:helperUpView];
        
        [keyWindow insertSubview:self belowSubview:helperCenterView];
        
    }
    return self;
}

-(void) drawRect:(CGRect)rect{
  
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width-menuBlankWidth,0)];
    
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width-menuBlankWidth, self.frame.size.height) controlPoint:CGPointMake(keyWindow.frame.size.width/2+diff, keyWindow.frame.size.height/2)];
    
    [path addLineToPoint:CGPointMake(0,self.frame.size.height)];
    [path closePath];
    
    CGContextRef  context=UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path.CGPath);
    [menuColor set];
    CGContextFillPath(context);
}


-(void) showSlideView{
    
        [self beforeAnimation];
    
    [UIView animateWithDuration:0.3  animations:^{
        
        self.frame=self.bounds;}];
    
    

    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.5f initialSpringVelocity:0.9f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction animations:^{
        
        helperUpView.center=CGPointMake(keyWindow.center.x, helperUpView.frame.size.height/2);
    } completion:^(BOOL finished) {

    }];
    

    [self beforeAnimation];
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.8f initialSpringVelocity:2.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction animations:^{
        
        helperCenterView.center=keyWindow.center;
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void) hideSlideView{
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.8f initialSpringVelocity:2.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        self.frame=CGRectMake(0, 0, superFrame.size.width*0, superFrame.size.height);
        blurView.alpha=0.0f;
    } completion:^(BOOL finished) {

    }];
    
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7f initialSpringVelocity:2.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        helperUpView.center=CGPointMake(self.superview.frame.size.width*0.1, helperUpView.center.y);
    } completion:^(BOOL finished) {
       
    }];
    
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.8f initialSpringVelocity:0.9f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        helperCenterView.center=CGPointMake(self.superview.frame.size.width*0.1, helperCenterView.center.y);
    } completion:^(BOOL finished) {
       
    }];
}




-(void) beforeAnimation{
    if(self.displayLink==nil){
        self.displayLink=[CADisplayLink  displayLinkWithTarget:self selector:@selector(displayAction:)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}
-(void) afterAnimation{
    [self.displayLink invalidate];
   self. displayLink=nil;
}
-(void) displayAction:(CADisplayLink *) dis{
    CALayer * presentUpLayer=(CALayer *)[helperUpView.layer presentationLayer];
    CALayer * sideLayer=[helperCenterView.layer presentationLayer];
    
    CGFloat upX= presentUpLayer.frame.origin.x;
    CGFloat centerX=sideLayer.frame.origin.x;
    
    diff=upX-centerX;
    

    [self setNeedsDisplay];
}

@end
