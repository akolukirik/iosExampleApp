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

    let scientists: [String] =
        ["Ali Kuşçu",
         "Aziz Sancar",
         "Cahit Arf",
         "Piri Reis",
         "Katip Çelebi",
         "Hezarfen Ahmet Çelebi",
         "Farabi",
         "Feza Gürsoy",
         "Katip Çelebi",
         "Piri Reis",
         "Akşemsettin",
         "Ali Erdemir",
         "Hulusi Behçet",
         "Oktay Sinanoğlu",
         "Celal Şengör","Afet İnan",
         "Behram Kurşunoğlu",
         "Tahsin Özgüç",
         "Mehmet Öz",
         "Şerif Mardin"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        listRequest()
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = scientists[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scientists.count
    }

    func listRequest() {

        let parameters: String = ""

        AF.request("https://reqres.in/api/unknown",
                   method: .get,
                   parameters: parameters,
                   encoder: URLEncodedFormParameterEncoder.default)
            .response { response in
                debugPrint(response)
            }
    }
}
