
import UIKit

class TimeLineTableViewController: UITableViewController {
    
    let store = DataCenter.sharedInstnce
    let checkImage = "Ellipse"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("TimeLine Table viewWillAppear 시작")
        
        if store.PillList.count != 0 && store.TimeLineUpdateCheck == true {
            print("PillList.count != 0 && TimeLineUpdateCheck == true")
            
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let stringDate = dateFormatter.string(from: date)
            
            let history = store.PillList.filter({ $0.time == stringDate })
            
            print(" ")
            for item in history {
                print("item title : \(item.title), item time : \(item.time)")
            }
            print(" ")
            
            guard let todayHistoryIndex: Int =  store.historyList.index(where: { $0.time == stringDate }) else {
                store.historyList.append(TimeLineSection(time: stringDate, Pills: history))
                return
            }
            
            print("")
            print("todayHistoryIndex 값 : \(String(describing: todayHistoryIndex))")
            print("")

            for PillItem in history {
//                print("item title : \(PillItem.title), item time : \(PillItem.time)")
                
                for historyItem in store.historyList[todayHistoryIndex].Pills {
//                    print("item title : \(historyItem.title), item time : \(historyItem.time)")
                    if historyItem.title != PillItem.title && historyItem.time == PillItem.time {
                        store.historyList[todayHistoryIndex].Pills.append(PillItem)
//                        print("historyList에 값 추가 =======================================================================================================")
                    }
                }
            }
//
//            print("")
//            for item in store.historyList[todayHistoryIndex].Pills {
//                print("historyList[todayHistoryIndex].Pills 시간 값 : \(item.time)")
//            }
//            print("")
            
            store.TimeLineUpdateCheck = false
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
        return store.historyList[section].Pills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineTableViewCell", for: indexPath) as! TimeLineTableViewCell
        
        cell.pill = store.historyList[indexPath.section].Pills[indexPath.row]
        
        for item in store.historyList[indexPath.section].Pills[indexPath.row].meridianCheckList {
            switch item.key {
            case .아침:
                if item.value == .check {
                    cell.morningImageView.image = UIImage(named: checkImage)
                } else {
                    cell.morningImageView.image = UIImage(named: " ")
                }
                cell.morningButton.isEnabled = true
            case .점심:
                if item.value == .check {
                    cell.lunchImageView.image = UIImage(named: checkImage)
                } else {
                    cell.lunchImageView.image = UIImage(named: " ")
                }
                cell.lunchButton.isEnabled = true
            case .저녁:
                if item.value == .check {
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
