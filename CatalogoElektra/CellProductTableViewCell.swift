//
//  CellProductTableViewCell.swift
//  CatalogoElektra
//
//  Created by Salvador Gómez Moya on 21/06/23.
//

import UIKit

class CellProductTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameCell: UILabel!
    
    @IBOutlet weak var priceCell: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
