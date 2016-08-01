//
//  UIView+Convenient.m
//  AnimatedCurvePractice
//
//  Created by wy0012 on 16/7/4.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "UIView+Convenient.h"

CGPoint CGRectGetCenter(CGRect rect){
    
    CGPoint pt;
    pt.x=CGRectGetMidX(rect);
    pt.y=CGRectGetMidY(rect);
    return pt;
    
}
CGRect  CGRectMovetoCenter(CGRect rect,CGPoint center){
    CGRect newRect=CGRectMake(center.x-CGRectGetMidX(rect), center.y-CGRectGetMidY(rect), rect.size.width, rect.size.height);
    return newRect;
}


@implementation UIView (Convenient)

- (CGPoint) origin{
    return self.frame.origin;
}
- (void) setOrigin:(CGPoint) aPoint{
    CGRect newframe=self.frame;
    newframe.origin=aPoint;
    self.frame=newframe;
}
- (CGPoint) bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}




- (CGFloat) height
{
    return self.frame.size.height;
}
- (void) setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}




- (CGFloat) width
{
    return self.frame.size.width;
}
- (void) setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}



- (CGFloat) top
{
    return self.frame.origin.y;
}
- (void) setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}




- (CGFloat) left
{
    return self.frame.origin.x;
}
- (void) setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}



- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}
- (void) setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}



- (CGFloat) right
{
    return self.frame.origin.x + self.frame.size.width;
}
- (void) setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (CGFloat)x{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void) moveBy: (CGPoint) delta{
    CGPoint newCenter=self.center;
    newCenter.x+=delta.x;
    newCenter.y+=delta.y;
    self.center=newCenter;
}

- (void) scaleBy:(CGFloat)scaleFactor{
    self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width*scaleFactor, self.frame.size.height*scaleFactor);
}
- (void) fitInSize: (CGSize) aSize{
    CGFloat scale;
    CGRect newFrame=self.frame;
    if(newFrame.size.height&&(newFrame.size.height>aSize.height)){
        scale=aSize.height/newFrame.size.height;
        newFrame.size.height*=scale;
        newFrame.size.width*=scale;
    }
    
    
    if (newFrame.size.width && (newFrame.size.width >= aSize.width))
    {
        scale = aSize.width / newFrame.size.width;
        newFrame.size.width *= scale;
        newFrame.size.height *= scale;
    }
    
    self.frame=newFrame;
    
}



@end
