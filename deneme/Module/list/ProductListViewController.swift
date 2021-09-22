//
//  ProductListViewController.swift
//  deneme
//
//  Created by ali kolukirik on 20.09.2021.
//

import UIKit
import Alamofire

class ProductListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var productList: [ProductModelResponse]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        listRequest()
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell else { return UITableViewCell()}

        guard let model = productList?[indexPath.row] else { return UITableViewCell()}

        cell.configure(with: model.title,
                       imageURL: model.img,
                       id: model.id,
                       description: model.welcomeDescription
        )
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList?.count ?? 0
    }

    func listRequest() {
        AF.request("https://alikk.free.beeceptor.com/list",
                   method: .get)
            .responseDecodable(of: [ProductModelResponse].self) { [weak self] response in
                if let models = response.value {
                    self?.productList = models
                    self?.tableView.reloadData()
                }
            }
    }



}
