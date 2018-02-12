
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
//        var indexPaths = [IndexPath]()
//        var i = 0
//
//        if updateCheck == true {
//            for _ in PillList {
//                let indexPath = IndexPath(row: i, section: 0)
//                indexPaths.append(indexPath)
//                i += 1
//            }
//
//            tableView.beginUpdates()
//            tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.fade)
//            tableView.endUpdates()
//        }
        
    }

}
