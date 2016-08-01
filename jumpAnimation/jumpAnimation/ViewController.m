//
//  ViewController.m
//  jumpAnimation
//
//  Created by wy0012 on 16/6/1.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"
#import "JumpStarView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet JumpStarView *jumpView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _jumpView.markedImage=[UIImage imageNamed:@"icon_star_incell"];
    _jumpView.non_markedImage=[UIImage imageNamed:@"blue_dot"];
    _jumpView.state=NonMark;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)jumpMethod:(id)sender {
    
    [_jumpView animate];
    [UIView animateWithDuration:0.5 animations:^{
       _jumpView.frame=CGRectMake(_jumpView.frame.origin.x+40,_jumpView.frame.origin.y, _jumpView.frame.size.width
                                  , _jumpView.frame.size.height);
    }];
    
}

@end
