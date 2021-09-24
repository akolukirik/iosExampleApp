//
//  ShowViewController.swift
//  deneme
//
//  Created by ali kolukirik on 22.09.2021.
//

import UIKit

class ShowViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label1: UILabel!

    @IBOutlet weak var label2: UILabel!

    @IBOutlet weak var label3: UILabel!

    var model: ProductModelResponse?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let model = model else { return }

        imageView.load(url: model.url)
        label1.text = model.title
        label2.text = model.welcomeDescription
        label3.text = model.maker
    }

    @IBAction func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
