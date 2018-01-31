//
//  TimeLine.swift
//  PillingTime
//
//  Created by iMac05 on 1/31/18.
//  Copyright © 2018 Enirobot. All rights reserved.
//

import Foundation

class contents {
    var day:Int
    var name:String
    var hour:Int
    var minute:Int
    var meridian:String
    
    init(day:Int, name:String, hour:Int, minute:Int, meridian:String) {
        self.day = day
        self.name = name
        self.hour = hour
        self.minute = minute
        self.meridian = meridian
    }
}

class header {
    var year:Int
    var month:Int
    
    init(year:Int, month:Int) {
        self.year = year
        self.month = month
    }
}

enum Meridian {
    case 오전
    case 오후
}
