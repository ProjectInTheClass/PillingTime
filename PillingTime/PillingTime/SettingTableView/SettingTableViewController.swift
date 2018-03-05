
import UIKit
import UserNotifications

class SettingTableViewController: UITableViewController {
    
    let alarmStore = AlarmData.sharedInstnce
    let timeLabelData = "눌러서 설정"
    
    private var dateCellExpanded: Bool = false
    private var dateCellExpanded1: Bool = false
    private var dateCellExpanded2: Bool = false
    
    var firstAlarmTableViewCell: SettingAlarmTableViewCell?
    var secondAlarmTableViewCell: SettingAlarmTableViewCell?
    var thirdAlarmTableViewCell: SettingAlarmTableViewCell?
    
    var firstTimeTableViewCell: SettingTimeTableViewCell?
    var secondTimeTableViewCell: SettingTimeTableViewCell?
    var thirdTimeTableViewCell: SettingTimeTableViewCell?
    
    let sectionsName = ["알람 설정", "시간대별 설정"]
    let timeItem = ["아침", "점심", "저녁"]
    let switchItem = ["아침 알람", "점심 알람", "저녁 알람"]
    let contents = [["body" : "아침 약 복용 시간입니다.", "identifier" : "morningAlarm"],
                    ["body" : "점심 약 복용 시간입니다.", "identifier" : "lunchAlarm"],
                    ["body" : "저녁 약 복용 시간입니다.", "identifier" : "dinnerAlarm"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        // 알람
        UNUserNotificationCenter.current().requestAuthorization(options:
        [.alert, .badge, .sound]) { (success, error) in
            
            if error != nil {
                print("Authorization Unsuccessfull")
            } else {
                print("Authorization Successfull")
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsName.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section{
        case 0:
            return switchItem.count
        case 1:
            return timeItem.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingAlarmTableViewCell", for: indexPath) as! SettingAlarmTableViewCell
            cell.titleLabel?.text = switchItem[indexPath.row]
            cell.settingSwitch.isEnabled = false
            
            switch indexPath.row {
            case 0:
                firstAlarmTableViewCell = cell
            case 1:
                secondAlarmTableViewCell = cell
            case 2:
                thirdAlarmTableViewCell = cell
            default:
                return cell
            }
            
            let settingSwitchIsEnabled = UserDefaults.standard.bool(forKey: "settingSwitchIsEnabled\(indexPath.row)")
            let settingSwitchIsSelected = UserDefaults.standard.bool(forKey: "settingSwitchIsSelected\(indexPath.row)")
            cell.settingSwitch.isEnabled = settingSwitchIsEnabled
            cell.settingSwitch.isSelected = settingSwitchIsSelected
            cell.settingSwitch.setOn(settingSwitchIsSelected, animated: false)
            cell.settingSwitch.tag = indexPath.row
            
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTimeTableViewCell", for: indexPath) as! SettingTimeTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.datePicker.tag = indexPath.row
            cell.titleLabel?.text = timeItem[indexPath.row]
            
            switch indexPath.row {
            case 0:
                firstTimeTableViewCell = cell
            case 1:
                secondTimeTableViewCell = cell
            case 2:
                thirdTimeTableViewCell = cell
            default:
                return cell
            }
            
            guard let datePickerData = UserDefaults.standard.object(forKey: "datePicker\(String(indexPath.row))") as? Date else { return cell }
            cell.datePicker.setDate(datePickerData, animated: false)
            
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .none
            dateformatter.timeStyle = .short
            let time = dateformatter.string(from: datePickerData)
            cell.timeLabel.text = time
            cell.date = time
            
            return cell
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                let chk = dateCellExpanded
                dateCellExpanded = !chk
            case 1:
                let chk = dateCellExpanded1
                dateCellExpanded1 = !chk
            case 2:
                let chk = dateCellExpanded2
                dateCellExpanded2 = !chk
            default: break
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                if dateCellExpanded {
                    return 256
                } else {
                    return 40
                }
            case 1:
                if dateCellExpanded1 {
                    return 256
                } else {
                    return 40
                }
                
            case 2:
                if dateCellExpanded2 {
                    return 256
                } else {
                    return 40
                }
            default:
                return 40
            }
        }
        return 40
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsName[section]
    }
}

// 클릭 이벤트
extension SettingTableViewController {
    
    // datePicker
    @IBAction func selectTime(_ sender: UIDatePicker) {
        var alarmCell: SettingAlarmTableViewCell?
        var timeCell: SettingTimeTableViewCell?
        var Pickerdate: String = ""
        var dateList: [String] = []
        var dateSpilt:  [String.SubSequence]?
        
        switch sender.tag {
        case 0:
            alarmCell = firstAlarmTableViewCell
            timeCell =  firstTimeTableViewCell
        case 1:
            alarmCell = secondAlarmTableViewCell
            timeCell = secondTimeTableViewCell
        case 2:
            alarmCell = thirdAlarmTableViewCell
            timeCell = thirdTimeTableViewCell
        default:
            return
        }
        
        guard let alarmCellSwitchState = alarmCell?.settingSwitch.isSelected else { return }
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        Pickerdate = dateformatter.string(from: (timeCell!.datePicker.date))
        timeCell!.timeLabel.text = Pickerdate
        timeCell!.date = Pickerdate
        UserDefaults.standard.set(timeCell!.datePicker.date, forKey: "datePicker\(String(sender.tag))")
        
        
        
        if alarmCellSwitchState == true {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [contents[sender.tag]["identifier"]!])
            
            dateSpilt = Pickerdate.split(separator: " ")
            dateList = [String(dateSpilt!.first!)] + dateSpilt![1].split(separator: ":").map { String($0) }
            
            
            timedNotifications(row: sender.tag, dateList: dateList) { (success) in
                if success {
                    print("Successfully Notified")
                }
            }
        }
        
        if alarmCell?.settingSwitch.isEnabled == false {
            alarmCell?.settingSwitch.isEnabled = true
            UserDefaults.standard.set(sender.isEnabled, forKey: "settingSwitchIsEnabled\(sender.tag)")
        }
    }
    
    // 알림 설정 버튼
    @IBAction func settingSwitchTapped(_ sender: UISwitch) {
        var timeCell: SettingTimeTableViewCell?
        var cellDate = ""
        var dateSpilt: [String.SubSequence]?
        var dateList: [String] = []
        
        switch sender.tag {
        case 0:
            timeCell = firstTimeTableViewCell
        case 1:
            timeCell = secondTimeTableViewCell
        case 2:
            timeCell = thirdTimeTableViewCell
        default:
            return
        }
        
        cellDate = timeCell!.date
        if cellDate.isEmpty == false {
            dateSpilt = cellDate.split(separator: " ")
            dateList = [String(dateSpilt!.first!)] + dateSpilt![1].split(separator: ":").map { String($0) }
        } else {
            sender.isEnabled = false
        }
        
        if sender.isSelected == false {
            sender.isSelected = true
            
            timedNotifications(row: sender.tag, dateList: dateList) { (success) in
                if success {
                    print("Successfully Notified")
                }
            }
            
        } else {
            sender.isSelected = false
            
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [contents[sender.tag]["identifier"]!])
            
        }
        UserDefaults.standard.set(sender.isSelected, forKey: "settingSwitchIsSelected\(sender.tag)")
    }
}


extension SettingTableViewController {
    // 알람
    func timedNotifications(row: Int, dateList: [String], completion: @escaping (_ Success: Bool) -> ()) {
        
        if dateList.isEmpty == true { return }
        
        let content = UNMutableNotificationContent()
        
        //content.title = contents[row]["title"]!
        //content.subtitle = contents[row]["title"]!
        content.body = contents[row]["body"]!
        
        var dateInfo = DateComponents()
        
        dateInfo.hour = Int(dateList[1])
        dateInfo.minute = Int(dateList[2])
        
        if dateList[0] == "오후" {
            dateInfo.hour! += 12
        }
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        let request = UNNotificationRequest(identifier: contents[row]["identifier"]!, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}



























