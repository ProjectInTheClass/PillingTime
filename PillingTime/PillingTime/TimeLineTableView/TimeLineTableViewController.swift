
import UIKit

class TimeLineTableViewController: UITableViewController {
    
    let store = DataCenter.sharedInstnce
    let checkImage = "Ellipse"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if store.PillList.count != 0 {
            store.PillListTimeSync()
            store.historyListSync()
        }
        
        
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return store.historyList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.historyList[section].TimeLinePills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineTableViewCell", for: indexPath) as! TimeLineTableViewCell
        
        cell.TimeLinePill = store.historyList[indexPath.section].TimeLinePills[indexPath.row]
        
        for item in store.historyList[indexPath.section].TimeLinePills[indexPath.row].meridianCheckList {
            guard let key = Meridian(rawValue: item.key) else { return cell }
            
            switch key {
            case .아침:
                if Check(rawValue: item.value) == .check {
                    cell.morningImageView.image = UIImage(named: checkImage)
                } else {
                    cell.morningImageView.image = UIImage(named: " ")
                }
                cell.morningButton.isEnabled = true
            case .점심:
                if Check(rawValue: item.value) == .check {
                    cell.lunchImageView.image = UIImage(named: checkImage)
                } else {
                    cell.lunchImageView.image = UIImage(named: " ")
                }
                cell.lunchButton.isEnabled = true
            case .저녁:
                if Check(rawValue: item.value) == .check {
                    cell.dinnerImageView.image = UIImage(named: checkImage)
                } else {
                    cell.dinnerImageView.image = UIImage(named: " ")
                }
                cell.dinnerButton.isEnabled = true
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if store.historyList.count != 0 {
            let stringDate = store.historyList[section].time
            return stringDate
        } else {
            return nil
        }
    }

}
