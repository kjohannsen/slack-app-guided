//
//  GradientView.swift
//  Smack-guided
//
//  Created by Kyle Johannsen on 10/7/18.
//  Copyright © 2018 Kyle Johannsen. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    // IBInspectable variables will add them to interface builder attributes inspector
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        // if the value has been set or changed, the layout in storyboard is updated.
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        // if the value has been set or changed, the layout in storyboard is updated.
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
