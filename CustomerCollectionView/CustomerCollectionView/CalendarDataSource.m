//
//  CalendarDataSource.m
//  CustomerCollectionView
//
//  Created by wy0012 on 16/5/25.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "CalendarDataSource.h"
#import <Foundation/Foundation.h>


@interface CalendarDataSource()
@property(strong,nonatomic) NSMutableArray * events;

@end


@implementation CalendarDataSource




-(id<CalendarEvent>) eventAtIndexPath:(NSIndexPath *)indexPath{
    return self.events[indexPath.item];
}


-(NSArray *) indexPathsOfEventsBetweenMinDayIndex:(NSInteger)minDayIndex maxDayIndex:(NSInteger)maxDayIndex minStartHour:(NSInteger)minStartHour :(NSInteger)maxStartHour{
    
    
    NSMutableArray * indexPaths=[NSMutableArray array];
    self.events enumerateObjectsUsingBlock:^(id  event, NSUInteger idx, BOOL * _Nonnull stop) {
        if([event day]>=minDayIndex&&[event day]<=maxDayIndex){
            
        }
    }
    
}


@end
