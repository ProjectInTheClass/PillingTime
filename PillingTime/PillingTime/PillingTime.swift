//
//  PillingTime.swift
//  PillingTime
//
//  Created by iMac05 on 1/24/18.
//  Copyright © 2018 iMac05. All rights reserved.
//

import Foundation

class Set {
    var image: String
    var name: String
    var numberOfPill: Int
    var startDate: Date
    var endDate: Date
    var memo: String
    
    init(image: String, name: String, numberOfPill: Int, startDate: Date, endDate: Date, memo: String) {
        self.image = image
        self.name = name
        self.numberOfPill = numberOfPill
        self.startDate = startDate
        self.endDate = endDate
        self.memo = memo
    }
}

enum days{
    case 월
    case 화
    case 수
    case 목
    case 금
    case 토
    case 일
}

class Alarm {
    var hour: Int
    var minute: Int
    var meridian: String
    var days: days
    
    init(hour: Int, minute: Int, meridian: String, days: days) {
        self.hour = hour
        self.minute = minute
        self.meridian = meridian
        self.days = days
    }
    
}
