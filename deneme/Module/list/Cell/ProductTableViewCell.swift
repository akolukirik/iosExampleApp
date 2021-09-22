//
//  ProductTableViewCell.swift
//  deneme
//
//  Created by ali kolukirik on 20.09.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    public func configure(with title: String, imageName: String){
        myLabel.text = title
        myImageView.image = UIImage(systemName: imageName)
    }

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet var myLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
