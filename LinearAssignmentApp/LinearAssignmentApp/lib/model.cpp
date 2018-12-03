//
//  model.cpp
//  LinearAssignmentApp
//
//  Created by Dmitry Sokolov on 29.11.2018.
//  Copyright © 2018 SokolofDA. All rights reserved.
//
#pragma once
#include <iostream>
#include <algorithm>
#include <thread>
#include <mutex>
#include "model.h"

namespace model {
    
    class CriticalSection
    {
    public:
        void lock()
        {
            m_mutex.lock();
        }
        void unlock()
        {
            m_mutex.unlock();
        }
    private:
        std::mutex m_mutex;
    };
    
    typedef std::lock_guard<CriticalSection> LockGuard;
    
    AssignmentManager::AssignmentManager()
        : m_cs(new CriticalSection)
    {
        m_assignment_res.cost = {
            {0, 0, 0},
            {0, 0, 0},
            {0, 0, 0}
        };
    }
    
    AssignmentManager::~AssignmentManager()
    {
        
    }
    
    Hungarian::Matrix AssignmentManager::GetCost() const
    {
        LockGuard lock(*m_cs.get());
        return m_assignment_res.cost;
    }
    
    void AssignmentManager::SetCost(const Hungarian::Matrix& newValue)
    {
        LockGuard lock(*m_cs.get());
        m_assignment_res.cost = newValue;
    }
    
    void AssignmentManager::SetCostAtIndex(int row, int column, int elem)
    {
        LockGuard lock(*m_cs.get());
        m_assignment_res.cost.at(row).at(column) = elem;
    }
    
    Hungarian::Result AssignmentManager::Calculate()
    {
        LockGuard lock(*m_cs.get());
        m_assignment_res = Hungarian::Solve(m_assignment_res.cost, Hungarian::MODE_MINIMIZE_COST);
        if (m_assignment_res.success)
        {
            return m_assignment_res;
        }
        else
        {
            std::cout << "Couldn't solve the matrix.\n";
            return m_assignment_res;
        }
    }
    
} // model


