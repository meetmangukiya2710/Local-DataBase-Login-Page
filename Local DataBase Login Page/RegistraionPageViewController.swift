//
//  RegistraionPageViewController.swift
//  Local DataBase Login Page
//
//  Created by R95 on 13/02/24.
//

import UIKit

class RegistraionPageViewController: UIViewController {
    
    var value = String()
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let myColor : UIColor = .black
        
        emailTextFieldOutlet.layer.borderWidth = 2
        emailTextFieldOutlet.layer.cornerRadius = 3
        emailTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        passwordTextFieldOutlet.layer.borderWidth = 2
        passwordTextFieldOutlet.layer.cornerRadius = 3
        passwordTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        RegitrationSqliteFile.createFile()
    }
    
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        if emailTextFieldOutlet.text == "" && passwordTextFieldOutlet.text == "" {
            alert(title: "Error!", msg: "Enter the Detail")
        }
        else if emailTextFieldOutlet.text == "" {
            alert(title: "Error!", msg: "Enter the E-mail")
        }
        else if passwordTextFieldOutlet.text == "" {
            alert(title: "Error!", msg: "Enter the Password")
        }
        else {
            RegitrationSqliteFile.addData(email: emailTextFieldOutlet.text ?? "", password: passwordTextFieldOutlet.text ?? "")
        }
    }
    
    func alert(title: String,msg: String) {
        let a = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .default))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        present(a, animated: true)
    }
    
}
