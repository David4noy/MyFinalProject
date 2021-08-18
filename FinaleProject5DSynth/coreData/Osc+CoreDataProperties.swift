//
//  Osc+CoreDataProperties.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 17/08/2021.
//
//

import Foundation
import CoreData


extension Osc {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Osc> {
        return NSFetchRequest<Osc>(entityName: "Osc")
    }

    @NSManaged public var attack: Float
    @NSManaged public var decay: Float
    @NSManaged public var sustain: Float
    @NSManaged public var releaseEnvelope: Float

}

extension Osc : Identifiable {

}
