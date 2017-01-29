//
//  CakeCell.swift
//  WaracleTest
//
//  Created by jonathan thornburg on 1/24/17.
//  Copyright © 2017 jonathan thornburg. All rights reserved.
//

import UIKit

class CakeCell: UITableViewCell {

    @IBOutlet weak var cakeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
