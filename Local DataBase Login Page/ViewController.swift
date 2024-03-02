//
//  ViewController.swift
//  Local DataBase Login Page
//
//  Created by R95 on 13/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var registrionButtonOutlet: UIButton!
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        DBHelper.createFile()
    }
    
    func design() {
        registrionButtonOutlet.layer.borderWidth = 2
        registrionButtonOutlet.layer.borderColor = UIColor(.black).cgColor
        registrionButtonOutlet.layer.cornerRadius = 5
    }
    
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        let naviget = storyboard?.instantiateViewController(identifier: "RegistraionPageViewController") as! RegistraionPageViewController
        
        navigationController?.pushViewController(naviget, animated: true)
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
}

