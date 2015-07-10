//
//  ViewController.swift
//  VacationDestination
//
//  Created by DEV MODE on 7/7/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit
import CoreData
import MapKit

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
        destination1.name = "Tokyo"
        destination1.latt = 35.689487
        destination1.longi = 139.691706

        // ======================================

//        var destination2 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
//        destination2.name = "Golden Gate Bridge"
//        destination2.latt = 37.819929
//        destination2.longi = 122.478255

        context.save(nil) // save

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.destinations.count // returning the number of rows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var destination = self.destinations[indexPath.row]
        var cell = self.tableView.dequeueReusableCellWithIdentifier("mapCell") as! MapCell // creating a varibale for each one of the cells

        cell.nameLabel.text = destination.name // changes the label for each map

        var coordinate = CLLocationCoordinate2DMake(destination.latt.doubleValue, destination.longi.doubleValue) // createing coordinate setting from coreData

        var span = MKCoordinateSpanMake(destination.lattDelta.doubleValue, destination.longiDelta.doubleValue) // creating a zoom point

        var region = MKCoordinateRegionMake(coordinate, span) // setting the map to focus in on the region provided

        cell.mapView.setRegion(region, animated: false) //drawing of the map

        return cell // return the cell to render on the page
    }
}

