//
//  Pill.swift
//  PillingTime
//
//  Created by Enirobot on 2018. 1. 31..
//  Copyright © 2018년 Enirobot. All rights reserved.
//

import Foundation

let UNCHECK = 0
let CHECK = 1


class Pill {
    
    var title = ""
    var memo = ""
    var alarms: [AlarmTable]? = nil
    
    init(title: String, memo: String) {
        self.title = title
        self.memo = memo
    }
    
}

class AlarmTable {
    var alarm : Alarm?
    var days : [Days]?
    var Confirm = UNCHECK
    
    init(alarm: Alarm, days: [Days]) {
        self.alarm = alarm
        self.days = days
    }
    
}

class Alarm {
    var year = 0
    var month = 0
    var day = 0
    var hour = 0
    var minute = 0
    var merifian : Meridian?
    
    init(hour: Int, minute: Int, merifian: Meridian) {
        self.hour = hour
        self.minute = minute
        self.merifian = merifian
    }
    
}

enum Meridian {
    case 오전
    case 오후
}

enum Days {
    case 월
    case 화
    case 수
    case 목
    case 금
    case 토
    case 일
}


enum ToDoSectionType {
    case image
    case title
    case memo
    case alarmAdd
    //case alarmTables([AlarmTable])
}


enum SectionType {
    case Information
    case Alarm
}



