//
//  AddTimePickerViewController.swift
//  PillingTime
//
//  Created by Enirobot on 2018. 2. 7..
//  Copyright © 2018년 Enirobot. All rights reserved.
//

import UIKit

class AddTimePickerViewController: UITableViewController {
    
    
    
    @IBAction func modalDismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
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
    
}
