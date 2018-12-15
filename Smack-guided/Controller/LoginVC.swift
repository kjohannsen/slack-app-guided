//
//  LoginVC.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/10/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        
    }
    
    // MARK: Actions
    @IBAction func closedPressed(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        print("pressed")
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let email = userNameText.text , userNameText.text != "" else { return }
        guard let password = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
    
    // MARK: Functions
    func setUpView() {
        activityIndicator.isHidden = true
        
        userNameText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(LoginVC.tapToDismissKeyboard))
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc func tapToDismissKeyboard() {
        view.endEditing(true)
    }
    
}
