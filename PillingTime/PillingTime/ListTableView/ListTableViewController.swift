
import UIKit

class ListTableViewController: UITableViewController {
    
    @IBAction func tabButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
        } else {
            sender.isSelected = true
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PillList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        cell.listImageView.image = UIImage(named: PillList[indexPath.row].iconName)
        cell.titleLabel.text = PillList[indexPath.row].title
        cell.memoLabel.text = PillList[indexPath.row].memo
        cell.titleLabel.tag = indexPath.section
        cell.memoLabel.tag = indexPath.row
        
        for item in PillList[indexPath.row].meridianCheckList {
            switch item.key {
            case .아침:
                if item.value == .check {
                    cell.morningButton.isSelected = true
                } else {
                    cell.morningButton.isSelected = false
                }
            case .점심:
                if item.value == .check {
                    cell.lunchButton.isSelected = true
                } else {
                    cell.lunchButton.isSelected = false
                }
            case .저녁:
                if item.value == .check {
                    cell.dinnerButton.isSelected = true
                } else {
                    cell.dinnerButton.isSelected = false
                }
            }
        }
        return cell
    }
    
    
    
    
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            var i = 0
            for item in classified {
                if let index = item.Pills.index(where: { $0 == PillList[indexPath.row]}){
                    classified[i].Pills.remove(at: index)
                }
                i += 1
            }
            
            PillList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
