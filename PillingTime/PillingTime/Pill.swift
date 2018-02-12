
import Foundation

class Pill {
    
    var iconName = ""
    var title = ""
    var memo = ""
    var meridianCheckList: [Meridian: Check]
    var detail = ""
    var time = ""
    
    
    init(iconName: String, title: String, memo: String, meridianCheckList: [Meridian: Check], detail: String) {
        self.iconName = iconName
        self.title = title
        self.memo = memo
        self.meridianCheckList = meridianCheckList
        self.detail = detail
    }
}

extension Pill: Equatable {
    static func ==(lhs: Pill, rhs: Pill) -> Bool {
        return lhs.title == rhs.title
    }
}

enum Meridian: String {
    case 아침 = "아침"
    case 점심 = "점심"
    case 저녁 = "저녁"
}

enum Check {
    case check
    case uncheck
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
