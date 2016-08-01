//
//  ChildXibView.h
//  BFLoadingHUB
//
//  Created by wy0012 on 16/6/28.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildXibView : UIView
- (void) setDataWithImage:(NSInteger) imageNum andText:(NSString *) str;

@property (strong, nonatomic) IBOutlet UIView *view;

@end
