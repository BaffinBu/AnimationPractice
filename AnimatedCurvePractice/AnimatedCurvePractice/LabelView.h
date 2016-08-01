//
//  LabelView.h
//  AnimatedCurvePractice
//
//  Created by wy0012 on 16/7/4.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,PULLINGSTATE){
    UP,
    DOWN
};


@interface LabelView : UICollectionReusableView

//labelvie的进度0-1
@property(nonatomic,assign) CGFloat progress;

//是否正在刷新
@property(nonatomic,assign) BOOL loading;

//上拉还是下拉
@property(nonatomic,assign)  PULLINGSTATE state;
@end
