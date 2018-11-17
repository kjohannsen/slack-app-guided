//
//  CreateAccountVC.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/12/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    // MARK: Variables
    
    var avatarName = "profileDefault" // image name from the assets folder. This is if the user doesn't pick an image
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }

    // MARK: Actions
    
    @IBAction func createAccountPressed(_ sender: Any) {
        // First watch video 83, and then video 84 at around minute 10 for what goes in here after parsing JSON.
        guard let name = userNameText.text, userNameText.text != "" else { return }
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let password = passText.text , passText.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
