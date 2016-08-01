//
//  ChildXibView.m
//  BFLoadingHUB
//
//  Created by wy0012 on 16/6/28.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ChildXibView.h"

@interface ChildXibView()
@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;
@property (weak, nonatomic) IBOutlet UIImageView *childImageView;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@end

@implementation ChildXibView

- (void) setDataWithImage:(NSInteger) imageNum andText:(NSString *) str;{
    [_descriptLabel setText:str];
    _childImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)imageNum]];
}


- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super initWithCoder:aDecoder]){
        [[NSBundle mainBundle] loadNibNamed:@"ChildXibView" owner:self options:nil];
        [self addSubview:_view];
        
    }
       return self;
}
       
       
@end
