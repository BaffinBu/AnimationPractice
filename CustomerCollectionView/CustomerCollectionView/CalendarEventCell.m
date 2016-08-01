//
//  CalendarEventCell.m
//  CustomerCollectionView
//
//  Created by wy0012 on 16/5/25.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "CalendarEventCell.h"

@implementation CalendarEventCell

-(id) initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        [self setUp];
    }
    
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    if([super initWithCoder:aDecoder]){
        [self setUp];
    }
    return self;
}


-(void) setUp{
    self.layer.cornerRadius=10;
    self.layer.borderWidth=1.0;
    self.layer.borderColor=[UIColor greenColor].CGColor;
}

@end
