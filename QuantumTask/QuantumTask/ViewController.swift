//
//  ViewController.swift
//  QuantumTask
//
//  Created by Medunan on 14/10/22.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let HomeVC = UINavigationController(rootViewController: HomeViewController())
    let SavedVC = UINavigationController(rootViewController: SavedViewController())
    let NotifyVC = UINavigationController(rootViewController: NotificationViewController())
    let ProfileVC = UINavigationController(rootViewController: ProfileViewController())
    let CartVC = UINavigationController(rootViewController: CartViewController())

    let tabBarImages = ["house","suit.heart","bell","person","cart"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        resetForm()
    
    }
    
    
    func resetForm() {
        loginButton.isEnabled = false
        
        emailError.isHidden = false
        passwordError.isHidden = false
        
        emailError.text = "*Required"
        passwordError.text = "*Required"
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        
        if let email = emailTextField.text {
            if let errorMessage = invalidEmail(email) {
                emailError.text = errorMessage
                emailError.isHidden = false
            } else {
                emailError.isHidden = true
            }
        }
        
        checkForVaidId()
    }
    
    func invalidEmail(_ value: String) -> String? {
        
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) {
            return "Invalid Email Address"
        }
        return nil
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        
        if let password = passwordTextField.text {
            if let errorMessage = invalidPassword(password) {
                passwordError.text = errorMessage
                passwordError.isHidden = false
            } else {
                passwordError.isHidden = true
            }
        }
        
        
        checkForVaidId()

    }
    
    func invalidPassword(_ value: String) -> String? {
        
        if value.count < 8 {
            return "Password Must Contain at least 8 characters"
        }
        
        let regularExpression =  "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$"

        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) {
            return "Password Must be Strong"
        }
        return nil
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    func checkForVaidId() {
        if emailError.isHidden && passwordError.isHidden {
            loginButton.isEnabled = true
        }
        else {
            loginButton.isEnabled = false
        }
    }
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        let tabBarVC = UITabBarController()
        
        HomeVC.title = "Home"
        SavedVC.title = "Saved"
        NotifyVC.title = "Notification"
        ProfileVC.title = "Profile"
        CartVC.title = "Cart"
        
        tabBarVC.setViewControllers([HomeVC,SavedVC,NotifyVC,ProfileVC,CartVC], animated: true)
        
        guard let toolbarItems = tabBarVC.tabBar.items else { return  }
    
        for x in 0..<toolbarItems.count {
            toolbarItems[x].image = UIImage(systemName: tabBarImages[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        
        resetForm()
    
    }
}

