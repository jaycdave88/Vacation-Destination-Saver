//
//  Destination.swift
//  
//
//  Created by DEV MODE on 7/7/15.
//
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
