//
//  CurveLayer.m
//  AnimatedCurvePractice
//
//  Created by wy0012 on 16/7/4.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "CurveLayer.h"

#define  Radius 10
#define Space 1
#define LineLength 30
#define CenterY self.frame.size.height/2

#define Degree M_PI/3


@implementation CurveLayer

- (void)drawInContext:(CGContextRef)ctx{
    [super drawInContext:ctx];
    UIGraphicsPushContext(ctx);
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    //Draw
    //Path 1
    UIBezierPath * curvePath1=[UIBezierPath bezierPath];
    curvePath1.lineCapStyle=kCGLineCapRound;
    curvePath1.lineJoinStyle=kCGLineJoinRound;
    curvePath1.lineWidth=2.0f;
    
    //arrowPath
    UIBezierPath * arrowPath=[UIBezierPath bezierPath];
    if(self.progress<=0.5){
        CGPoint pointA=CGPointMake(self.frame.size.width/2-Radius,CenterY-Space+LineLength
                                   +(1-2*self.progress)*(CenterY-LineLength));
        CGPoint pointB=CGPointMake(self.frame.size.width/2-Radius, CenterY-Space+(1-2*self.progress)*
                                   (CenterY-LineLength));
        [curvePath1 moveToPoint:pointA];
        [curvePath1 addLineToPoint:pointB];
        
        //arrow
        [arrowPath moveToPoint:pointB];
        [arrowPath addLineToPoint:CGPointMake(pointB.x-3*(cosf(Degree)), pointB.y+3*(sinf(Degree)))];

    }else if(self.progress>0.5){
        CGPoint pointA=CGPointMake(self.frame.size.width/2-Radius, CenterY-Space+LineLength-LineLength*(self.progress-0.5)*2);
        CGPoint pointB=CGPointMake(self.frame.size.width/2-Radius, CenterY-Space);
        
        [curvePath1 moveToPoint:pointA];
        [curvePath1 addLineToPoint:pointB];
        [curvePath1 addArcWithCenter:CGPointMake(self.frame.size.width/2, CenterY-Space) radius:Radius startAngle:M_PI endAngle:M_PI+((M_PI*9/10)*(self.progress-0.5)*2) clockwise:YES];
        
        //arrow
        [arrowPath moveToPoint:curvePath1.currentPoint];
        [arrowPath addLineToPoint:CGPointMake(curvePath1.currentPoint.x - 3*(cosf(Degree  - ((M_PI*9/10) * (self.progress-0.5)*2))), curvePath1.currentPoint.y + 3*(sinf(Degree - ((M_PI*9/10) * (self.progress-0.5)*2))))];
        [curvePath1 appendPath:arrowPath];
    }
}


@end
