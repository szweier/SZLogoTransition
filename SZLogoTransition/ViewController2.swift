//
//  ViewController2.swift
//  SZLogoTransition
//
//  Created by Steven Zweier on 2/24/16.
//  Copyright © 2016 StevenZweier. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setLeftBarButtonItem(UIBarButtonItem.init(title: "Exit Demo", style: UIBarButtonItemStyle.Plain, target: self, action: Selector.init("back")), animated: true)
        navigationItem.setRightBarButtonItem(UIBarButtonItem.init(title: "Present", style: UIBarButtonItemStyle.Plain, target: self, action: Selector.init("present")), animated: true)

        let bg = UIImageView.init(image: UIImage.init(named: "bg2"))
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

    func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func present() {
        let vc = ViewController()
        vc.view.backgroundColor = UIColor.blueColor()
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(vc, animated: true, completion: nil)
    }

}