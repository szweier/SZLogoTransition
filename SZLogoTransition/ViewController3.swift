//
//  ViewController3.swift
//  SZLogoTransition
//
//  Created by Steven Zweier on 2/25/16.
//  Copyright © 2016 StevenZweier. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        let bg = UIImageView.init(image: UIImage.init(named: "bg"))
        bg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bg)
        view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "|[bg]|",
                options: NSLayoutFormatOptions.AlignAllCenterX,
                metrics: nil,
                views: ["bg": bg]))
        view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|[bg]|",
                options: NSLayoutFormatOptions.AlignAllCenterY,
                metrics: nil,
                views: ["bg": bg]))
    }
}