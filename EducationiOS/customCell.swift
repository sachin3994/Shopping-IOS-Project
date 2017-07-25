//
//  customCell.swift
//  EducationiOS
//
//  Created by Sachin on 7/19/17.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
           
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
