//
//  SynthData+CoreDataClass.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 18/08/2021.
//
//

import Foundation
import CoreData


public class SynthData: NSManagedObject {
    public static func builder () -> SynthData {
        let o = NSEntityDescription.insertNewObject(forEntityName: "SynthData", into: CoreDataManager.shared.persistentContainer.viewContext) as! SynthData
//        o.hermonizerOnOff = true
//        print(o.hermonizerOnOff)
        CoreDataManager.shared.saveContext()
        return o
    }
}
