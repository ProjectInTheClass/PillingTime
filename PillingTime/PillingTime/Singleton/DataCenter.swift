//
//  DataCenter.swift
//  PillingTime
//
//  Created by Enirobot on 2018. 2. 22..
//  Copyright © 2018년 Enirobot. All rights reserved.
//

import Foundation

class DataCenter {
    static let sharedInstnce = DataCenter()
    var PillList: [Pill] = []
    var classified: [ExpandableSection] = []
    var historyList: [TimeLineSection] = []

    var HomeUpdateCheck = false
    var TimeLineUpdateCheck = false

//    func save() {
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(PillList), forKey: "PillList")
//    }
//
//    func load() {
//        if let data = UserDefaults.standard.object(forKey: "PillList") as? Data {
//            PillList = try! PropertyListDecoder().decode([Pill].self, from: data)
//        }
//    }

    
    func save() {
        let encodeDate = NSKeyedArchiver.archivedData(withRootObject: PillList)
        UserDefaults.standard.setValue(encodeDate, forKey: "PillList")
    }

    func load() {
        guard let encodeDate = UserDefaults.standard.value(forKeyPath: "PillList") as? Data else { return }
        
        self.PillList = NSKeyedUnarchiver.unarchiveObject(with: encodeDate) as! [Pill]
    }
}
