//
//  ViewController.swift
//  LinearAssignmentApp
//
//  Created by Dmitry Sokolov on 29.11.2018.
//  Copyright © 2018 SokolofDA. All rights reserved.
//

import Foundation
import Cocoa

class ViewController : NSViewController
{
    @objc let manager = AssignmentManager()
    
    var calculatedArray: [[Int]]!
    var res: Dictionary<String, String> = [:]
    @objc var resultArray: NSMutableArray = []
    
    @IBOutlet var m_resController: NSArrayController!
    
    @IBOutlet weak var r0c0: NSTextField!
    @IBOutlet weak var r1c0: NSTextField!
    @IBOutlet weak var r2c0: NSTextField!
    @IBOutlet weak var r0c1: NSTextField!
    @IBOutlet weak var r1c1: NSTextField!
    @IBOutlet weak var r2c1: NSTextField!
    @IBOutlet weak var r0c2: NSTextField!
    @IBOutlet weak var r1c2: NSTextField!
    @IBOutlet weak var r2c2: NSTextField!
    
    override func viewDidLoad()
    {
        self.m_resController.content = self.resultArray
    }

    @IBAction func calculateBtnTapped(_ sender: AnyObject?)
    {
        self.manager.setCostAt(r0c0?.integerValue ?? 0, withRow: 0, withColumn: 0)
        self.manager.setCostAt(r0c1?.integerValue ?? 0, withRow: 0, withColumn: 1)
        self.manager.setCostAt(r0c2?.integerValue ?? 0, withRow: 0, withColumn: 2)
        self.manager.setCostAt(r1c0?.integerValue ?? 0, withRow: 1, withColumn: 0)
        self.manager.setCostAt(r1c1?.integerValue ?? 0, withRow: 1, withColumn: 1)
        self.manager.setCostAt(r1c2?.integerValue ?? 0, withRow: 1, withColumn: 2)
        self.manager.setCostAt(r2c0?.integerValue ?? 0, withRow: 2, withColumn: 0)
        self.manager.setCostAt(r2c1?.integerValue ?? 0, withRow: 2, withColumn: 1)
        self.manager.setCostAt(r2c2?.integerValue ?? 0, withRow: 2, withColumn: 2)
        self.calculatedArray = self.manager.calculate() as? [[Int]]
       
        for i in 0...self.calculatedArray.count - 1
        {
            for j in 0...self.calculatedArray[i].count - 1
            {
                if 1 == self.calculatedArray[i][j]
                {
                    self.res["worker\(i + 1)"] = "job\(j + 1)"
                }
            }
        }
//        self.m_resController.addObject(res)
        
        self.willChangeValue(forKey: "resultArray")
        self.resultArray.add(res)
        self.didChangeValue(forKey: "resultArray")
    }
}

