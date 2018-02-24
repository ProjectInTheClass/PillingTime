
import UIKit

class ListTableViewController: UITableViewController {
    
    let store = DataCenter.sharedInstnce
    
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if store.PillList.count != 0 {
            store.PillListTimeSync()
        }
        
        tableView.reloadData()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.PillList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.pill = store.PillList[indexPath.row]

        for item in store.PillList[indexPath.row].meridianCheckList {
            switch item.key {
            case .아침:
                if item.value == .check {
                    cell.morningButton.isSelected = true
                } else {
                    cell.morningButton.isSelected = false
                }
                cell.morningButton.isEnabled = true
            case .점심:
                if item.value == .check {
                    cell.lunchButton.isSelected = true
                } else {
                    cell.lunchButton.isSelected = false
                }
                cell.lunchButton.isEnabled = true
            case .저녁:
                if item.value == .check {
                    cell.dinnerButton.isSelected = true
                } else {
                    cell.dinnerButton.isSelected = false
                }
                cell.dinnerButton.isEnabled = true
            }
        }
        
        return cell
    }
    
        

    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            var i = 0
            
            let pill = store.PillList[indexPath.row]
            
            for item in store.classified {
                if let index = item.Pills.index(of: pill){
                    store.classified[i].Pills.remove(at: index)
                }
                i += 1
            }
            
            store.PillList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
