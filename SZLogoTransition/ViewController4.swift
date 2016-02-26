//
//  ViewController4.swift
//  SZLogoTransition
//
//  Created by Steven Zweier on 2/25/16.
//  Copyright © 2016 StevenZweier. All rights reserved.
//

import UIKit
import SZLogoTransition

class ViewController4: UIViewController, UINavigationControllerDelegate {
    let transition = SZLogoTransitionAnimator.init(
        logo: UIImage.init(named: "signal")!,
        duration: 1.0,
        rotations: 5,
        yMaxScale: 200.0,
        xMaxScale: 200.0,
        yMinScale: 0.5,
        xMinScale: 0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setLeftBarButtonItem(UIBarButtonItem.init(title: "Exit Demo", style: UIBarButtonItemStyle.Plain, target: self, action: Selector.init("back")), animated: true)
        navigationItem.setRightBarButtonItem(UIBarButtonItem.init(title: "Push", style: UIBarButtonItemStyle.Plain, target: self, action: Selector.init("push")), animated: true)
        
        transition.isModal = false

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

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.delegate = self
    }

    func push() {
        let vc = ViewController3()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func back() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (operation == UINavigationControllerOperation.Push) {
            transition.presenting = true
            transition.initialView = fromVC.view
        } else if (operation == UINavigationControllerOperation.Pop) {
            transition.presenting = false
            transition.initialView = nil
        }

        return transition
    }
}
