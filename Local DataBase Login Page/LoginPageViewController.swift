//
//  LoginPageViewController.swift
//  Local DataBase Login Page
//
//  Created by R95 on 13/02/24.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    var arr = [UserData]()
    
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let myColor : UIColor = .gray
        
        emailTextFieldOutlet.layer.borderWidth = 1
        emailTextFieldOutlet.layer.cornerRadius = 8
        emailTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        passwordTextFieldOutlet.layer.borderWidth = 1
        passwordTextFieldOutlet.layer.cornerRadius = 8
        passwordTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = UIColor(.gray).cgColor
        
        DBHelper.getData()
        arr = DBHelper.userArray
        print(arr)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        for i in arr {
            
            if emailTextFieldOutlet.text != i.email {
                registrationalert(title: "Error!", message: "your Email is Not Found.\n Please Registration your Acount")
            }
            else if passwordTextFieldOutlet.text != i.password {
                alert(title: "Error!", message: "Password is incorrect")
            }
            else if emailTextFieldOutlet.text == i.email && passwordTextFieldOutlet.text == i.password{
                navigate()
            }
            
        }
    }
    
    func navigate() {
        let navigate = storyboard?.instantiateViewController(identifier: "SuccessViewController") as! SuccessViewController
        
        present(navigate, animated: true)
    }
    
    func fail() {
        
    }
    
    func alert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        
        present(a, animated: true)
    }
    
    func registrationalert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .cancel,handler: { _ in
            let navigate = self.storyboard?.instantiateViewController(identifier: "RegistraionPageViewController") as! RegistraionPageViewController

            self.present(navigate, animated: true)
        }))
        
        
        present(a, animated: true)
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        
    }
    
}
