//
//  model.h
//  LinearAssignmentApp
//
//  Created by Dmitry Sokolov on 29.11.2018.
//  Copyright © 2018 SokolofDA. All rights reserved.
//

#pragma once
#include "hungarian.hpp"

namespace model
{
    
class CriticalSection;

class AssignmentManager
{
public:
    AssignmentManager();
    ~AssignmentManager();
    
    Hungarian::Matrix GetCost() const;
    
    void SetCostAtIndex(int row, int column, int elem);
    
    void SetCost(const Hungarian::Matrix& newValue);
    
    Hungarian::Result Calculate();
    
private:
    Hungarian::Result m_assignment_res;
    
    mutable std::unique_ptr<CriticalSection> m_cs;
};
    
} // model
