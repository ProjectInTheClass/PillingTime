
import UIKit

class SettingTableViewController: UITableViewController {
    
    private var dateCellExpanded: Bool = false
    private var dateCellExpanded1: Bool = false
    private var dateCellExpanded2: Bool = false
    
    let sectionsName = ["시간대별 설정", "알림 스타일"]
    let timeItem = ["아침", "점심", "저녁"]
    let switchItem = ["잠금 화면에서 보기", "배지표기(상태바)"]
   
    
    @IBAction func modalDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsName.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section{
        case 0:
            return timeItem.count
        case 1:
            return switchItem.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTimeTableViewCell", for: indexPath) as! SettingTimeTableViewCell
            cell.titleLabel?.text = timeItem[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingAlarmTableViewCell", for: indexPath) as! SettingAlarmTableViewCell
            cell.titleLabel?.text = switchItem[indexPath.row]
            return cell
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
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
        
        if indexPath.section == 0 {
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
