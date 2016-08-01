//
//  JumpStarView.h
//  jumpAnimation
//
//  Created by wy0012 on 16/6/1.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

//NS_ENUM(NSInteger,STATE){
//    NonMark,
//    Mark
//};
typedef enum STATE{
    NonMark,
    Mark
} STATE;


@interface JumpStarView : UIView

- (void) animate;
@property(nonatomic,assign,setter=setState:)enum STATE state;
@property(nonatomic,strong)UIImage * markedImage;
@property(nonatomic,strong) UIImage * non_markedImage;

@end
