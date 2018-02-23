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
    var today = ""

    
    func save() {
        let encodeDate = NSKeyedArchiver.archivedData(withRootObject: PillList)
        UserDefaults.standard.setValue(encodeDate, forKey: "PillList")
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(historyList), forKey: "historyList")
    }

    func load() {
        guard let encodeDate = UserDefaults.standard.value(forKeyPath: "PillList") as? Data else { return }
        self.PillList = NSKeyedUnarchiver.unarchiveObject(with: encodeDate) as! [Pill]
        
        if let data = UserDefaults.standard.object(forKey: "historyList") as? Data {
            historyList = try! PropertyListDecoder().decode([TimeLineSection].self, from: data)
        }
    }
    
    // historyList를 PillList와 동기화
    func historyListSync() {
        if PillList.isEmpty == false && TimeLineUpdateCheck == true {
            var tempList: [TimeLinePill] = []
            
            if historyList.count == 0 {
                historyList.insert( TimeLineSection(time: PillList[0].time, TimeLinePills: []), at: 0)
            }
            
            if PillList[0].time != historyList[0].time{
                historyList.insert( TimeLineSection(time: PillList[0].time, TimeLinePills: []), at: 0)
            }
            
            for item in PillList {
                tempList.append(
                    TimeLinePill(
                        iconName: item.iconName,
                        title: item.title,
                        memo: item.memo,
                        meridianCheckList: item.meridianCheckList.reduce(into: [String: String]()) { $0[$1.key.rawValue] = $1.value.rawValue },
                        detail: item.detail,
                        time: item.time ))
            }
            historyList[0].TimeLinePills = tempList
            TimeLineUpdateCheck = false
        }
    }
    
    // PillList item들을 오늘의 날짜로 동기화
    func PillListTimeSync() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        today = dateFormatter.string(from: date)
        
        if PillList.isEmpty == false && PillList[0].time != today {
            for item in PillList {
                item.time = today
            }
        }
    }
}
