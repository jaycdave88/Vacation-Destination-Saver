//
//  ViewController.swift
//  VacationDestination
//
//  Created by DEV MODE on 7/7/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView! // linking the table view 

    override func viewDidLoad() {
        super.viewDidLoad()
        // correct you is - yoda

        self.tableView.dataSource = self // needed for table view
        self.tableView.delegate = self // needed for table view
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // returning the number of rows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell() // creating a varibale for each one of the cells
        cell.textLabel?.text = "testing" // changing the text of each one of the rows to show some text
        return cell // return the cell to render on the page
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // memory override
    }
}

