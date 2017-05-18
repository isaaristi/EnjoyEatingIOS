//
//  RestauranteCell.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 17/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit

class RestauranteCell: UITableViewCell {

    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
