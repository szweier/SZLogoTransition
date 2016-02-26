//
//  MainViewController.swift
//  SZLogoTransition
//
//  Created by Steven Zweier on 2/25/16.
//  Copyright © 2016 StevenZweier. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[table]|",
            options: NSLayoutFormatOptions.AlignAllCenterX,
            metrics: nil,
            views: ["table" : tableView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "|[table]|",
            options: NSLayoutFormatOptions.AlignAllLeading,
            metrics: nil,
            views: ["table" : tableView]))
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        var titleString : String?

        switch indexPath.row {
        case 0:
            titleString = "Modal Example"
            break
        case 1:
            titleString = "Navigation Controller Example"
            break
        default:
            break
        }

        cell!.textLabel?.text = titleString

        return cell!
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var pushVC : UIViewController?

        switch indexPath.row {
        case 0:
            let VC = ViewController2()
            pushVC = UINavigationController.init(rootViewController: VC)
            break
        case 1:
            let VC = ViewController4()
            pushVC = UINavigationController.init(rootViewController: VC)
            break
        default:
            break
        }
        self.navigationController?.presentViewController(pushVC!, animated: true, completion: nil)
    }
}
