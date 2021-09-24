//
//  ViewController.swift
//  deneme
//
//  Created by ali kolukirik on 16.09.2021.
//

import UIKit
import Alamofire

struct Login: Encodable {
    let email: String
    let password: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textMail: UITextField!
    @IBOutlet weak var textPass: UITextField!
    @IBOutlet weak var alertButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func start(_ sender: Any) {
        self.navigateProductList()
        guard let textM = textMail.text, !textM.isEmpty else { return self.showAlert(message: "Mail Adresiniz Boş Olamaz")  }
        guard let textP = textPass.text, !textP.isEmpty else { return self.showAlert(message: "Şifreniz Boş Olamaz")}

        guard textP.count >= 1 else { return self.showAlert(message: "Şifreniz yeterli uzunlukta değil") }

        guard isEmailValid(email: textM) else { return self.showAlert(message: "Giriş Bilgilerinizi Kontrol Ediniz")}
        
        loginRequest(email: textM, password: textP)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Hata",
                                      message: message,
                                      preferredStyle: .alert)

        let action = UIAlertAction(title: "Tamam",
                                   style: .default,
                                   handler: nil)

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func isEmailValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func loginRequest(email: String, password: String) {
        
        let login = Login(email: email,
                          password: password)
        
        AF.request(
            "https://reqres.in/api/login",
            method: .post,
            parameters: login,
            encoder: JSONParameterEncoder.default)
            .response { response in
                debugPrint(response)
                self.navigateProductList()
            }
        self.navigateProductList()
    }
    
    func navigateProductList() {

        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })

        let nav1 = UINavigationController()
        let viewController = ProductListViewController(nibName: "ProductListViewController", bundle: nil)
        nav1.viewControllers = [viewController]
        window?.rootViewController = nav1
        window?.makeKeyAndVisible()
    }
}
