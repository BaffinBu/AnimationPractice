//
//  UIView+Convenient.h
//  AnimatedCurvePractice
//
//  Created by wy0012 on 16/7/4.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMovetoCenter(CGRect rect,CGPoint center);

@interface UIView (Convenient)


@property CGPoint origin;
@property CGSize size;
@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;
@property CGFloat height;
@property CGFloat width;
@property CGFloat top;
@property CGFloat left;
@property CGFloat bottom;
@property CGFloat right;
@property CGFloat x;
@property CGFloat y;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

@end
