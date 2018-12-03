//
//  AssignmentViewController.h
//  LinearAssignmentApp
//
//  Created by Dmitry Sokolov on 30.11.2018.
//  Copyright © 2018 SokolofDA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Assignment.h>

@interface AssignmentViewController_objc : NSViewController
{
    IBOutlet NSArrayController *m_itemsArrayController;
}

@property (nonatomic, retain) AssignmentManager *manager;

- (NSArray<NSArray*>*)calculate;

@end
