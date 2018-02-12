
import UIKit

var heightOfHeader : CGFloat = 50

var PillList: [Pill] = []
var classified: [ExpandableSection] = []
var HomeUpdateCheck = false
var TimeLineUpdateCheck = false

class HomeTableViewController: UITableViewController {
    
    let sectionImageNames = ["sunrise", "sun", "misty-day"]
    let sectionNames = ["아침", "점심", "저녁"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(xib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 62
        
        classified =  [ ExpandableSection(meridian: .아침, isExpanded: false, Pills: []),
                        ExpandableSection(meridian: .점심, isExpanded: false, Pills: []),
                        ExpandableSection(meridian: .저녁, isExpanded: false, Pills: [])]
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if PillList.count != 0 && HomeUpdateCheck == true {
            
            for item in PillList {
                for key in item.meridianCheckList.keys {
                    if key == .아침 {
                        if classified[0].Pills.index(where: { $0 == item }) == nil {
                            classified[0].Pills.append(item)
                        }
                    } else if key == .점심 {
                        if classified[1].Pills.index(where: { $0 == item }) == nil {
                            classified[1].Pills.append(item)
                        }
                    } else if key == .저녁{
                        if classified[2].Pills.index(where: { $0 == item }) == nil {
                            classified[2].Pills.append(item)
                        }
                    }
                }
            }
            HomeUpdateCheck = false
        }
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return classified.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if classified[section].isExpanded == false {
            return 0
        }
        
        return classified[section].Pills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let tap = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        
        cell.homeImageView.image = UIImage(named: classified[indexPath.section].Pills[indexPath.row].iconName)
        cell.titleLabel.text = classified[indexPath.section].Pills[indexPath.row].title
        cell.memoLabel.text = classified[indexPath.section].Pills[indexPath.row].memo
        cell.timeLabel.text = classified[indexPath.section].Pills[indexPath.row].detail
        cell.checkImage.tag = indexPath.section
        cell.homeImageView.tag = indexPath.row
        
        cell.addGestureRecognizer(tap)
        
        return cell
    }
    
    @objc func cellTapped(sender: UITapGestureRecognizer) {
        let cell = sender.view as! HomeTableViewCell
        let section = cell.checkImage.tag
        let row = cell.homeImageView.tag
        
        var index: Meridian
        switch  section{
        case 0:
            index = .아침
        case 1:
            index = .점심
        default:
            index = .저녁
        }
        
        if classified[section].Pills[row].meridianCheckList[index] == .uncheck {
            classified[section].Pills[row].meridianCheckList[index] = .check
            cell.checkImage.image = UIImage(named: "Checked")
        } else {
            classified[section].Pills[row].meridianCheckList[index] = .uncheck
            cell.checkImage.image = UIImage(named: "Unchecked Light")
        }
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            classified[indexPath.section].Pills.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
