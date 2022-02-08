//
//  TableViewCell.swift
//  CustomTableViewCell
//
//  Created by FordToni on 2022/2/7.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewCell: UIImageView!
    
    @IBOutlet weak var lblCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
