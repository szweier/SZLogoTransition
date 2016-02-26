[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SZLogoTransition.svg)](https://img.shields.io/cocoapods/v/SZMentionsSwift.svg)
[![Platform](https://img.shields.io/cocoapods/p/SZLogoTransition.svg?style=flat)](http://cocoadocs.org/docsets/SZMentionsSwift)
[![Twitter](https://img.shields.io/badge/twitter-@StevenZweier-blue.svg?style=flat)](http://twitter.com/StevenZweier)

SZLogoTransition is a transition that can be added to modal presentations or push pop transitions.

## How To Get Started

- [Download SZLogoTransition](https://github.com/szweier/SZLogoTransition/archive/master.zip) and try out the iOS example app. 

## Communication

- If you **need help**, feel free to tweet @StevenZweier
- If you **found a bug**, **have a feature request**, or **have a general question** open an issue.
- If you **want to contribute**, submit a pull request.

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) 

#### Podfile

To integrate SZMentionsSwift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

pod 'SZLogoTransition'
```

Then, run the following command:

```bash
$ pod install
```

## Requirements

| SZLogoTransition Version | Minimum iOS Target |
|:--------------------:|:---------------------------:||
| 0.0.x | iOS 8.1 |

## Usage

Create the transition animator


```objc
let transition = SZLogoTransitionAnimator.init(
        logo: UIImage.init(named: "signal")!,
        duration: 1.0,
        rotations: 5,
        yMaxScale: 200.0,
        xMaxScale: 200.0,
        yMinScale: 0.5,
        xMinScale: 0.5)
```
        
Set whether or not the transition is modal

`transition.isModal = true`

For modal presentation extend view controller as follows

```objc
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
```

For navigation transitions set the view controller to conform to the navigation controller delegate


`UINavigationControllerDelegate`

And implement the delegate method like so:

```objc
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
```
    

## Credits

SZLogoTransition was originally created by [Steven Zweier](http://twitter.com/StevenZweier)
