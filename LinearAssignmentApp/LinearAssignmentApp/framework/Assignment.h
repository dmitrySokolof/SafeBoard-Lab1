//
//  Assignment.h
//  LinearAssignmentApp
//
//  Created by Dmitry Sokolov on 29.11.2018.
//  Copyright © 2018 SokolofDA. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSMutableArray<NSMutableArray*> matrix;

struct result {
    // True if the algorithm completed and found a solution.
    bool success;
    // The solution
    matrix *assignment;
    // A normalized form of the input cost matrix.
    matrix *cost;
    // The costs incurred by the assignment
    int totalCost;
};

@interface AssignmentManager : NSObject
{
    NSMutableArray<NSMutableArray*> * m_costs;
    struct result m_assignmentRes;
}


- (matrix*)getCost;
- (void)setCost:(matrix*)cost;
- (void)setCostAtIndex:(NSInteger)elem withRow:(NSInteger)row withColumn:(NSInteger)column;
- (NSArray<NSArray*>*)calculate;

@end
