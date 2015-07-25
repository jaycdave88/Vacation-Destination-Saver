//
//  DestinationNameController.swift
//  VacationDestination
//
//  Created by DEV MODE on 7/24/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import UIKit

class DestinationNameController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // correct you is - yoda
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mapSegue"{
            let mapController = segue.destinationViewController as! MapViewController
            mapController.destinationName = self.nameTextField.text
        }
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }

}
