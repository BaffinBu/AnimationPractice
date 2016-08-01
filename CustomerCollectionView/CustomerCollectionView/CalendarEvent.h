//
//  CalendarEvent.h
//  CustomerCollectionView
//
//  Created by wy0012 on 16/5/25.
//  Copyright © 2016年 wy0012. All rights reserved.
//

@protocol CalendarEvent <NSObject>
@property(copy,nonatomic) NSString * title;
@property(assign,nonatomic) NSInteger day;
@property(assign,nonatomic) NSInteger startHour;
@property(assign,nonatomic) NSInteger durationInHours;
@end