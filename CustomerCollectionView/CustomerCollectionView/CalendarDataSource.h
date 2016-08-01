//
//  CalendarDataSource.h
//  CustomerCollectionView
//
//  Created by wy0012 on 16/5/25.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CalendarEvent.h"
#import "CalendarEventCell.h"
#import "HeaderView.h"
typedef void (^ConfigureCellBlock)(CalendarEventCell * cell,NSIndexPath * indexPath,id<CalendarEvent>);


typedef void (^ConfigureHeaderViewBlock)(HeaderView *headerView,NSString * kind,NSIndexPath * indexPath);


@interface CalendarDataSource : NSObject<UICollectionViewDataSource>

@property(copy,nonatomic) ConfigureCellBlock configureCellBlock;
@property(copy,nonatomic) ConfigureHeaderViewBlock configureHeaderViewBlock;


-(id<CalendarEvent>) eventAtIndexPath:(NSIndexPath *) indexPath;

-(NSArray *) indexPathsOfEventsBetweenMinDayIndex:(NSInteger) minDayIndex maxDayIndex:(NSInteger) maxDayIndex minStartHour:
(NSInteger) minStartHour:(NSInteger) maxStartHour;





@end
