//
//  Destination.swift
//  VacationDestination
//
//  Created by DEV MODE on 7/7/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

import Foundation
import CoreData

class Destination: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var latt: NSNumber
    @NSManaged var longi: NSNumber
    @NSManaged var lattDelta: NSNumber
    @NSManaged var longiDelta: NSNumber

}
