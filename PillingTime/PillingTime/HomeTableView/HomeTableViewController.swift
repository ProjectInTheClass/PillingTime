
import UIKit

class HomeTableViewController: UITableViewController {
    
    var PillList = [
        ExpandableSection(isExpanded: true, Pills:  [Pill(imageName: "a_drugs", title: "감기약", memo: "얼른 낫자", meridianList: [.아침, .점심, .저녁], subTime: "식후1시간"),
                                                     Pill(imageName: "a_drugs", title: "모기약", memo: "얼른 잡자", meridianList: [.아침, .점심, .저녁], subTime: "식후1시간")])
        ]
    

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
        return PillList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if !PillList[section].isExpanded {
            return 0
        }
        
        return PillList[section].Pills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.homeImageView.image = UIImage(named: PillList[indexPath.section].Pills[indexPath.row].imageName)
        cell.titleLabel.text = PillList[indexPath.section].Pills[indexPath.row].title
        cell.memoLabel.text = PillList[indexPath.section].Pills[indexPath.row].memo
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: . normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.tag = section
        
        button.addTarget(self, action: #selector(habdleExpandClose), for: .touchUpInside)
        return button
    }
    
    @objc func habdleExpandClose(button: UIButton) {
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in PillList[section].Pills.indices{
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = PillList[section].isExpanded
        PillList[section].isExpanded = !isExpanded
        
        button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
