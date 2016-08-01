//
//  ParentXibView.m
//  BFLoadingHUB
//
//  Created by wy0012 on 16/6/28.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ParentXibView.h"
#import "ChildXibView.h"
@interface ParentXibView()

@property (weak, nonatomic) IBOutlet ChildXibView *childViewFirst;

@property (weak, nonatomic) IBOutlet ChildXibView *childViewSecond;

@end

@implementation ParentXibView

- (void) awakeFromNib{
    
//    _childViewFirst=[[[NSBundle mainBundle] loadNibNamed:@"ChildXibView" owner:nil options:nil] objectAtIndex:0];
    [self setData];
    
}

-(void) setData{
    NSString * path=[[NSBundle mainBundle] pathForResource:@"picture" ofType:@"plist"];
    NSDictionary * picDict=[NSDictionary dictionaryWithContentsOfFile:path];
    NSArray * picArr=picDict[@"piclists"];
    if(_childViewFirst!=nil){
        [_childViewFirst setDataWithImage:[picArr[0] intValue] andText:@"测试的测试的"];
    }
}


@end
