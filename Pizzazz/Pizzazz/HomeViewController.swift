//
//  HomeViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var w: CGFloat!
    var h: CGFloat!
    
    typealias CellType = ClassViewCell
    private struct Main {
        static let CellIdentifier = "cell"
        static let CellClass = ClassViewCell.self
    }
    
     let sections = ["Active Classes", "Inactive Classes"]
     let dummyTitles = ["Class 1", "Class 2", "Class 3"]
     let dummySubtitles = ["Class One", "Class Two", "Class Three"]
     let dummyText = "University of Drumpf, Main Campus (America, United States of), Spring 2016"
    
    func add() {
        print("add pressed")
    }
    
    func addToolbar() {
        let toolbar = UIToolbar()
        toolbar.barTintColor = UIColor(white: 0.95, alpha: 1.0)
        
        let moreButton = UIButton()
        moreButton.setBackgroundImage(UIImage(named: "More500"), forState: .Normal)
        moreButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        moreButton.addTarget(self, action: nil, forControlEvents: .TouchUpInside)
        
        let accountButton = UIButton()
        accountButton.setTitle("Account", forState: .Normal)
        accountButton.titleLabel?.font = UIFont(name: "Helvetica", size: 10)
        accountButton.setTitleColor(UIColor(rgb: 0x3e7aab), forState: .Normal)
        accountButton.addTarget(self, action: nil, forControlEvents: .TouchUpInside)
        accountButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        
        let item1 = UIBarButtonItem(customView: moreButton)
        let item2 = UIBarButtonItem(customView: accountButton)
        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        
        toolbar.setItems([item1, spacer, item2], animated: true)
        view.addUIElement(toolbar, frame: CGRect(x: 0, y: h-30, width: w, height: 30))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        
        w = view.bounds.size.width
        h = view.bounds.size.height
        navigationItem.title = "Classes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add")
        navigationItem.setRightBarButtonItem(addButton, animated: true)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h))
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(Main.CellClass,
                                forCellReuseIdentifier: Main.CellIdentifier)
        // tableView.separatorStyle = .None
        tableView.rowHeight = 102
        view.addSubview(tableView)
        addToolbar()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTitles.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewCell()
        headerView.backgroundColor = UIColor(rgb: 0xeff0f1)
        let text = sections[section]
        let font = UIFont(name: "HelveticaNeue", size: 12)
        headerView.textLabel?.text = text
        headerView.textLabel?.font = font
        return headerView
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(Main.CellIdentifier, forIndexPath: indexPath) as! CellType
            // cell.selectionStyle = .None
            // let section = indexPath.section
            cell.titleLabel.text = dummyTitles[indexPath.item]
            cell.subtitleLabel.text = dummySubtitles[indexPath.item]
            cell.bodyLabel.text = dummyText
            return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dest = BoardViewController()
        let titleText = dummyTitles[indexPath.item]
        dest.navigationItem.title = titleText
        navigationController?.pushViewController(dest, animated: true)
    }


}

