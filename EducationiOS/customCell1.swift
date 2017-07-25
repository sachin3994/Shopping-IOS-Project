//
//  customCell1.swift
//  EducationiOS
//
//  Created by MacStudent on 2017-07-20.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit

class customCell1: UITableViewCell {
    
    @IBOutlet weak var productImage1: UIImageView!
    @IBOutlet weak var productName1: UILabel!
    @IBOutlet weak var productPrice1: UILabel!
   
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
