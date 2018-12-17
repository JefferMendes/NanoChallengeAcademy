//
//  DescriptionTableViewCell.swift
//  NanoChallengeAcademy
//
//  Created by Bruno Marques Monteiro on 14/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameDescriptionProduct: UILabel!
    @IBOutlet weak var placeDescriptionProduct: UILabel!
    @IBOutlet weak var priceDescriptionProduct: UILabel!
    @IBOutlet weak var dateDescriptionProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
