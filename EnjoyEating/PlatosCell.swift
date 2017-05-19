//
//  PlatosCell.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 18/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit

class PlatosCell: UITableViewCell {
    
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var ingredientes: UILabel!
    @IBOutlet weak var nombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
