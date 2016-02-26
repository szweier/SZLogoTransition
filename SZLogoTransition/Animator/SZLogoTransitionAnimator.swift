//
//  Animator.swift
//  SZLogoTransition
//
//  Created by Steven Zweier on 2/24/16.
//  Copyright © 2016 StevenZweier. All rights reserved.
//

import UIKit

public class SZLogoTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    public var logo = UIImage.init(named: "signal")
    public var duration = 1.0
    public var rotations = 4.0
    public var yMaxScale :CGFloat = 40.0
    public var xMaxScale :CGFloat = 40.0
    public var yMinScale :CGFloat = 0.1
    public var xMinScale :CGFloat = 0.1
    public var presenting = false
    public var isModal = false
    public var initialView :UIView?

    public convenience init(logo: UIImage, duration: Double, rotations: Double,
        yMaxScale: CGFloat,
        xMaxScale: CGFloat,
        yMinScale: CGFloat,
        xMinScale: CGFloat) {
            self.init()
            self.logo = logo
            self.duration = duration
            self.rotations = rotations
            self.yMaxScale = yMaxScale
            self.xMaxScale = xMaxScale
            self.yMinScale = yMinScale
            self.xMinScale = xMinScale
    }

    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }

    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        let viewToPresent = transitionContext.viewForKey(UITransitionContextToViewKey)
        let presentingView = transitionContext.viewForKey(UITransitionContextFromViewKey)

        let scaleTransformGrow = CGAffineTransformMakeScale(xMaxScale, yMaxScale)
        let scaleTransformShrink = CGAffineTransformMakeScale(xMinScale, yMinScale)

        let rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = (M_PI * 2.0 /* full rotation*/ * rotations * duration) * (presenting ? 1 : -1)
        rotationAnimation.duration = duration

        var viewToAnimate: UIView?

        if (initialView != nil) {
            UIGraphicsBeginImageContext((initialView?.frame.size)!)
            initialView?.layer.renderInContext(UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let imageView = UIImageView.init(image: image)
            viewToAnimate = imageView
        } else {
            viewToAnimate = presentingView
        }
        viewToAnimate!.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")

        if (presenting) {
            containerView.addSubview(viewToPresent!)
            containerView.addSubview(viewToAnimate!)
        } else if (!isModal) {
            containerView.insertSubview(viewToPresent!, atIndex: 0)
        }

        let logoView = UIImageView.init(image: logo)
        let divisor = logoView.frame.size.width > logoView.frame.size.height ?
            logoView.frame.size.width / 10 :
            logoView.frame.size.height / 10
        logoView.frame = CGRectMake(
            0, 0, logoView.frame.size.width / divisor,
            logoView.frame.size.height / divisor)
        logoView.center = containerView.center

        containerView.addSubview(logoView)

        UIView.animateWithDuration(duration / 2, animations: { () -> Void in
            logoView.transform = scaleTransformGrow
            }) { (finished) -> Void in
                if finished {
                    UIView.animateWithDuration(
                        self.duration / 2,
                        animations: { () -> Void in
                            logoView.transform = scaleTransformShrink

                            if (!self.presenting) {
                                presentingView?.alpha = 0.0
                            } else {
                                viewToAnimate?.alpha = 0.0
                            }
                        }) { (finished) -> Void in
                            if finished {
                                if self.presenting {
                                    viewToAnimate?.removeFromSuperview()
                                    containerView.bringSubviewToFront(viewToPresent!)
                                }
                                logoView.removeFromSuperview()
                                transitionContext.completeTransition(true)
                            }
                    }
                }
        }
    }
}
