//
//  AssignmentViewController.m
//  LinearAssignmentApp
//
//  Created by Dmitry Sokolov on 30.11.2018.
//  Copyright © 2018 SokolofDA. All rights reserved.
//

#import "AssignmentViewController.h"

@implementation AssignmentViewController_objc

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.manager = [AssignmentManager new];
    
}

- (NSArray<NSArray*>*)calculate
{
    return [self.manager calculate];
}

@end
