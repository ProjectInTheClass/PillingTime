
import UIKit

var historyList: [TimeLineSection] = []
//var history: [Pill] = []

class TimeLineTableViewController: UITableViewController {
    
    let checkImage = "Ellipse"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("TimeLinePillList.count 값 : \(PillList.count)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("TimeLine Table viewWillAppear 시작")
        
        if PillList.count != 0 && TimeLineUpdateCheck == true {
            print("PillList.count != 0 && TimeLineUpdateCheck == true")
            
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let stringDate = dateFormatter.string(from: date)
            
            let history = PillList.filter({ $0.time == stringDate })
            
            print(" ")
            for item in history {
                print("item title : \(item.title), item time : \(item.time)")
            }
            print(" ")
            
            guard let todayHistoryIndex: Int =  historyList.index(where: { $0.time == stringDate }) else {
                historyList.append(TimeLineSection(time: stringDate, Pills: history))
                return
            }
            
            print("")
            print("todayHistoryIndex 값 : \(String(describing: todayHistoryIndex))")
            print("")

            for PillItem in history {
//                print("item title : \(PillItem.title), item time : \(PillItem.time)")
                
                for historyItem in historyList[todayHistoryIndex].Pills {
//                    print("item title : \(historyItem.title), item time : \(historyItem.time)")
                    if historyItem.title != PillItem.title && historyItem.time == PillItem.time {
                        historyList[todayHistoryIndex].Pills.append(PillItem)
//                        print("historyList에 값 추가 =======================================================================================================")
                    }
                }
            }
 
            print("")
            for item in historyList[todayHistoryIndex].Pills {
                print("historyList[todayHistoryIndex].Pills 시간 값 : \(item.time)")
            }
            print("")
            
            TimeLineUpdateCheck = false
        }
        tableView.reloadData()
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return historyList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList[section].Pills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineTableViewCell", for: indexPath) as! TimeLineTableViewCell
        
            cell.titleLabel.text = historyList[indexPath.section].Pills[indexPath.row].title
            cell.memoLabel.text = historyList[indexPath.section].Pills[indexPath.row].memo
        
        for item in historyList[indexPath.section].Pills[indexPath.row].meridianCheckList {
            switch item.key {
            case .아침:
                if item.value == .check {
                    cell.morningImageView.image = UIImage(named: checkImage)
                } else {
                    cell.morningButton.isEnabled = true
                }
            case .점심:
                if item.value == .check {
                    cell.lunchImageView.image = UIImage(named: checkImage)
                } else {
                    cell.lunchButton.isEnabled = true
                }
            case .저녁:
                if item.value == .check {
                    cell.dinnerImageView.image = UIImage(named: checkImage)
                } else {
                    cell.dinnerButton.isEnabled = true
                }
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if historyList.count != 0 {
            let stringDate = historyList[section].time
            return stringDate
        } else {
            return nil
        }
    }

}
