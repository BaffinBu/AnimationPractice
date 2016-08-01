//
//  SlideView.h
//  BaffinSlideMenu
//
//  Created by wy0012 on 16/5/3.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^callBackBlock)();



@interface MySlideView : UIView
@property (nonatomic,copy) callBackBlock callBack;


-(instancetype) initWithTitle:(NSString *) title Color:(UIColor *) color Valueframe:(NSValue *) frame;
-(void) showSlideView;
-(void) hideSlideView;
@end
