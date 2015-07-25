//
//  MapViewController.swift
//  VacationDestination
//
//  Created by DEV MODE on 7/24/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var map: MKMapView!
    var destinationName = ""
    var locationManager : CLLocationManager?
    var firstTime = true;
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager = CLLocationManager();
        self.locationManager?.requestWhenInUseAuthorization()

        self.locationManager?.delegate = self
        self.locationManager?.startUpdatingLocation() // proper way of starting looking for current location

//        self.map.showsUserLocation = true; // blue dot
        // Do any additional setup after loading the view.
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if self.firstTime{
            let region = MKCoordinateRegionMakeWithDistance(manager.location.coordinate, 20000, 20000);
            self.map.setRegion(region, animated: false)
            self.firstTime = false;
        }
    }

    @IBAction func saveTapped(sender: AnyObject) {

        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
        
                var destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
                destination1.name = self.destinationName
                destination1.latt = self.map.region.center.latitude
                destination1.longi = self.map.region.center.longitude
                destination1.lattDelta = self.map.region.span.latitudeDelta
                destination1.longiDelta = self.map.region.span.longitudeDelta
        
                context.save(nil)
            self.dismissViewControllerAnimated(true, completion: nil)
    }
}
