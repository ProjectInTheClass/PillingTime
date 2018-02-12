//
//  SettingTableViewController.swift
//  PillingTime
//
//  Created by Enirobot on 2018. 2. 8..
//  Copyright © 2018년 Enirobot. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    private var dateCellExpanded1: Bool = false
    private var dateCellExpanded2: Bool = false
    private var dateCellExpanded3: Bool = false

    @IBAction func modalDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 0 {
            if dateCellExpanded1 {
                dateCellExpanded1 = false
            } else {
                dateCellExpanded1 = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        
        if indexPath.row == 1 && indexPath.section == 0 {
            if dateCellExpanded2 {
                dateCellExpanded2 = false
            } else {
                dateCellExpanded2 = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        
        if indexPath.row == 2 && indexPath.section == 0 {
            if dateCellExpanded3 {
                dateCellExpanded3 = false
            } else {
                dateCellExpanded3 = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            if dateCellExpanded1 {
                return 210
            } else {
                return 40
            }
        }
        
        if indexPath.row == 1 && indexPath.section == 0 {
            if dateCellExpanded2 {
                return 210
            } else {
                return 40
            }
        }
        
        if indexPath.row == 2 && indexPath.section == 0 {
            if dateCellExpanded3 {
                return 210
            } else {
                return 40
            }
        }
        return 40
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
