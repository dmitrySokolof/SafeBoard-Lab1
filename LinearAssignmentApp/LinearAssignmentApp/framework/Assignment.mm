//
//  Assignment.m
//  LinearAssignmentApp
//
//  Created by Dmitry Sokolov on 29.11.2018.
//  Copyright © 2018 SokolofDA. All rights reserved.
//

#import <Foundation/Foundation.h>
#include<model.h>
#import "Assignment.h"


matrix* convert(Hungarian::Matrix matr)
{
    
    long size = matr[0].size();
    
    NSMutableArray *newMatr = [[NSMutableArray alloc] initWithCapacity:size];
    
    for (int i = 0; i < size; i++) {
        
        NSMutableArray *innerArray = [[NSMutableArray alloc] initWithCapacity:size];
        
        for (auto elems : matr[i]) {
            id nsArray = [NSNumber numberWithInt:elems];
            [innerArray addObject:nsArray];
        }
        
        [newMatr addObject:innerArray];
    }
    
    return newMatr;
    
}

@interface AssignmentManager()
{
    model::AssignmentManager m_assignmentManager;
}
@end

@implementation AssignmentManager

- (instancetype)init {
    if(self = [super init]) {
        
    }
    return self;
}

- (void)setCostAtIndex:(NSInteger)elem withRow:(NSInteger)row withColumn:(NSInteger)column {
    m_assignmentManager.SetCostAtIndex(row, column, elem);
    
    m_costs = convert(m_assignmentManager.GetCost());
}

- (matrix*)getCost {
    return convert(m_assignmentManager.GetCost());
}

- (void)setCost:(matrix*)cost {
    
    auto size = [[cost objectAtIndex:0] count];
    
    std::vector<std::vector<int>> newCosts;
    
    for (int i = 0; i < size; i++) {
        
        NSMutableArray *innerArray = [[NSMutableArray alloc] initWithCapacity:size];
        
        innerArray = [cost objectAtIndex:i];
        
        newCosts.push_back(*new std::vector<int>);
        
        for (NSNumber *elem in innerArray) {
            newCosts.at(i).push_back([elem integerValue]);
        }
        
    }
    m_assignmentManager.SetCost(newCosts);

}
- (NSArray<NSArray*>*)calculate {
    Hungarian::Result m_assignment_res = Hungarian::Solve(m_assignmentManager.GetCost(), Hungarian::MODE_MINIMIZE_COST);
    m_assignmentRes.success = m_assignment_res.success;
    m_assignmentRes.totalCost = m_assignment_res.totalCost;
    m_assignmentRes.assignment = convert(m_assignment_res.assignment);
    m_assignmentRes.cost = convert(m_assignment_res.cost);
    
    if (!m_assignmentRes.success)
    {
        NSLog(@"Couldn't solve the matrix.\n");
    }
    
    return m_assignmentRes.assignment;
}
@end
