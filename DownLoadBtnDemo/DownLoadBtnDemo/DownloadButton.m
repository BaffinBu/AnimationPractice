//
//  DownloadButton.m
//  DownLoadBtnDemo
//
//  Created by wy0012 on 16/6/3.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "DownloadButton.h"

@implementation DownloadButton{
    BOOL animating;
    CGRect originframe;
}

- (id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder: aDecoder];
    if(self){
        [self setUpSomething];
        self.layer.cornerRadius=self.frame.size.width/2;
    }
    return self;
}
- (id)init{
    self=[super init];
    if(self){
        
    }
    return self;
}

-(void) setUpSomething{
    UITapGestureRecognizer *tapGes=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tapGes];
}

#pragma mark -- UITapGesture
- (void) tapped:(UITapGestureRecognizer *) tapped{
    originframe=self.frame;
    if(animating==YES){
        return;
    }
    
    for(CALayer  *  subLayer in self.layer.sublayers)
    {
        [subLayer removeFromSuperlayer];
    }
    self.backgroundColor=[UIColor colorWithRed:0.0 green:122/255.0 blue:255/255.0 alpha:1.0];
    animating=YES;
    self.layer.cornerRadius=self.progressBarHeight/2;
    
    CABasicAnimation * radiusShrinkAnimation=[CABasicAnimation animationWithKeyPath:@"cornerRaduis"];
    radiusShrinkAnimation.duration=0.2f;
    radiusShrinkAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    radiusShrinkAnimation.fromValue=@(originframe.size.height/2);
    radiusShrinkAnimation.delegate=self;
    [self.layer addAnimation:radiusShrinkAnimation forKey:@"cornerRaduisShrinkAnim"];
    
}

- (void)animationDidStart:(CAAnimation *)anim{
    
    if([anim isEqual:[self.layer animationForKey:@"cornerRaduisShrinkAnim"]]){
        [UIView animateWithDuration:0.6f delay:0.0f usingSpringWithDamping:0.6
              initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.bounds=CGRectMake(0, 0, _progressBarWidth, _progressBarHeight);
        } completion:^(BOOL finished) {
            [self.layer removeAllAnimations];
            [self progressBarAnimation];
            
        }];
    }else if([anim isEqual:[self.layer animationForKey:@"cornerRadiusExpandAnim"]])
    {
        [UIView animateWithDuration:0.6f delay:0.0f usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.bounds=CGRectMake(0, 0, originframe.size.width, originframe.size.height);
            self.backgroundColor=[UIColor colorWithRed:0.18 green:0.8 blue:0.44 alpha:1.0];
        } completion:^(BOOL finished) {
            [self.layer removeAllAnimations];
            [self checkAnimation];
            animating=NO;
        }];
    }else{
        
    }
    
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if([[anim valueForKey:@"animationName"] isEqualToString:@"progressBarAnimation"]){
        
        
         [UIView animateWithDuration:0.3 animations:^{
             for(CALayer * subLayer in self.layer.sublayers){
                 subLayer.opacity=0.0f;
             }
         } completion:^(BOOL finished) {
             if(finished){
                 for(CALayer * subLayer in self.layer.sublayers){
                     [subLayer removeFromSuperlayer];
                 }
                 
                 self.layer.cornerRadius=originframe.size.height/2;
                 
                 CABasicAnimation * raduisExpandAnimation=[CABasicAnimation animationWithKeyPath:@"cornerRaduis"];
                 raduisExpandAnimation.duration=0.2f;
                 raduisExpandAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
                 raduisExpandAnimation.fromValue=@(_progressBarHeight/2);
                 raduisExpandAnimation.delegate=self;
                 [self.layer addAnimation:raduisExpandAnimation forKey:@"cornerRadiusExpandAnim"];
             }
         }];
        
    }
}

- (void)progressBarAnimation{
    CAShapeLayer * progressLayer=[CAShapeLayer layer];
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(_progressBarHeight/2, self.bounds.size.height/2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width-_progressBarHeight/2, self.bounds.size.height/2)];
    progressLayer.path=path.CGPath;
    progressLayer.strokeColor=[UIColor whiteColor].CGColor;
    progressLayer.lineWidth=_progressBarHeight-6;
    progressLayer.lineCap=kCALineCapRound;
    [self.layer addSublayer:progressLayer];
    
    CABasicAnimation *pathAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration=2.0f;
    pathAnimation.fromValue=@(0.0f);
    pathAnimation.toValue=@(1.0f);
    pathAnimation.delegate=self;
    [pathAnimation setValue:@"progressBarAnimation" forKey:@"animationName"];
    [progressLayer addAnimation:pathAnimation forKey:nil];
}

- (void) checkAnimation{
    CAShapeLayer * checkLayer=[CAShapeLayer layer];
    
    UIBezierPath * path=[UIBezierPath bezierPath];
    CGRect rectInCircle=CGRectInset(self.bounds, self.bounds.size.width*(1-1/sqrt(2.0))/2, self.bounds.size.width *(1-1/sqrt(2.0))/2);
    [path moveToPoint:CGPointMake(rectInCircle.origin.x + rectInCircle.size.width/9, rectInCircle.origin.y + rectInCircle.size.height*2/3)];
    [path addLineToPoint:CGPointMake(rectInCircle.origin.x + rectInCircle.size.width/3,rectInCircle.origin.y + rectInCircle.size.height*9/10)];
    [path addLineToPoint:CGPointMake(rectInCircle.origin.x + rectInCircle.size.width*8/10, rectInCircle.origin.y + rectInCircle.size.height*2/10)];
    checkLayer.path=path.CGPath;
    checkLayer.fillColor=[UIColor clearColor].CGColor;
    checkLayer.strokeColor=[UIColor whiteColor].CGColor;
    checkLayer.lineWidth=10.0;
    checkLayer.lineCap=kCALineCapRound;
    checkLayer.lineJoin=kCALineJoinRound;
    [self.layer addSublayer:checkLayer];
    
    
    
    CABasicAnimation *checkAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.duration=0.3f;
    checkAnimation.fromValue=@(0.0f);
    checkAnimation.toValue=@(1.0f);
    checkAnimation.delegate=self;
    [checkAnimation setValue:@"checkAnimation" forKey:@"animationName"];
    [checkLayer addAnimation:checkAnimation forKey:nil];
}

@end
