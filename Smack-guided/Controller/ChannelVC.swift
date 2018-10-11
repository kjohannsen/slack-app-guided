//
//  ChannelVC.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/6/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    // MARK: Actions
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
}
