//
//  ViewController.swift
//  VacationDestination
//
//  Created by DEV MODE on 7/7/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView! // linking the table view 

    var destinations : [Destination] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // correct you is - yoda

        self.tableView.dataSource = self // needed for table view
        self.tableView.delegate = self // needed for table view

        createTestDestinations() // calling function
    }


    override func viewWillAppear(animated: Bool) {
        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        var request = NSFetchRequest(entityName: "Destination")
        self.destinations = context.executeFetchRequest(request, error: nil)! as! [Destination]
        self.tableView.reloadData()

    }

    func createTestDestinations(){
        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!

        var destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
        destination1.name = "Tokoy"

        // ======================================

        var destination2 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
        destination2.name = "Provo"

        context.save(nil) // save

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.destinations.count // returning the number of rows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var destination = self.destinations[indexPath.row]
        var cell = UITableViewCell() // creating a varibale for each one of the cells
        cell.textLabel?.text = destination.name // changing the text of each one of the rows to show some text
        return cell // return the cell to render on the page
    }
}

