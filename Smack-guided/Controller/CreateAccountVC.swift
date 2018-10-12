//
//  CreateAccountVC.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/12/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: Actions
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
