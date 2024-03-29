//
//  AddTableViewController.swift
//  PillingTime
//
//  Created by Enirobot on 2018. 2. 1..
//  Copyright © 2018년 Enirobot. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
    
    var sectionsType: [[ToDoSectionType]] = [[.image, .title, .memo],
                                                     [.alarmAdd]]
    
    var titleTextField: UITextField?
    var memoTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    /*
    func save() {
        guard let title = titleTextField?.text else { return }
        guard let memo = memoTextField?.text else { return }
        
    }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionsType.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return sectionsType[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sectionsType[indexPath.section]
        
        switch sectionType[indexPath.row] {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddImageTableViewCell", for: indexPath) as! AddImageTableViewCell
            return cell
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddTitleTableViewCell", for: indexPath) as! AddTitleTableViewCell
            //titleTextField = cell.AddTitleTextField
            return cell
        case .memo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddMemoTableViewCell", for: indexPath) as! AddMemoTableViewCell
            //memoTextField = cell.AddMemoTextField
            return cell
        case .alarmAdd:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddAlarmTableViewCell", for: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Information"
        } else {
            return "Alarm"
        }
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
