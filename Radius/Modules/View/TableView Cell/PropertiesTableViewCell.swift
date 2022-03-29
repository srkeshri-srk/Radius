//
//  PropertiesTableViewCell.swift
//  Radius
//
//  Created by Shreyansh Raj Keshri on 29/03/22.
//

import UIKit

class PropertiesTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var outerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureUI(data: Option) {
        titleLabel.text = data.name
        logoImageView.image = UIImage(named: data.icon)
    }
    
}
