//
//  ChannelVC.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/6/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }

}
