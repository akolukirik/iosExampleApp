//
//  ProductTableViewCell.swift
//  deneme
//
//  Created by ali kolukirik on 20.09.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet var myLabel: UILabel!

    public func configure(with title: String?, imageURL: String?){
        myLabel.text = title
        myImageView.load(url: imageURL)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
