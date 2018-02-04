//
//  HomeTableViewCell.swift
//  PillingTime
//
//  Created by Enirobot on 2018. 2. 3..
//  Copyright © 2018년 Enirobot. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeLable: UILabel!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeTableViewCell {
    func setCollectionsViewDataSourceDelegate
        <D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate:D, forRow row: Int){
        homeCollectionView.delegate = dataSourceDelegate
        homeCollectionView.dataSource = dataSourceDelegate
        
        homeCollectionView.reloadData()
    }
}
