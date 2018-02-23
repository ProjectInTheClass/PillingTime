//
//  TimeLinePill.swift
//  PillingTime
//
//  Created by Enirobot on 2018. 2. 23..
//  Copyright © 2018년 Enirobot. All rights reserved.
//

import Foundation

struct TimeLinePill: Codable{
    var iconName = ""
    var title = ""
    var memo = ""
    var meridianCheckList: [String: String] = [:]
    var detail = ""
    var time = ""
}

