
import UIKit
import UserNotifications

class SettingTableViewController: UITableViewController {
    
    let alarmStore = AlarmData.sharedInstnce
    
    private var dateCellExpanded: Bool = false
    private var dateCellExpanded1: Bool = false
    private var dateCellExpanded2: Bool = false
    
    let sectionsName = ["알람 설정", "시간대별 설정"]
    let timeItem = ["아침", "점심", "저녁"]
    let switchItem = ["알람 설정"]
    
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
    
    // 알람
    func timedNotifications(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        
        let content = UNMutableNotificationContent()
        
        content.title = "Breaking News"
        content.subtitle = "Net Neutrality is not working"
        content.body = "zzzzzzzzzzzzzzzzz"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
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
            
            let settingSwitchState = UserDefaults.standard.bool(forKey: "settingSwitchState")
            cell.settingSwitch.setOn(settingSwitchState, animated: false)
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTimeTableViewCell", for: indexPath) as! SettingTimeTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.titleLabel.tag = indexPath.row
            cell.titleLabel?.text = timeItem[indexPath.row]
            
            guard let datePickerData = UserDefaults.standard.object(forKey: "datePicker\(String(indexPath.row))") as? Date else { return cell}
            cell.datePicker.setDate(datePickerData, animated: false)
            
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .none
            dateformatter.timeStyle = .short
            cell.timeLabel.text = dateformatter.string(from: datePickerData)

            return cell
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                if dateCellExpanded {
                    dateCellExpanded = false
                } else {
                    dateCellExpanded = true
                }
                tableView.beginUpdates()
                tableView.endUpdates()
            case 1:
                if dateCellExpanded1 {
                    dateCellExpanded1 = false
                } else {
                    dateCellExpanded1 = true
                }
                tableView.beginUpdates()
                tableView.endUpdates()
            case 2:
                if dateCellExpanded2 {
                    dateCellExpanded2 = false
                } else {
                    dateCellExpanded2 = true
                }
                tableView.beginUpdates()
                tableView.endUpdates()
            default: break
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                if dateCellExpanded {
                    return 210
                } else {
                    return 40
                }
            case 1:
                if dateCellExpanded1 {
                    return 210
                } else {
                    return 40
                }
                
            case 2:
                if dateCellExpanded2 {
                    return 210
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

extension SettingTableViewController {
    @IBAction func modalDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        // 알람
        timedNotifications(inSeconds: 3) { (success) in
            if success {
                print("Successfully Notified")
            }
        }
    
    }
    
}






























