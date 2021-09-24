//
//  ProductTableViewCell.swift
//  deneme
//
//  Created by ali kolukirik on 20.09.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabelId: UILabel!
    @IBOutlet weak var myLabelDescription: UILabel!

    public func configure(with title: String?,
                          imageURL: String?,
                          id: String?,
                          description: String?
    ){

        myLabel.text = "title: \(title ?? "")"
        myImageView.load(url: imageURL)
        myLabelId.text = "id: \(String(describing: id))"
        myLabelDescription.text = "description: \(description ?? "")"

    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
