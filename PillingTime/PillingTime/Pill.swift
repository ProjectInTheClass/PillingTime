
import Foundation


class Pill: NSObject, NSCoding{

    var iconName = ""
    var title = ""
    var memo = ""
    var meridianCheckList: [Meridian: Check] = [:]
    var detail = ""
    var time = ""


    init(iconName: String, title: String, memo: String, meridianCheckList: [Meridian: Check], detail: String) {
        self.iconName = iconName
        self.title = title
        self.memo = memo
        self.meridianCheckList = meridianCheckList
        self.detail = detail
    }
    
    init(iconName: String, title: String, memo: String, detail: String, time: String) {
        self.iconName = iconName
        self.title = title
        self.memo = memo
        self.detail = detail
    }

    func encode(with aCoder: NSCoder) {
        var EncodeMeridianCheckList: [String: String] = [:]
        
        for (key, value) in meridianCheckList {
            EncodeMeridianCheckList[key.rawValue] = value.rawValue
        }
        
        aCoder.encode(self.iconName, forKey: "iconName")
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.memo, forKey: "memo")
        aCoder.encode(EncodeMeridianCheckList, forKey: "meridianCheckList")
        aCoder.encode(self.detail, forKey: "detail")
        aCoder.encode(self.time, forKey: "time")
    }

    required convenience init?(coder aDecoder: NSCoder) {
        guard let iconName = aDecoder.decodeObject(forKey: "iconName") as? String,
            let title = aDecoder.decodeObject(forKey: "title") as? String,
            let memo = aDecoder.decodeObject(forKey: "memo") as? String,
            let initMeridianCheckList = aDecoder.decodeObject(forKey: "meridianCheckList") as? [String: String],
            let detail = aDecoder.decodeObject(forKey: "detail") as? String,
            let time = aDecoder.decodeObject(forKey: "time") as? String else { return nil }
        
        self.init(iconName: iconName, title: title, memo: memo, detail: detail, time: time)
        
        for (key, value) in initMeridianCheckList {
            meridianCheckList[Meridian(rawValue: key)!] = Check(rawValue: value)
        }
    }
}


enum Meridian: String {
    case 아침 = "아침"
    case 점심 = "점심"
    case 저녁 = "저녁"
}

enum Check: String {
    case check = "check"
    case uncheck = "uncheck"
}

enum subTime {
    case 식후1시간
    case 식후30분
    case 식전30분
    case 식전1시간
}

enum AddPageSectionType {
    case imageAndTitle
    case timeSetting
    case memo
}


enum SettingPageSectionType {
    case AlarmSet
    case AlarmStyle
}

