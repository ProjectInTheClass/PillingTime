
import UIKit

var heightOfHeader : CGFloat = 50

var PillList: [Pill] = []
var updateCheck = false
class HomeTableViewController: UITableViewController {
    
    var classified: [ExpandableSection] = [ ExpandableSection(meridian: .아침, isExpanded: false, Pills: []),
                                            ExpandableSection(meridian: .점심, isExpanded: false, Pills: []),
                                            ExpandableSection(meridian: .저녁, isExpanded: false, Pills: [])]
    
    let sectionImageNames = ["sunrise", "sun", "misty-day"]
    let sectionNames = ["아침", "점심", "저녁"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(xib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 62
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Home PillList 개수 :" + "\(String(describing: PillList.count))")
        
        var indexPaths0 = [IndexPath]()
        var indexPaths1 = [IndexPath]()
        var indexPaths2 = [IndexPath]()
        
        
        if PillList.count != 0 && updateCheck == true {
            if classified[0].isExpanded == false {
                classified[0].Pills.removeAll()
                classified[1].Pills.removeAll()
                classified[2].Pills.removeAll()
            }
            
            for item in PillList {
                for key in item.meridianCheckList.keys {
                    if key == .아침 {
                        if classified[0].Pills.index(where: { $0.title == item.title}) == nil {
                            classified[0].Pills.append(item)
                        }
                        if classified[0].isExpanded == true {
                            let indexPath = IndexPath(row: classified[0].Pills.count - 1, section: 1)
                            indexPaths0.append(indexPath)
                            tableView.beginUpdates()
                            tableView.insertRows(at: indexPaths0, with: UITableViewRowAnimation.fade)
                            tableView.endUpdates()
                        }
                    } else if key == .점심 {
                        if classified[1].Pills.index(where: { $0.title == item.title}) == nil {
                            classified[1].Pills.append(item)
                        }
                        if classified[1].isExpanded == true{
                            let indexPath = IndexPath(row: classified[1].Pills.count - 1, section: 2)
                            indexPaths1.append(indexPath)
                            tableView.beginUpdates()
                            tableView.insertRows(at: indexPaths1, with: UITableViewRowAnimation.fade)
                            tableView.endUpdates()
                        }
                    } else if key == .저녁{
                        if classified[2].Pills.index(where: { $0.title == item.title}) == nil {
                            classified[2].Pills.append(item)
                        }
                        if classified[2].isExpanded == true{
                            let indexPath = IndexPath(row: classified[2].Pills.count - 1, section: 3)
                            indexPaths2.append(indexPath)
                            tableView.beginUpdates()
                            tableView.insertRows(at: indexPaths2, with: UITableViewRowAnimation.fade)
                            tableView.endUpdates()
                        }
                    }
                    print( " classified[0].Pills?.count : \(String(describing: classified[0].Pills.count - 1))")
                    print( " classified[1].Pills?.count : \(String(describing: classified[1].Pills.count - 1))")
                    print( " classified[2].Pills?.count : \(String(describing: classified[2].Pills.count - 1))")
                }
            }
            updateCheck = false
            print("PillList 분류")
        }
        
        print("화면 업데이트")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return classified.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if classified[section].isExpanded == false {
            return 0
        }
        
        print("행의 개수 : \(classified[section].Pills.count)")
        return classified[section].Pills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.homeImageView.image = UIImage(named: classified[indexPath.section].Pills[indexPath.row].iconName)
        cell.titleLabel.text = classified[indexPath.section].Pills[indexPath.row].title
        cell.memoLabel.text = classified[indexPath.section].Pills[indexPath.row].memo
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(habdleExpandClose))
        headerView.addGestureRecognizer(tap)
        headerView.leftHeaderImageView.image = UIImage(named: sectionImageNames[section])
        headerView.headerLabel.text = sectionNames[section]
        headerView.rightHeaderImageView.image = UIImage(named: "underChevron")
        headerView.headerLabel.tag = section
       
        return headerView
    }
    
    @objc func habdleExpandClose(sender: UITapGestureRecognizer) {
        
        let headerView  = sender.view as! HeaderView
        let section = headerView.headerLabel.tag
        
        if classified[section].Pills.count == 0 { return }
        
        let i = classified[section].Pills.count - 1
        var indexPaths = [IndexPath]()
        for row in 0...i{
            let indexPath = IndexPath(row: row, section: section)
            print(row, section)
            indexPaths.append(indexPath)
        }
        
        
        let isExpanded = classified[section].isExpanded
        classified[section].isExpanded = !isExpanded
        
        headerView.rightHeaderImageView.image = UIImage(named: isExpanded ? "underChevron" : "chevron")
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return heightOfHeader
    }

}
