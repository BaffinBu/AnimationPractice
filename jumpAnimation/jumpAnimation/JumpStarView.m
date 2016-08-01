//
    //  JumpStarView.m
//  jumpAnimation
//
//  Created by wy0012 on 16/6/1.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "JumpStarView.h"
#import <UIKit/UIKit.h>
#define jumpDuration 0.125
#define downDuration 0.125
@interface JumpStarView()
@property(nonatomic,strong) UIImageView * starView;
@property(nonatomic,strong) UIImageView * shadowView;
@end


@implementation JumpStarView{
    BOOL animating;
}

-(id) init{
    self=[super init];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    if([super initWithCoder:aDecoder]){
        [self setUpUI];
    }
    return self;
}
-(id) initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        
    }
    return self;
}


- (void) setUpUI{
    self.backgroundColor=[UIColor clearColor];
    if(self.starView==nil){
        self.starView=[[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2-(self.bounds.size.width-6)/2, 0, self.bounds.size.width-6, self.bounds.size.height-6)];
        self.starView.contentMode=UIViewContentModeScaleToFill;
        [self addSubview:self.starView];
    }
    if (self.shadowView == nil) {
        self.shadowView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width/2 - 10/2, self.bounds.size.height - 3, 10, 3)];
        self.shadowView.alpha = 0.4;
        self.shadowView.image = [UIImage imageNamed:@"shadow_new"];
        [self addSubview:self.shadowView];
    }
    
}

- (void) setState:(STATE) state{
    _state=state;
    self.starView.image=_state==Mark ? _markedImage : _non_markedImage;
}
-(void) animate{
    if(animating==YES){
        return;
    }
    animating=YES;
    CABasicAnimation * transformAnim=[CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    transformAnim.fromValue=@(0);
    transformAnim.toValue=@(M_PI_2);
    transformAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CABasicAnimation * positionAnim=[CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnim.fromValue=@(self.starView.center.y);
    positionAnim.toValue=@(self.starView.center.y-14);
    positionAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup * animGroup=[CAAnimationGroup animation];
    animGroup.duration=jumpDuration;
    animGroup.fillMode=kCAFillModeForwards;
    animGroup.removedOnCompletion=NO;
    animGroup.delegate=self;
    animGroup.animations=@[transformAnim,positionAnim];
    
    [self.starView.layer addAnimation:animGroup forKey:@"jumpUp"];

}

-(void) animationDidStart:(CAAnimation *)anim{
    
}

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if([anim isEqual:[self.starView.layer animationForKey:@"jumpUp"]]){
        self.state=self.state==NonMark ? Mark :NonMark;
        
        CABasicAnimation * transformAnim=[CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        transformAnim.fromValue=@(M_PI_2);
        transformAnim.toValue=@(M_PI);
        transformAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        
        CABasicAnimation * positionAnim=[CABasicAnimation animationWithKeyPath:@"position.y"];
        positionAnim.fromValue=@(self.starView.center.y-14);
        positionAnim.toValue=@(self.starView.center.y);
        positionAnim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        
        CAAnimationGroup * animGroup=[CAAnimationGroup animation];
        animGroup.duration=jumpDuration;
        animGroup.fillMode=kCAFillModeForwards;
        animGroup.removedOnCompletion=NO;
        animGroup.delegate=self;
        animGroup.animations=@[transformAnim,positionAnim];
        
        [self.starView.layer addAnimation:animGroup forKey:@"jumpDown"];
    }else{
        [self.starView.layer removeAllAnimations];
        animating=NO;
    }
    
}
@end
