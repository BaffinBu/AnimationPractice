//
//  ViewController.m
//  CustomerCollectionView
//
//  Created by wy0012 on 16/5/25.
//  Copyright © 2016年 wy0012. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib * headerViewNib=[UINib nibWithNibName:@"headerView" bundle:nil];
    [self.collectionView registerNib:headerViewNib forSupplementaryViewOfKind:@"DayHeaderView" withReuseIdentifier:@"HeaderView"];
    [self.collectionView registerNib:headerViewNib forSupplementaryViewOfKind:@"HourHeaderView" withReuseIdentifier:@"HeaderVIew"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
