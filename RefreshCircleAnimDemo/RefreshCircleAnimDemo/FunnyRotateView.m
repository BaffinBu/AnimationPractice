//
//  FunnyRotateView.m
//  RefreshCircleAnimDemo
//
//  Created by wy0012 on 16/8/1.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "FunnyRotateView.h"

@implementation FunnyRotateView{
    
    //父layer
    CAShapeLayer * _parentLayer;
    //半圆layer
    CAShapeLayer *_uppperArcLayer;
    CAShapeLayer * _downArcLayer;
    CAShapeLayer * _upperArrowLayer;
    CAShapeLayer * _downArrowLayer;
}

-(id) initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setLayers];
        [self setPaths];
    }
    return self;
}



- (void) setLayers{
    _parentLayer=[[CAShapeLayer alloc] init];
    _parentLayer.lineCap=kCALineCapRound;
    _parentLayer.frame=self.bounds;
    
    _uppperArcLayer=[[CAShapeLayer alloc] init];
    _uppperArcLayer.lineCap=kCALineCapRound;
    _uppperArcLayer.lineJoin=kCALineJoinRound;
    _uppperArcLayer.strokeColor=[UIColor whiteColor].CGColor;
    _uppperArcLayer.fillColor=[UIColor clearColor].CGColor;
    _uppperArcLayer.lineWidth=3.0;
    
    
    _downArcLayer=[[CAShapeLayer alloc] init];
    _downArcLayer.lineCap=kCALineCapRound;
    _downArcLayer.lineJoin=kCALineJoinRound;
    _downArcLayer.strokeColor=[UIColor whiteColor].CGColor;
    _downArcLayer.fillColor=[UIColor clearColor].CGColor;
    _downArcLayer.lineWidth=3.0;
    
    
    _downArrowLayer=[[CAShapeLayer alloc] init];
    _downArrowLayer.lineCap=kCALineCapRound;
    _downArrowLayer.lineJoin=kCALineJoinRound;
    _downArrowLayer.strokeColor=[UIColor whiteColor].CGColor;
    _downArcLayer.lineWidth=3.0;
    
    [_parentLayer addSublayer:_uppperArcLayer];
    [_parentLayer addSublayer:_downArcLayer];
    [self.layer addSublayer:_parentLayer];
    
}
- (void) setPaths{
    UIBezierPath * _downArcPath=[UIBezierPath bezierPath];
    //这里不能用center
    [_downArcPath addArcWithCenter:CGPointMake(100, 100) radius:40 startAngle:(M_PI/20) endAngle:M_PI-(M_PI/20) clockwise:YES];
    _downArcLayer.path=_downArcPath.CGPath;
    
    UIBezierPath * _upperArcPath=[UIBezierPath bezierPath];
    [_upperArcPath addArcWithCenter:CGPointMake(100, 100) radius:40 startAngle:M_PI+(M_PI/20) endAngle:-(M_PI/20) clockwise:YES];
    _uppperArcLayer.path=_upperArcPath.CGPath;
}



-(void) startAnim{
    
    CABasicAnimation *rotateAnim=[[CABasicAnimation alloc] init];
    rotateAnim.keyPath=@"transform.rotation.z";
    rotateAnim.fromValue=@(0);
    rotateAnim.toValue=@(2*M_PI);
    rotateAnim.removedOnCompletion=NO;
    rotateAnim.repeatCount=30;
    rotateAnim.duration=1.0;
    rotateAnim.fillMode=kCAFillModeForwards;
    [_parentLayer addAnimation:rotateAnim forKey:@"rotateAnim"];
    
}


@end
