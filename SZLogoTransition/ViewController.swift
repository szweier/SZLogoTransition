//
//  ViewController.swift
//  SZLogoTransition
//
//  Created by Steven Zweier on 2/24/16.
//  Copyright © 2016 StevenZweier. All rights reserved.
//

import UIKit
import SZLogoTransition

class ViewController: UIViewController {

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

        transition.isModal = true

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

        let navBar = UIView()
        navBar.backgroundColor = UIColor.whiteColor()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "|[navBar]|",
            options: NSLayoutFormatOptions.AlignAllCenterX,
            metrics: nil,
            views: ["navBar": navBar]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[navBar(64)]",
            options: NSLayoutFormatOptions.AlignAllCenterY,
            metrics: nil,
            views: ["navBar": navBar]))

        let button = UIButton.init(type: .Custom)
        button.setTitle("Dismiss", forState: .Normal)
        button.setTitleColor(UIColor.init(red: 45.0/255.0, green: 133.0/255.0, blue: 232.0/255.0, alpha: 1.0), forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(17)
        navBar.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        navBar.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "[button(100)]-(-10)-|",
            options: NSLayoutFormatOptions.AlignAllLeading,
            metrics: nil,
            views: ["button": button]))
        navBar.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[button]|",
            options: NSLayoutFormatOptions.AlignAllLeading,
            metrics: nil,
            views: ["button": button]))
        button.addTarget(self, action: Selector.init("dismiss"), forControlEvents: .TouchUpInside)

        self.transitioningDelegate = self
    }

    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate
{
    func animationControllerForPresentedController(
        presented: UIViewController,
        presentingController presenting: UIViewController,
        sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            transition.presenting = true
            transition.initialView = source.view

            return transition
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        transition.initialView = nil
        
        return transition
    }
}