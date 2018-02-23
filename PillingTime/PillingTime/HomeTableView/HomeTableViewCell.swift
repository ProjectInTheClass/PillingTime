//
//  HomeTableViewCell.swift
//  PillingTime
//
//  Created by Enirobot on 2018. 2. 11..
//  Copyright © 2018년 Enirobot. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var pill: Pill? {
        didSet {
            guard let pill = pill else { return }
            
            self.homeImageView.image = UIImage(named: pill.iconName)
            self.titleLabel.text = pill.title
            self.memoLabel.text = pill.memo
            self.timeLabel.text = pill.detail
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
