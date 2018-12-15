//
//  AddChannelVC.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 12/1/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        // Do any additional setup after loading the view.
    }

    // MARK: Actions
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTextField.text, nameTextField.text != "" else { return }
        // Since a description isn't required, it's okay if it's an empty string
        guard let channelDescription = descriptionTextField.text else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // MARK: Functions
    func setUpView() {
        let bgViewTap = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.bgViewTapped(_:)))
        bgView.addGestureRecognizer(bgViewTap)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
    }
    
    @objc func bgViewTapped(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    

}
