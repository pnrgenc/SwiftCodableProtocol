//
//  CryptoCellTableViewCell.swift
//  SwiftCodableProtocol
//
//  Created by Pınar Genç on 3.05.2020.
//  Copyright © 2020 Pınar Genç. All rights reserved.
//

import UIKit

class CryptoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
